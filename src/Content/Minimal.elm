module Content.Minimal exposing (Minimal, accommodation, completeRegistration, hosts, partners, privacyPolicy, support, termsAndConditions)

import BackendTask exposing (BackendTask)
import BackendTask.File as File
import BackendTask.Glob as Glob
import FatalError exposing (FatalError)
import Json.Decode as Decode


type alias Minimal =
    { body : String
    , title : String
    , company : String
    , slug : String
    }


minimalFiles : BackendTask error (List { filePath : String, slug : String })
minimalFiles =
    Glob.succeed
        (\filePath fileName ->
            { filePath = filePath
            , slug = fileName
            }
        )
        |> Glob.captureFilePath
        |> Glob.match (Glob.literal "content/")
        |> Glob.capture Glob.wildcard
        |> Glob.match (Glob.literal ".md")
        |> Glob.toBackendTask


minimalDecoder : String -> String -> Decode.Decoder Minimal
minimalDecoder slug body =
    Decode.map3 (Minimal body)
        (Decode.field "title" Decode.string)
        (Decode.field "company" Decode.string)
        (Decode.succeed slug)


privacyPolicy : BackendTask { fatal : FatalError, recoverable : File.FileReadError Decode.Error } Minimal
privacyPolicy =
    File.bodyWithFrontmatter (minimalDecoder "privacypolicy") "content/privacypolicy.md"


termsAndConditions : BackendTask { fatal : FatalError, recoverable : File.FileReadError Decode.Error } Minimal
termsAndConditions =
    File.bodyWithFrontmatter (minimalDecoder "termsconditions") "content/termsconditions.md"


partners : BackendTask { fatal : FatalError, recoverable : File.FileReadError Decode.Error } Minimal
partners =
    File.bodyWithFrontmatter (minimalDecoder "partners") "content/partners.md"


hosts : BackendTask { fatal : FatalError, recoverable : File.FileReadError Decode.Error } Minimal
hosts =
    File.bodyWithFrontmatter (minimalDecoder "hosts") "content/hosts.md"


support : BackendTask { fatal : FatalError, recoverable : File.FileReadError Decode.Error } Minimal
support =
    File.bodyWithFrontmatter (minimalDecoder "support") "content/support.md"


accommodation : BackendTask { fatal : FatalError, recoverable : File.FileReadError Decode.Error } Minimal
accommodation =
    File.bodyWithFrontmatter (minimalDecoder "accommodation") "content/accommodation.md"


completeRegistration : BackendTask { fatal : FatalError, recoverable : File.FileReadError Decode.Error } Minimal
completeRegistration =
    File.bodyWithFrontmatter (minimalDecoder "completeregistration") "content/completeregistration.md"
