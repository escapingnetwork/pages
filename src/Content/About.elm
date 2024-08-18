module Content.About exposing (Author, allAuthors, defaultAuthor)

import BackendTask exposing (BackendTask)
import BackendTask.File as File
import BackendTask.Glob as Glob
import Dict exposing (Dict)
import FatalError exposing (FatalError)
import Json.Decode as Decode


type alias Author =
    { body : String
    , name : String
    , avatar : Maybe String
    , socials : List ( String, String )
    , occupation : Maybe String
    , company : Maybe String
    , slug : String
    }


authorFiles : BackendTask error (List { filePath : String, language : String, slug : String })
authorFiles =
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
        |> Glob.match (Glob.literal "/authors/")
        |> Glob.capture Glob.wildcard
        |> Glob.match (Glob.literal ".md")
        |> Glob.toBackendTask


allAuthors : BackendTask FatalError (Dict String Author)
allAuthors =
    authorFiles
        |> BackendTask.map
            (List.map
                (\file ->
                    file.filePath
                        |> File.bodyWithFrontmatter (authorDecoder file.slug)
                        |> BackendTask.map (\author -> ( author.slug, author ))
                )
            )
        |> BackendTask.resolve
        |> BackendTask.allowFatal
        |> BackendTask.map Dict.fromList


authorDecoder : String -> String -> Decode.Decoder Author
authorDecoder slug body =
    Decode.map6 (Author body)
        (Decode.field "name" Decode.string)
        (Decode.maybe <| Decode.field "avatar" Decode.string)
        (Decode.map (Maybe.withDefault []) <| Decode.maybe <| Decode.field "socials" <| Decode.keyValuePairs Decode.string)
        (Decode.maybe <| Decode.field "occupation" Decode.string)
        (Decode.maybe <| Decode.field "company" Decode.string)
        (Decode.succeed slug)


defaultAuthor : String -> BackendTask { fatal : FatalError, recoverable : File.FileReadError Decode.Error } Author
defaultAuthor lang =
    let
        path =
            if lang == "" then
                "content/en/authors/default.md"

            else
                "content/" ++ lang ++ "/authors/default.md"
    in
    File.bodyWithFrontmatter (authorDecoder "default") path
