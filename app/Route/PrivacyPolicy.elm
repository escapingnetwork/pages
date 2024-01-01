module Route.PrivacyPolicy exposing (Model, Msg, RouteParams, route, Data, ActionData)

{-|

@docs Model, Msg, RouteParams, route, Data, ActionData

-}

import BackendTask
import Content.Legals
import Effect
import ErrorPage
import FatalError exposing (FatalError)
import Head
import Layout.Legals
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
    { legal : Content.Legals.Legal }


type alias ActionData =
    {}


data : BackendTask.BackendTask FatalError Data
data =
    Content.Legals.privacyPolicy
        |> BackendTask.allowFatal
        |> BackendTask.map Data


head : RouteBuilder.App Data ActionData RouteParams -> List Head.Tag
head app =
    Layout.Legals.seoHeaders app.data.legal


view :
    App Data ActionData RouteParams
    -> Shared.Model
    -> View.View (PagesMsg.PagesMsg Msg)
view app _ =
    { title = "Privacy Policy", body = [ Layout.Legals.view app.data.legal ] }


action :
    RouteParams
    -> Server.Request.Request
    -> BackendTask.BackendTask FatalError.FatalError (Server.Response.Response ActionData ErrorPage.ErrorPage)
action routeParams request =
    BackendTask.succeed (Server.Response.render {})
