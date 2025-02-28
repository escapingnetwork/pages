module Route.Booking.TermsAndConditions exposing (Model, Msg, RouteParams, route, Data, ActionData)

{-|

@docs Model, Msg, RouteParams, route, Data, ActionData

-}

import BackendTask
import Content.Minimal
import FatalError exposing (FatalError)
import Head
import I18n as Translations
import Layout
import Layout.Minimal
import PagesMsg
import RouteBuilder exposing (App)
import Shared
import View


type alias Model =
    {}


type alias Msg =
    ()


type alias RouteParams =
    {}


route : RouteBuilder.StatefulRoute RouteParams Data ActionData Model Msg
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
    Content.Minimal.termsAndConditions ""
        |> BackendTask.allowFatal
        |> BackendTask.map Data


head : RouteBuilder.App Data ActionData RouteParams -> List Head.Tag
head app =
    let
        translations =
            Translations.init { lang = Translations.En, path = "https://capybara.house" ++ "/i18n" }
    in
    Layout.seoHeaders
        (Translations.seoBookingTermsTitle translations)
        (Translations.seoBookingTermsDescription translations)
        translations


view :
    App Data ActionData RouteParams
    -> Shared.Model
    -> View.View (PagesMsg.PagesMsg Msg)
view app shared =
    { title = "Capybara House - " ++ Translations.footerTermsConditions shared.i18n, body = [ Layout.Minimal.view app.data.minimal ] }
