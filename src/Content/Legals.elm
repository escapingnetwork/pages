module Content.Legals exposing (Legal, accommodation, completeRegistration, hosts, partners, privacyPolicy, support, termsAndConditions)

import BackendTask exposing (BackendTask)
import BackendTask.File as File
import BackendTask.Glob as Glob
import FatalError exposing (FatalError)
import Json.Decode as Decode


type alias Legal =
    { body : String
    , title : String
    , company : String
    , slug : String
    }


legalFiles : BackendTask error (List { filePath : String, slug : String })
legalFiles =
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


legalDecoder : String -> String -> Decode.Decoder Legal
legalDecoder slug body =
    Decode.map3 (Legal body)
        (Decode.field "title" Decode.string)
        (Decode.field "company" Decode.string)
        (Decode.succeed slug)


privacyPolicy : BackendTask { fatal : FatalError, recoverable : File.FileReadError Decode.Error } Legal
privacyPolicy =
    File.bodyWithFrontmatter (legalDecoder "privacypolicy") "/content/privacypolicy.md"


termsAndConditions : BackendTask { fatal : FatalError, recoverable : File.FileReadError Decode.Error } Legal
termsAndConditions =
    File.bodyWithFrontmatter (legalDecoder "termsconditions") "/content/termsconditions.md"


partners : BackendTask { fatal : FatalError, recoverable : File.FileReadError Decode.Error } Legal
partners =
    File.bodyWithFrontmatter (legalDecoder "partners") "/content/partners.md"


hosts : BackendTask { fatal : FatalError, recoverable : File.FileReadError Decode.Error } Legal
hosts =
    File.bodyWithFrontmatter (legalDecoder "hosts") "/content/hosts.md"


support : BackendTask { fatal : FatalError, recoverable : File.FileReadError Decode.Error } Legal
support =
    File.bodyWithFrontmatter (legalDecoder "support") "/content/support.md"


accommodation : BackendTask { fatal : FatalError, recoverable : File.FileReadError Decode.Error } Legal
accommodation =
    File.bodyWithFrontmatter (legalDecoder "accommodation") "/content/accommodation.md"


completeRegistration : BackendTask { fatal : FatalError, recoverable : File.FileReadError Decode.Error } Legal
completeRegistration =
    File.bodyWithFrontmatter (legalDecoder "completeregistration") "/content/completeregistration.md"
