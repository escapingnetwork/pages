module I18nUtils exposing (loadLanguage)

import BackendTask exposing (BackendTask)
import BackendTask.Http
import FatalError exposing (FatalError)
import I18n


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
