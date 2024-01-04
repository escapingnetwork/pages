module Content.Services exposing
    ( Metadata
    , Service
    , allServices
    , serviceFromSlug
    )

import Array
import BackendTask exposing (BackendTask)
import BackendTask.Env
import BackendTask.File as File
import BackendTask.Glob as Glob
import Dict exposing (Dict)
import FatalError exposing (FatalError)
import Json.Decode as Decode exposing (Decoder)
import Json.Decode.Extra as Decode
import List.Extra
import String.Normalize


type alias Service =
    { service : Metadata
    , body : String
    , previousService : Maybe Metadata
    , nextService : Maybe Metadata
    }


type alias Metadata =
    { title : String
    , slug : String
    , image : Maybe String
    , description : Maybe String
    }


allServices : BackendTask FatalError (List Service)
allServices =
    let
        addPreviousNextServices orderedServices =
            orderedServices
                |> BackendTask.map Array.fromList
                |> BackendTask.map
                    (\services ->
                        Array.indexedMap
                            (\index service ->
                                { service
                                    | previousService =
                                        (if Array.get (index + 1) services == Nothing then
                                            Array.get (index - 2) services

                                         else
                                            Array.get (index + 1) services
                                        )
                                            |> Maybe.map .service
                                    , nextService =
                                        (if Array.get (index - 1) services == Nothing then
                                            Array.get (index + 2) services

                                         else
                                            Array.get (index - 1) services
                                        )
                                            |> Maybe.map .service
                                }
                            )
                            services
                    )
                |> BackendTask.map Array.toList
    in
    BackendTask.map
        (\blogposts ->
            List.map
                (\file ->
                    file.filePath
                        |> File.bodyWithFrontmatter
                            (\markdownString ->
                                Decode.map2 (\metadata body -> Service metadata body Nothing Nothing)
                                    (metadataDecoder file.slug)
                                    (Decode.succeed markdownString)
                            )
                        |> BackendTask.allowFatal
                )
                blogposts
        )
        serviceFiles
        |> BackendTask.resolve
        |> addPreviousNextServices


allServicesDict : BackendTask FatalError (Dict String Service)
allServicesDict =
    allServices |> BackendTask.map (\services -> List.map (\service -> ( service.service.slug, service )) services |> Dict.fromList)


serviceFiles : BackendTask error (List { filePath : String, slug : String })
serviceFiles =
    Glob.succeed
        (\filePath fileName ->
            { filePath = filePath
            , slug = fileName
            }
        )
        |> Glob.captureFilePath
        |> Glob.match (Glob.literal "content/services/")
        |> Glob.capture Glob.wildcard
        |> Glob.match (Glob.literal ".md")
        |> Glob.toBackendTask


metadataDecoder : String -> Decoder Metadata
metadataDecoder slug =
    Decode.succeed Metadata
        |> Decode.andMap (Decode.field "name" Decode.string)
        |> Decode.andMap
            (Decode.map
                (Maybe.withDefault slug >> String.Normalize.slug)
                (Decode.maybe (Decode.field "slug" Decode.string))
            )
        |> Decode.andMap (Decode.maybe (Decode.field "image" Decode.string))
        |> Decode.andMap (Decode.maybe (Decode.field "description" Decode.string))


serviceFromSlug : String -> BackendTask FatalError Service
serviceFromSlug slug =
    allServicesDict
        |> BackendTask.andThen
            (\serviceDict ->
                Dict.get slug serviceDict
                    |> Maybe.map BackendTask.succeed
                    |> Maybe.withDefault (BackendTask.fail <| FatalError.fromString <| "Unable to find service with slug " ++ slug)
            )
