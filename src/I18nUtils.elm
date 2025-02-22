module I18nUtils exposing (languageToTranslatedLanguage, loadLanguage)

import BackendTask exposing (BackendTask)
import BackendTask.Http
import FatalError exposing (FatalError)
import Html.Attributes exposing (lang)
import I18n
import LanguageTag.Language exposing (de)


loadLanguage : String -> BackendTask FatalError I18n.I18n
loadLanguage langString =
    let
        path =
            "https://capybara.house/i18n/"

        lang =
            I18n.languageFromString langString |> Maybe.withDefault I18n.En

        langInit =
            I18n.init { lang = lang, path = "https://capybara.house/i18n/" }
    in
    BackendTask.Http.getJson
        (path ++ I18n.languageToFileName_home lang)
        (I18n.decodeHome lang)
        |> BackendTask.allowFatal
        |> BackendTask.map (\l -> l langInit)


languageToTranslatedLanguage : I18n.I18n -> String -> String
languageToTranslatedLanguage translation language =
    case language of
        "en" ->
            I18n.languagesEn translation

        "de" ->
            I18n.languagesDe translation

        "es" ->
            I18n.languagesEs translation

        "pt" ->
            I18n.languagesPt translation

        "fr" ->
            I18n.languagesFr translation

        "it" ->
            I18n.languagesIt translation

        _ ->
            I18n.languagesEn translation
