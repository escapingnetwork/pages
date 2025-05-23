module Route.Lang_.Host.SignUp_ exposing (Model, Msg, RouteParams, route, Data, ActionData)

{-|

@docs Model, Msg, RouteParams, route, Data, ActionData

-}

import BackendTask
import Content.Minimal
import Effect exposing (Effect)
import ErrorPage
import FatalError
import Head
import Html
import Html.Attributes as Attrs
import I18n as Translations
import I18nUtils
import Layout
import Layout.Minimal
import PagesMsg
import RouteBuilder exposing (App, StatefulRoute)
import Server.Request
import Server.Response
import Shared
import View


type alias Model =
    {}


type alias Msg =
    ()


type alias RouteParams =
    { lang : String, signUp : String }


route : StatefulRoute RouteParams Data ActionData Model Msg
route =
    RouteBuilder.serverRender
        { head = head
        , data = data
        , action = action
        }
        |> RouteBuilder.buildWithLocalState
            { view = view
            , update = update
            , subscriptions = \_ _ _ _ -> Sub.none
            , init = init
            }


init : App Data ActionData RouteParams -> Shared.Model -> ( Model, Effect Msg )
init app shared =
    ( {}
    , Effect.none
    )


head : RouteBuilder.App Data ActionData RouteParams -> List Head.Tag
head app =
    Layout.seoHeaders
        (Translations.seoHostTitle app.data.translation)
        (Translations.seoHomeDescription app.data.translation)
        app.data.translation


update :
    App Data ActionData RouteParams
    -> Shared.Model
    -> Msg
    -> Model
    -> ( Model, Effect Msg )
update app shared msg model =
    ( model, Effect.none )


type alias Data =
    { translation : Translations.I18n
    , minimal : Content.Minimal.Minimal
    }


type alias ActionData =
    {}


data : RouteParams -> Server.Request.Request -> BackendTask.BackendTask FatalError.FatalError (Server.Response.Response Data ErrorPage.ErrorPage)
data routeParams request =
    Content.Minimal.hosts routeParams.lang
        |> BackendTask.allowFatal
        |> BackendTask.map2 Data (I18nUtils.loadLanguage routeParams.lang)
        |> BackendTask.map Server.Response.render


view :
    App Data ActionData RouteParams
    -> Shared.Model
    -> Model
    -> View.View (PagesMsg.PagesMsg Msg)
view app shared model =
    { title = "Capybara House - Request Accommodation"
    , body =
        [ Html.div [ Attrs.class "mx-auto prose max-w-none pb-8 pt-8 dark:prose-invert xl:col-span-2 xl:max-w-5xl xl:px-0" ] <|
            List.append (Layout.Minimal.viewEmbeded app.data.minimal)
                [ Html.h1
                    [ Attrs.class "text-5xl font-extrabold mt-2 text-center"
                    ]
                    [ Html.text <| Translations.formsSuccess shared.i18n ++ " " ++ app.routeParams.signUp ++ " !"
                    , Html.small
                        [ Attrs.class "ms-2 font-semibold text-gray-500 dark:text-gray-400"
                        ]
                        [ Html.text <| " " ++ Translations.formsSuccessContact shared.i18n ]
                    ]
                ]
        ]
    }


action :
    RouteParams
    -> Server.Request.Request
    -> BackendTask.BackendTask FatalError.FatalError (Server.Response.Response ActionData ErrorPage.ErrorPage)
action routeParams request =
    BackendTask.succeed (Server.Response.render {})
