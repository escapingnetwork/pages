module Route.Lang_.HowItWorks exposing (Model, Msg, RouteParams, route, Data, ActionData)

{-|

@docs Model, Msg, RouteParams, route, Data, ActionData

-}

import BackendTask exposing (BackendTask)
import Content.Minimal
import Content.Services exposing (Metadata)
import FatalError exposing (FatalError)
import Head
import Html
import Html.Attributes as Attrs
import I18n as Translations exposing (..)
import I18nUtils
import Layout
import Layout.HowItWorks
import PagesMsg exposing (PagesMsg)
import RouteBuilder exposing (App, StatelessRoute)
import Shared
import View exposing (View)


type alias Model =
    {}


type alias Msg =
    ()


type alias RouteParams =
    { lang : String
    }


type alias Data =
    { translation : Translations.I18n
    , minimal : Content.Minimal.Minimal
    }


type alias ActionData =
    {}


pages : BackendTask FatalError (List RouteParams)
pages =
    BackendTask.succeed <| List.map (\lang -> Translations.languageToString lang |> RouteParams) Translations.languages


route : StatelessRoute RouteParams Data ActionData
route =
    RouteBuilder.preRender
        { head = head
        , data = data
        , pages = pages
        }
        |> RouteBuilder.buildNoState { view = view }


data : RouteParams -> BackendTask FatalError Data
data r =
    Content.Minimal.howItWorks r.lang
        |> BackendTask.allowFatal
        |> BackendTask.map2 Data (I18nUtils.loadLanguage r.lang)



-- |> BackendTask.map (List.map (\allServices -> .metadata allServices |> (\allMetadata -> { serviceMetadata = allMetadata })))


head : RouteBuilder.App Data ActionData RouteParams -> List Head.Tag
head app =
    Layout.seoHeaders
        (Translations.seoHowItWorksTitle app.data.translation)
        (Translations.seoHowItWorksDescription app.data.translation)
        app.data.translation


view :
    App Data ActionData RouteParams
    -> Shared.Model
    -> View.View (PagesMsg.PagesMsg Msg)
view app shared =
    { title = "Capybara House - " ++ app.data.minimal.title, body = [ Layout.HowItWorks.view app.data.minimal app.data.translation ] }
