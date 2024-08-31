module I18n exposing (I18n, Language(..), aboutTitle, buttonRequestAccommodation, buttonServices, currentLanguage, decodeHome, footerContact, footerCopyright, footerLanguage, footerLegal, footerMeeting, footerPrivacyPolicy, footerSupport, footerTermsConditions, formsAge, formsContact, formsCountry, formsEmail, formsError, formsErrorContact, formsForename, formsFrom, formsInstitution, formsMessage, formsPhone, formsService, formsSex, formsSubmit, formsSubmitting, formsSuccess, formsSuccessContact, formsSurname, formsTo, homeHeadline, homeSubline, init, languageFromString, languageToFileName_home, languageToString, languages, loadHome, navbarAbout, navbarHost, navbarPartner, navbarServices, servicesReadmore, switchLanguage)

{-| This file was generated by travelm-agency version 3.4.1.

If you have any issues with the generated code, do not hesitate to open an issue here: <https://github.com/andreasewering/travelm-agency/issues>

-}

import Array
import Http
import Json.Decode
import List
import Maybe
import String
import Tuple


type I18n
    = I18n { lang : Language, path : String } { home : ( Array.Array String, Language ) }


{-| Initialize an (empty) `I18n` instance. This is useful on startup when no JSON was `load`ed yet.
-}
init : { lang : Language, path : String } -> I18n
init opts =
    I18n { lang = opts.lang, path = opts.path } { home = ( Array.empty, opts.lang ) }


{-| Get the currently active language.
Note: This might not be what the user sees in this moment, since the translations might still be loading and instead
another language is visible. If you need the other semantic, use `arrivedLanguage` instead.
-}
currentLanguage : I18n -> Language
currentLanguage (I18n opts _) =
    opts.lang


{-| Enumeration of the supported languages
-}
type Language
    = De
    | En
    | Es
    | Pt


{-| A list containing all `Language`s. The list is sorted alphabetically.
-}
languages : List Language
languages =
    [ De, En, Es, Pt ]


{-| Convert a `Language` to its `String` representation.
-}
languageToString : Language -> String
languageToString lang =
    case lang of
        De ->
            "de"

        En ->
            "en"

        Es ->
            "es"

        Pt ->
            "pt"


{-| Maybe parse a `Language` from a `String`.
This will map languages based on the prefix i.e. 'en-US' and 'en' will both map to 'En' unless you provided a 'en-US' translation file.
-}
languageFromString : String -> Maybe Language
languageFromString lang =
    let
        helper langs =
            case langs of
                [] ->
                    Maybe.Nothing

                l :: ls ->
                    if String.startsWith (languageToString l) lang then
                        Maybe.Just l

                    else
                        helper ls
    in
    helper (List.reverse languages)


{-| Load translations for identifier 'home' and a `Language` from the server. This is a simple `Http.get`, if you need more customization,
you can use the `decoder` instead. Pass the path and a callback to your `update` function, for example

    load { language = De, path = "/i18n", onLoad = GotTranslations }

will make a `GET` request to /i18n/home.de.json and will call GotTranslations with the decoded response.

-}
loadHome : (Result Http.Error (I18n -> I18n) -> msg) -> I18n -> Cmd msg
loadHome onLoad (I18n opts _) =
    Http.get
        { expect = Http.expectJson onLoad (decodeHome opts.lang)
        , url = opts.path ++ "/" ++ languageToFileName_home opts.lang
        }


{-| Switch the current language and reload all previously loaded translation bundles in the new language.
-}
switchLanguage : Language -> (Result Http.Error (I18n -> I18n) -> msg) -> I18n -> ( I18n, Cmd msg )
switchLanguage lang onLoad (I18n opts bundles) =
    let
        i18nNewLang =
            I18n { opts | lang = lang } bundles
    in
    [ ( bundles.home, loadHome ) ]
        |> List.filter (not << Array.isEmpty << Tuple.first << Tuple.first)
        |> List.map Tuple.second
        |> List.map (\load -> load onLoad i18nNewLang)
        |> Cmd.batch
        |> Tuple.pair i18nNewLang


aboutTitle : I18n -> String
aboutTitle (I18n _ { home }) =
    case Array.get 2 (Tuple.first home) of
        Just translation ->
            translation

        Nothing ->
            ""


buttonRequestAccommodation : I18n -> String
buttonRequestAccommodation (I18n _ { home }) =
    case Array.get 7 (Tuple.first home) of
        Just translation ->
            translation

        Nothing ->
            ""


buttonServices : I18n -> String
buttonServices (I18n _ { home }) =
    case Array.get 8 (Tuple.first home) of
        Just translation ->
            translation

        Nothing ->
            ""


footerContact : I18n -> String
footerContact (I18n _ { home }) =
    case Array.get 9 (Tuple.first home) of
        Just translation ->
            translation

        Nothing ->
            ""


footerCopyright : I18n -> String
footerCopyright (I18n _ { home }) =
    case Array.get 10 (Tuple.first home) of
        Just translation ->
            translation

        Nothing ->
            ""


footerLanguage : I18n -> String
footerLanguage (I18n _ { home }) =
    case Array.get 11 (Tuple.first home) of
        Just translation ->
            translation

        Nothing ->
            ""


footerLegal : I18n -> String
footerLegal (I18n _ { home }) =
    case Array.get 12 (Tuple.first home) of
        Just translation ->
            translation

        Nothing ->
            ""


footerMeeting : I18n -> String
footerMeeting (I18n _ { home }) =
    case Array.get 13 (Tuple.first home) of
        Just translation ->
            translation

        Nothing ->
            ""


footerPrivacyPolicy : I18n -> String
footerPrivacyPolicy (I18n _ { home }) =
    case Array.get 14 (Tuple.first home) of
        Just translation ->
            translation

        Nothing ->
            ""


footerSupport : I18n -> String
footerSupport (I18n _ { home }) =
    case Array.get 15 (Tuple.first home) of
        Just translation ->
            translation

        Nothing ->
            ""


footerTermsConditions : I18n -> String
footerTermsConditions (I18n _ { home }) =
    case Array.get 16 (Tuple.first home) of
        Just translation ->
            translation

        Nothing ->
            ""


formsAge : I18n -> String
formsAge (I18n _ { home }) =
    case Array.get 17 (Tuple.first home) of
        Just translation ->
            translation

        Nothing ->
            ""


formsContact : I18n -> String
formsContact (I18n _ { home }) =
    case Array.get 18 (Tuple.first home) of
        Just translation ->
            translation

        Nothing ->
            ""


formsCountry : I18n -> String
formsCountry (I18n _ { home }) =
    case Array.get 19 (Tuple.first home) of
        Just translation ->
            translation

        Nothing ->
            ""


formsEmail : I18n -> String
formsEmail (I18n _ { home }) =
    case Array.get 20 (Tuple.first home) of
        Just translation ->
            translation

        Nothing ->
            ""


formsError : I18n -> String
formsError (I18n _ { home }) =
    case Array.get 21 (Tuple.first home) of
        Just translation ->
            translation

        Nothing ->
            ""


formsErrorContact : I18n -> String
formsErrorContact (I18n _ { home }) =
    case Array.get 22 (Tuple.first home) of
        Just translation ->
            translation

        Nothing ->
            ""


formsForename : I18n -> String
formsForename (I18n _ { home }) =
    case Array.get 23 (Tuple.first home) of
        Just translation ->
            translation

        Nothing ->
            ""


formsFrom : I18n -> String
formsFrom (I18n _ { home }) =
    case Array.get 24 (Tuple.first home) of
        Just translation ->
            translation

        Nothing ->
            ""


formsInstitution : I18n -> String
formsInstitution (I18n _ { home }) =
    case Array.get 25 (Tuple.first home) of
        Just translation ->
            translation

        Nothing ->
            ""


formsMessage : I18n -> String
formsMessage (I18n _ { home }) =
    case Array.get 26 (Tuple.first home) of
        Just translation ->
            translation

        Nothing ->
            ""


formsPhone : I18n -> String
formsPhone (I18n _ { home }) =
    case Array.get 27 (Tuple.first home) of
        Just translation ->
            translation

        Nothing ->
            ""


formsService : I18n -> String
formsService (I18n _ { home }) =
    case Array.get 28 (Tuple.first home) of
        Just translation ->
            translation

        Nothing ->
            ""


formsSex : I18n -> String
formsSex (I18n _ { home }) =
    case Array.get 29 (Tuple.first home) of
        Just translation ->
            translation

        Nothing ->
            ""


formsSubmit : I18n -> String
formsSubmit (I18n _ { home }) =
    case Array.get 30 (Tuple.first home) of
        Just translation ->
            translation

        Nothing ->
            ""


formsSubmitting : I18n -> String
formsSubmitting (I18n _ { home }) =
    case Array.get 31 (Tuple.first home) of
        Just translation ->
            translation

        Nothing ->
            ""


formsSuccess : I18n -> String
formsSuccess (I18n _ { home }) =
    case Array.get 32 (Tuple.first home) of
        Just translation ->
            translation

        Nothing ->
            ""


formsSuccessContact : I18n -> String
formsSuccessContact (I18n _ { home }) =
    case Array.get 33 (Tuple.first home) of
        Just translation ->
            translation

        Nothing ->
            ""


formsSurname : I18n -> String
formsSurname (I18n _ { home }) =
    case Array.get 34 (Tuple.first home) of
        Just translation ->
            translation

        Nothing ->
            ""


formsTo : I18n -> String
formsTo (I18n _ { home }) =
    case Array.get 35 (Tuple.first home) of
        Just translation ->
            translation

        Nothing ->
            ""


homeHeadline : I18n -> String
homeHeadline (I18n _ { home }) =
    case Array.get 36 (Tuple.first home) of
        Just translation ->
            translation

        Nothing ->
            ""


homeSubline : I18n -> String
homeSubline (I18n _ { home }) =
    case Array.get 37 (Tuple.first home) of
        Just translation ->
            translation

        Nothing ->
            ""


navbarAbout : I18n -> String
navbarAbout (I18n _ { home }) =
    case Array.get 38 (Tuple.first home) of
        Just translation ->
            translation

        Nothing ->
            ""


navbarHost : I18n -> String
navbarHost (I18n _ { home }) =
    case Array.get 39 (Tuple.first home) of
        Just translation ->
            translation

        Nothing ->
            ""


navbarPartner : I18n -> String
navbarPartner (I18n _ { home }) =
    case Array.get 40 (Tuple.first home) of
        Just translation ->
            translation

        Nothing ->
            ""


navbarServices : I18n -> String
navbarServices (I18n _ { home }) =
    case Array.get 41 (Tuple.first home) of
        Just translation ->
            translation

        Nothing ->
            ""


servicesReadmore : I18n -> String
servicesReadmore (I18n _ { home }) =
    case Array.get 44 (Tuple.first home) of
        Just translation ->
            translation

        Nothing ->
            ""


{-| Decode an `I18n` from Json. Make sure this is _only_ used on the files generated by this package.
You need to pass the language of the loaded translations (for bookkeeping).
-}
decodeHome : Language -> Json.Decode.Decoder (I18n -> I18n)
decodeHome lang =
    Json.Decode.array Json.Decode.string
        |> Json.Decode.map (\arr (I18n opts bundles) -> I18n opts { bundles | home = ( arr, lang ) })


languageToFileName_home : Language -> String
languageToFileName_home lang =
    case lang of
        De ->
            "home.de.json"

        En ->
            "home.en.json"

        Es ->
            "home.es.json"

        Pt ->
            "home.pt.json"
