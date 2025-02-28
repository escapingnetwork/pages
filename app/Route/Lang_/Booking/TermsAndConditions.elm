module Route.Lang_.Booking.TermsAndConditions exposing (Model, Msg, RouteParams, route, Data, ActionData)

{-|

@docs Model, Msg, RouteParams, route, Data, ActionData

-}

import BackendTask
import Content.Minimal
import FatalError exposing (FatalError)
import Head
import I18n as Translations
import I18nUtils
import Layout
import Layout.Minimal
import PagesMsg
import RouteBuilder exposing (App, StatelessRoute)
import Shared
import View


type alias Model =
    {}


type alias Msg =
    ()


type alias RouteParams =
    { lang : String }


route : StatelessRoute RouteParams Data ActionData
route =
    RouteBuilder.preRender
        { head = head
        , data = data
        , pages = pages
        }
        |> RouteBuilder.buildNoState { view = view }


pages : BackendTask.BackendTask FatalError (List RouteParams)
pages =
    BackendTask.succeed <| List.map (\lang -> Translations.languageToString lang |> RouteParams) Translations.languages


type alias Data =
    { translation : Translations.I18n
    , minimal : Content.Minimal.Minimal
    }


type alias ActionData =
    {}


data : RouteParams -> BackendTask.BackendTask FatalError Data
data r =
    Content.Minimal.termsAndConditions r.lang
        |> BackendTask.allowFatal
        |> BackendTask.map2 Data (I18nUtils.loadLanguage r.lang)


head : RouteBuilder.App Data ActionData RouteParams -> List Head.Tag
head app =
    Layout.seoHeaders
        (Translations.seoBookingTermsTitle app.data.translation)
        (Translations.seoBookingTermsDescription app.data.translation)
        app.data.translation


view :
    App Data ActionData RouteParams
    -> Shared.Model
    -> View.View (PagesMsg.PagesMsg Msg)
view app shared =
    { title = "Capybara House - " ++ Translations.footerTermsConditions shared.i18n, body = [ Layout.Minimal.view app.data.minimal ] }
