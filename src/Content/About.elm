module Content.About exposing (About, defaultAbout)

import BackendTask exposing (BackendTask)
import BackendTask.File as File
import BackendTask.Glob as Glob
import Dict exposing (Dict)
import FatalError exposing (FatalError)
import Json.Decode as Decode


type alias About =
    { body : String
    , name : String
    , avatar : Maybe String
    , socials : List ( String, String )
    , occupation : Maybe String
    , company : Maybe String
    , slug : String
    }


aboutFiles : String -> BackendTask error (List { filePath : String, language : String, slug : String })
aboutFiles lang =
    Glob.succeed
        (\filePath language fileName ->
            { filePath = filePath
            , language = language
            , slug = fileName
            }
        )
        |> Glob.captureFilePath
        |> Glob.match (Glob.literal "content/")
        |> Glob.capture (Glob.literal lang)
        |> Glob.match (Glob.literal "/about/")
        |> Glob.capture Glob.wildcard
        |> Glob.match (Glob.literal ".md")
        |> Glob.toBackendTask


aboutDecoder : String -> String -> Decode.Decoder About
aboutDecoder slug body =
    Decode.map6 (About body)
        (Decode.field "name" Decode.string)
        (Decode.maybe <| Decode.field "avatar" Decode.string)
        (Decode.map (Maybe.withDefault []) <| Decode.maybe <| Decode.field "socials" <| Decode.keyValuePairs Decode.string)
        (Decode.maybe <| Decode.field "occupation" Decode.string)
        (Decode.maybe <| Decode.field "company" Decode.string)
        (Decode.succeed slug)


defaultAbout : String -> BackendTask { fatal : FatalError, recoverable : File.FileReadError Decode.Error } About
defaultAbout lang =
    let
        path =
            if lang == "" then
                "content/en/about/default.md"

            else
                "content/" ++ lang ++ "/about/default.md"
    in
    File.bodyWithFrontmatter (aboutDecoder "default") path
