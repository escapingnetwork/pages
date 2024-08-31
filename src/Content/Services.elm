module Content.Services exposing
    ( Metadata
    , Service
    , allServices
    , allServicesLang
    , serviceFromLangSlug
    , serviceFromSlug
    )

import Array
import Array.Extra
import BackendTask exposing (BackendTask)
import BackendTask.File as File
import BackendTask.Glob as Glob
import Dict exposing (Dict)
import FatalError exposing (FatalError)
import Json.Decode as Decode exposing (Decoder)
import Json.Decode.Extra as Decode
import String.Normalize


type alias Service =
    { metadata : Metadata
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


allServicesLang : BackendTask FatalError (List { language : String, service : Service })
allServicesLang =
    let
        -- Array.Extra.removeWhen (\s -> s.service.metadata.slug == slug) <|
        getLangService slug lang serviceArray =
            Array.Extra.removeWhen (\service -> service.language /= lang) serviceArray

        addPreviousNextServices orderedServices =
            orderedServices
                |> BackendTask.map Array.fromList
                |> BackendTask.map
                    (\languageServices ->
                        Array.indexedMap
                            (\index languageService ->
                                let
                                    s =
                                        languageService.service

                                    filteredArray =
                                        getLangService s.metadata.slug languageService.language languageServices
                                in
                                { language = languageService.language
                                , service =
                                    { s
                                        | previousService =
                                            ((if Array.get (modBy 3 (index + 1)) filteredArray == Nothing then
                                                Array.get (modBy 3 (index - 2)) filteredArray

                                              else
                                                Array.get (modBy 3 (index + 1)) filteredArray
                                             )
                                                |> Maybe.map .service
                                            )
                                                |> Maybe.map .metadata
                                        , nextService =
                                            ((if Array.get (modBy 3 (index - 1)) filteredArray == Nothing then
                                                Array.get (modBy 3 (index + 1)) filteredArray

                                              else
                                                Array.get (modBy 3 (index - 1)) filteredArray
                                             )
                                                |> Maybe.map .service
                                            )
                                                |> Maybe.map .metadata
                                    }
                                }
                            )
                            languageServices
                    )
                |> BackendTask.map Array.toList
    in
    BackendTask.map
        (\service ->
            List.map
                (\file ->
                    file.filePath
                        |> File.bodyWithFrontmatter
                            (\markdownString ->
                                Decode.map2
                                    (\metadata body ->
                                        { language = file.language
                                        , service = Service metadata body Nothing Nothing
                                        }
                                    )
                                    (metadataDecoder file.slug)
                                    (Decode.succeed markdownString)
                            )
                        |> BackendTask.allowFatal
                )
                service
        )
        serviceFilesLang
        |> BackendTask.resolve
        |> addPreviousNextServices


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
                                            |> Maybe.map .metadata
                                    , nextService =
                                        (if Array.get (index - 1) services == Nothing then
                                            Array.get (index + 2) services

                                         else
                                            Array.get (index - 1) services
                                        )
                                            |> Maybe.map .metadata
                                }
                            )
                            services
                    )
                |> BackendTask.map Array.toList
    in
    BackendTask.map
        (\service ->
            List.map
                (\file ->
                    file.filePath
                        |> File.bodyWithFrontmatter
                            (\markdownString ->
                                Decode.map2
                                    (\metadata body ->
                                        Service metadata body Nothing Nothing
                                    )
                                    (metadataDecoder file.slug)
                                    (Decode.succeed markdownString)
                            )
                        |> BackendTask.allowFatal
                )
                service
        )
        serviceFiles
        |> BackendTask.resolve
        |> addPreviousNextServices


allServicesLangDict : BackendTask FatalError (Dict String Service)
allServicesLangDict =
    allServicesLang |> BackendTask.map (\services -> List.map (\service -> ( service.service.metadata.slug ++ service.language, service.service )) services |> Dict.fromList)


allServicesDict : BackendTask FatalError (Dict String Service)
allServicesDict =
    allServices |> BackendTask.map (\services -> List.map (\service -> ( service.metadata.slug, service )) services |> Dict.fromList)


serviceFilesLang : BackendTask error (List { filePath : String, language : String, slug : String })
serviceFilesLang =
    Glob.succeed
        (\filePath language fileName ->
            { filePath = filePath
            , language = language
            , slug = fileName
            }
        )
        |> Glob.captureFilePath
        |> Glob.match (Glob.literal "content/")
        |> Glob.capture Glob.wildcard
        |> Glob.match (Glob.literal "/services/")
        |> Glob.capture Glob.wildcard
        |> Glob.match (Glob.literal ".md")
        |> Glob.toBackendTask


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


serviceFromLangSlug : String -> String -> BackendTask FatalError Service
serviceFromLangSlug lang slug =
    allServicesLangDict
        |> BackendTask.andThen
            (\serviceDict ->
                Dict.get (slug ++ lang) serviceDict
                    |> Maybe.map BackendTask.succeed
                    |> Maybe.withDefault (BackendTask.fail <| FatalError.fromString <| "Unable to find service with slug " ++ slug)
            )
