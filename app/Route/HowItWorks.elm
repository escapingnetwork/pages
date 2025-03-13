module Route.HowItWorks exposing (Model, Msg, RouteParams, route, Data, ActionData)

{-|

@docs Model, Msg, RouteParams, route, Data, ActionData

-}

import BackendTask
import Content.Minimal
import FatalError exposing (FatalError)
import Head
import I18n as Translations
import I18nUtils
import Layout.HowItWorks
import PagesMsg
import RouteBuilder exposing (App, StatelessRoute)
import Shared
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
    { minimal : Content.Minimal.Minimal
    , translation : Translations.I18n
    }


type alias ActionData =
    {}


data : BackendTask.BackendTask FatalError Data
data =
    I18nUtils.loadLanguage "en"
        |> BackendTask.map2 Data (Content.Minimal.howItWorks "" |> BackendTask.allowFatal)


head : RouteBuilder.App Data ActionData RouteParams -> List Head.Tag
head app =
    Layout.HowItWorks.seoHeaders app.data.minimal


view :
    App Data ActionData RouteParams
    -> Shared.Model
    -> View.View (PagesMsg.PagesMsg Msg)
view app _ =
    { title = "How It Works", body = [ Layout.HowItWorks.view app.data.minimal app.data.translation ] }
