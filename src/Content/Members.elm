module Content.Members exposing (Member, allMembers, defaultMember)

import BackendTask exposing (BackendTask)
import BackendTask.File as File
import BackendTask.Glob as Glob
import Dict exposing (Dict)
import FatalError exposing (FatalError)
import Json.Decode as Decode


type alias Member =
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
        |> Glob.match (Glob.literal "/members/")
        |> Glob.capture Glob.wildcard
        |> Glob.match (Glob.literal ".md")
        |> Glob.toBackendTask


allMembers : BackendTask FatalError (List { language : String, member : Member })
allMembers =
    authorFiles
        |> BackendTask.map
            (List.map
                (\file ->
                    file.filePath
                        |> File.bodyWithFrontmatter (memberDecoder file.slug)
                        |> BackendTask.map (\member -> { language = file.language, member = member })
                 -- Update to use the new structure
                )
            )
        |> BackendTask.resolve
        |> BackendTask.allowFatal


memberDecoder : String -> String -> Decode.Decoder Member
memberDecoder slug body =
    Decode.map6 (Member body)
        (Decode.field "name" Decode.string)
        (Decode.maybe <| Decode.field "avatar" Decode.string)
        (Decode.map (Maybe.withDefault []) <| Decode.maybe <| Decode.field "socials" <| Decode.keyValuePairs Decode.string)
        (Decode.maybe <| Decode.field "occupation" Decode.string)
        (Decode.maybe <| Decode.field "company" Decode.string)
        (Decode.succeed slug)


defaultMember : String -> BackendTask { fatal : FatalError, recoverable : File.FileReadError Decode.Error } Member
defaultMember lang =
    let
        path =
            if lang == "" then
                "content/en/about/default.md"

            else
                "content/" ++ lang ++ "/about/default.md"
    in
    File.bodyWithFrontmatter (memberDecoder "default") path
