module Route.Partner.SignUp exposing (Model, Msg, RouteParams, route, Data, ActionData)

{-|

@docs Model, Msg, RouteParams, route, Data, ActionData

-}

import BackendTask
import Content.Minimal
import Effect
import ErrorPage
import FatalError exposing (FatalError)
import Head
import Html
import Html.Attributes as Attrs exposing (height)
import Layout.Minimal
import PagesMsg
import RouteBuilder exposing (App, StatelessRoute)
import Server.Request
import Server.Response
import Shared
import UrlPath
import View


type alias Model =
    {}


type alias Msg =
    ()


type alias RouteParams =
    {}


route : StatelessRoute RouteParams Data ActionData
route =
    RouteBuilder.single
        { head = head
        , data = data
        }
        |> RouteBuilder.buildNoState { view = view }


type alias Data =
    { minimal : Content.Minimal.Minimal }


type alias ActionData =
    {}


data : BackendTask.BackendTask FatalError Data
data =
    Content.Minimal.partners ""
        |> BackendTask.allowFatal
        |> BackendTask.map Data


head : RouteBuilder.App Data ActionData RouteParams -> List Head.Tag
head app =
    []


view :
    App Data ActionData RouteParams
    -> Shared.Model
    -> View.View (PagesMsg.PagesMsg Msg)
view app shared =
    { title = "Capybara House - Become A Partner"
    , body =
        [ Html.div [ Attrs.class "mx-auto prose max-w-none pb-8 pt-8 dark:prose-invert xl:col-span-2 xl:max-w-5xl xl:px-0" ]
            [ Layout.Minimal.view app.data.minimal ]

        -- [ Html.iframe
        --     [ Attrs.attribute "data-tally-src" "https://tally.so/embed/nPz85x?hideTitle=0&transparentBackground=1&dynamicHeight=1"
        --     , Attrs.attribute "frameborder" "0"
        --     , Attrs.style "width" "100%"
        --     , Attrs.height 2200
        --     , Attrs.class "mx-auto prose dark:prose-invert xl:max-w-5xl xl:px-0"
        --     , Attrs.title "Contact us"
        --     , Attrs.src "https://tally.so/embed/nPz85x?hideTitle=0&transparentBackground=1&dynamicHeight=1"
        --     ]
        --     []
        -- ]
        ]
    }


action :
    RouteParams
    -> Server.Request.Request
    -> BackendTask.BackendTask FatalError.FatalError (Server.Response.Response ActionData ErrorPage.ErrorPage)
action routeParams request =
    BackendTask.succeed (Server.Response.render {})
