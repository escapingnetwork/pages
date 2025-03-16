module Route.Lang_.Partner.SignUp exposing (Model, Msg, RouteParams, route, Data, ActionData)

{-|

@docs Model, Msg, RouteParams, route, Data, ActionData

-}

import BackendTask
import Content.Minimal
import FatalError exposing (FatalError)
import Head
import Html
import Html.Attributes as Attrs
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
    Content.Minimal.partners r.lang
        |> BackendTask.allowFatal
        |> BackendTask.map2 Data (I18nUtils.loadLanguage r.lang)


head : RouteBuilder.App Data ActionData RouteParams -> List Head.Tag
head app =
    Layout.seoHeaders
        (Translations.seoPartnerTitle app.data.translation)
        (Translations.seoPartnerDescription app.data.translation)
        app.data.translation


view :
    App Data ActionData RouteParams
    -> Shared.Model
    -> View.View (PagesMsg.PagesMsg Msg)
view app shared =
    { title = "Capybara House - Become A Partner"
    , body =
        [ Html.div [ Attrs.class "mx-auto prose max-w-none pb-8 pt-8 dark:prose-invert xl:col-span-2 xl:max-w-5xl xl:px-0" ] <|
            Layout.Minimal.viewEmbeded
                app.data.minimal
        ]
    }
