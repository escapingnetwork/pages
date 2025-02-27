module Route.Services.Slug_ exposing (Model, Msg, RouteParams, route, Data, ActionData)

{-|

@docs Model, Msg, RouteParams, route, Data, ActionData

-}

import BackendTask exposing (BackendTask)
import Content.Services exposing (Service)
import FatalError exposing (FatalError)
import Head
import I18n as Translations
import Layout
import Layout.Service
import PagesMsg exposing (PagesMsg)
import RouteBuilder exposing (App, StatelessRoute)
import Shared
import View exposing (View)


type alias Model =
    {}


type alias Msg =
    ()


type alias RouteParams =
    { slug : String }


route : StatelessRoute RouteParams Data ActionData
route =
    RouteBuilder.preRender
        { head = head
        , pages = pages
        , data = data
        }
        |> RouteBuilder.buildNoState { view = view }


pages : BackendTask FatalError (List RouteParams)
pages =
    Content.Services.allServices
        |> BackendTask.map
            (\services ->
                List.map (\service -> { slug = service.metadata.slug }) services
            )


type alias Data =
    { service : Service
    }


type alias ActionData =
    {}


data : RouteParams -> BackendTask FatalError Data
data routeParams =
    BackendTask.map Data
        (Content.Services.serviceFromSlug routeParams.slug)


head : RouteBuilder.App Data ActionData RouteParams -> List Head.Tag
head app =
    let
        translations =
            Translations.init { lang = Translations.En, path = "https://capybara.house" ++ "/i18n" }
    in
    Layout.seoHeaders
        (Translations.seoServicesTitle translations)
        (Translations.seoServicesDescription translations)
        translations


view :
    App Data ActionData RouteParams
    -> Shared.Model
    -> View (PagesMsg Msg)
view app model =
    { title = "Capybara House - " ++ app.data.service.metadata.title
    , body = [ Layout.Service.viewService model.i18n app.data.service ]
    }
