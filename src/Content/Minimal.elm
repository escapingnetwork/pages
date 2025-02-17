module Content.Minimal exposing (Minimal, accommodation, completeRegistration, hosts, partners, privacyPolicy, review, support, termsAndConditions)

import BackendTask exposing (BackendTask)
import BackendTask.File as File
import FatalError exposing (FatalError)
import Json.Decode as Decode


type alias Minimal =
    { body : String
    , title : String
    , company : String
    , slug : String
    }


minimalDecoder : String -> String -> Decode.Decoder Minimal
minimalDecoder slug body =
    Decode.map3 (Minimal body)
        (Decode.field "title" Decode.string)
        (Decode.field "company" Decode.string)
        (Decode.succeed slug)


privacyPolicy : String -> BackendTask { fatal : FatalError, recoverable : File.FileReadError Decode.Error } Minimal
privacyPolicy lang =
    let
        path =
            if lang == "" then
                "content/en/privacypolicy.md"

            else
                "content/" ++ lang ++ "/privacypolicy.md"
    in
    File.bodyWithFrontmatter (minimalDecoder "privacypolicy") path


termsAndConditions : String -> BackendTask { fatal : FatalError, recoverable : File.FileReadError Decode.Error } Minimal
termsAndConditions lang =
    let
        path =
            if lang == "" then
                "content/en/termsconditions.md"

            else
                "content/" ++ lang ++ "/termsconditions.md"
    in
    File.bodyWithFrontmatter (minimalDecoder "termsconditions") path


partners : String -> BackendTask { fatal : FatalError, recoverable : File.FileReadError Decode.Error } Minimal
partners lang =
    let
        path =
            if lang == "" then
                "content/en/partners.md"

            else
                "content/" ++ lang ++ "/partners.md"
    in
    File.bodyWithFrontmatter (minimalDecoder "partners") path


hosts : String -> BackendTask { fatal : FatalError, recoverable : File.FileReadError Decode.Error } Minimal
hosts lang =
    let
        path =
            if lang == "" then
                "content/en/hosts.md"

            else
                "content/" ++ lang ++ "/hosts.md"
    in
    File.bodyWithFrontmatter (minimalDecoder "hosts") path


support : String -> BackendTask { fatal : FatalError, recoverable : File.FileReadError Decode.Error } Minimal
support lang =
    let
        path =
            if lang == "" then
                "content/en/support.md"

            else
                "content/" ++ lang ++ "/support.md"
    in
    File.bodyWithFrontmatter (minimalDecoder "support") path


review : String -> BackendTask { fatal : FatalError, recoverable : File.FileReadError Decode.Error } Minimal
review lang =
    let
        path =
            if lang == "" then
                "content/en/review.md"

            else
                "content/" ++ lang ++ "/review.md"
    in
    File.bodyWithFrontmatter (minimalDecoder "review") path


accommodation : String -> BackendTask { fatal : FatalError, recoverable : File.FileReadError Decode.Error } Minimal
accommodation lang =
    let
        path =
            if lang == "" then
                "content/en/accommodation.md"

            else
                "content/" ++ lang ++ "/accommodation.md"
    in
    File.bodyWithFrontmatter (minimalDecoder "accommodation") path


completeRegistration : String -> BackendTask { fatal : FatalError, recoverable : File.FileReadError Decode.Error } Minimal
completeRegistration lang =
    let
        path =
            if lang == "" then
                "content/en/completeregistration.md"

            else
                "content/" ++ lang ++ "/completeregistration.md"
    in
    File.bodyWithFrontmatter (minimalDecoder "completeregistration") path
