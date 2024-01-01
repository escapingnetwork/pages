module Route.Student.SignUp exposing (Model, Msg, RouteParams, route, Data, ActionData)

{-|

@docs Model, Msg, RouteParams, route, Data, ActionData

-}

import BackendTask
import Effect
import ErrorPage
import FatalError
import Head
import Html
import Html.Attributes as Attrs exposing (height)
import PagesMsg
import RouteBuilder
import Server.Request
import Server.Response
import Shared
import UrlPath
import View


type alias Model =
    {}


type Msg
    = NoOp


type alias RouteParams =
    {}


route : RouteBuilder.StatefulRoute RouteParams Data ActionData Model Msg
route =
    RouteBuilder.serverRender { data = data, action = action, head = head }
        |> RouteBuilder.buildWithLocalState
            { view = view
            , init = init
            , update = update
            , subscriptions = subscriptions
            }


init :
    RouteBuilder.App Data ActionData RouteParams
    -> Shared.Model
    -> ( Model, Effect.Effect Msg )
init app shared =
    ( {}, Effect.none )


update :
    RouteBuilder.App Data ActionData RouteParams
    -> Shared.Model
    -> Msg
    -> Model
    -> ( Model, Effect.Effect Msg )
update app shared msg model =
    case msg of
        NoOp ->
            ( model, Effect.none )


subscriptions : RouteParams -> UrlPath.UrlPath -> Shared.Model -> Model -> Sub Msg
subscriptions routeParams path shared model =
    Sub.none


type alias Data =
    {}


type alias ActionData =
    {}


data :
    RouteParams
    -> Server.Request.Request
    -> BackendTask.BackendTask FatalError.FatalError (Server.Response.Response Data ErrorPage.ErrorPage)
data routeParams request =
    BackendTask.succeed (Server.Response.render {})


head : RouteBuilder.App Data ActionData RouteParams -> List Head.Tag
head app =
    []


view :
    RouteBuilder.App Data ActionData RouteParams
    -> Shared.Model
    -> Model
    -> View.View (PagesMsg.PagesMsg Msg)
view app shared model =
    { title = "Capybara House - Request Accomodation"
    , body =
        [ Html.div []
            [ Html.iframe
                [ Attrs.attribute "data-tally-src" "https://tally.so/r/mRD80Q?hideTitle=0&transparentBackground=1&dynamicHeight=1"
                , Attrs.attribute "frameborder" "0"
                , Attrs.style "width" "100%"
                , Attrs.height 1200
                , Attrs.attribute "frameborder" "0"
                , Attrs.attribute "marginheight" "0"
                , Attrs.attribute "marginwidth" "0"
                , Attrs.title "Request Accommodation"
                , Attrs.class "mx-auto prose dark:prose-invert xl:max-w-5xl xl:px-0"
                , Attrs.title "Contact us"
                , Attrs.src "https://tally.so/r/mRD80Q?hideTitle=0&transparentBackground=1&dynamicHeight=1"
                ]
                []
            ]
        ]
    }


action :
    RouteParams
    -> Server.Request.Request
    -> BackendTask.BackendTask FatalError.FatalError (Server.Response.Response ActionData ErrorPage.ErrorPage)
action routeParams request =
    BackendTask.succeed (Server.Response.render {})
