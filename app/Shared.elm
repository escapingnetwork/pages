module Shared exposing (Data, Model, Msg(..), SharedMsg(..), template)

import BackendTask exposing (BackendTask)
import Effect exposing (Effect)
import FatalError exposing (FatalError)
import Html exposing (Html)
import Http
import I18n as Translations exposing (..)
import Layout
import List.Extra
import Pages.Flags
import Pages.PageUrl exposing (PageUrl)
import Pages.Url
import Route exposing (Route)
import SharedTemplate exposing (SharedTemplate)
import UrlPath exposing (UrlPath)
import View exposing (View)


template : SharedTemplate Msg Model Data msg
template =
    { init = init
    , update = update
    , view = view
    , data = data
    , subscriptions = subscriptions
    , onPageChange = Nothing
    }


type Msg
    = MenuClicked
    | ChangeLanguage Language
    | LoadedTranslations (Result Http.Error (I18n -> I18n))


type alias Data =
    ()


type SharedMsg
    = NoOp


type alias Model =
    { showMenu : Bool
    , i18n : I18n
    , language : Language
    }


init :
    Pages.Flags.Flags
    ->
        Maybe
            { path :
                { path : UrlPath
                , query : Maybe String
                , fragment : Maybe String
                }
            , metadata : route
            , pageUrl : Maybe PageUrl
            }
    -> ( Model, Effect Msg )
init _ pageData =
    let
        currentPath =
            Maybe.map
                .path
                pageData
                |> Maybe.map .path

        lang =
            languageFromUrlPath currentPath

        model =
            { showMenu = False
            , i18n = Translations.init { lang = lang, path = "http://localhost:1234" ++ "/i18n" }
            , language = lang
            }
    in
    ( model
    , Effect.Cmd <| Translations.loadHome LoadedTranslations model.i18n
    )


languageFromUrlPath : Maybe UrlPath.UrlPath -> Language
languageFromUrlPath path =
    case path of
        Just p ->
            let
                segments =
                    UrlPath.toSegments <| Pages.Url.toString <| Pages.Url.fromPath p
            in
            case List.head segments of
                Just h ->
                    case List.Extra.find (\lang -> lang == Maybe.withDefault Translations.En (Translations.languageFromString h)) Translations.languages of
                        Just l ->
                            l

                        _ ->
                            Translations.En

                Nothing ->
                    Translations.En

        Nothing ->
            Translations.En


update : Msg -> Model -> ( Model, Effect Msg )
update msg model =
    case msg of
        MenuClicked ->
            ( { model | showMenu = not model.showMenu }, Effect.none )

        ChangeLanguage language ->
            let
                ( newI18n, cmds ) =
                    Translations.switchLanguage language LoadedTranslations model.i18n
            in
            ( { model | i18n = newI18n }, Effect.Cmd cmds )

        LoadedTranslations (Ok addTranslations) ->
            ( { model | i18n = addTranslations model.i18n }, Effect.none )

        LoadedTranslations (Err _) ->
            ( model, Effect.none )


subscriptions : UrlPath -> Model -> Sub Msg
subscriptions _ _ =
    Sub.none


data : BackendTask FatalError Data
data =
    BackendTask.succeed ()


view :
    Data
    ->
        { path : UrlPath
        , route : Maybe Route
        }
    -> Model
    -> (Msg -> msg)
    -> View msg
    -> { body : List (Html msg), title : String }
view app { path, route } model toMsg pageView =
    { body = Layout.view path model.i18n model.showMenu (toMsg MenuClicked) (\lang -> toMsg (ChangeLanguage lang)) pageView.body
    , title = pageView.title
    }
