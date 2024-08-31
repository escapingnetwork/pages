module Route.Lang_.Services.Slug_ exposing (Model, Msg, RouteParams, route, Data, ActionData)

{-|

@docs Model, Msg, RouteParams, route, Data, ActionData

-}

import BackendTask exposing (BackendTask)
import Content.Services exposing (Service)
import FatalError exposing (FatalError)
import Head
import I18n exposing (I18n)
import I18nUtils
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
    { lang : String
    , slug : String
    }


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
    List.map
        (\lang ->
            Content.Services.allServices
                |> BackendTask.map
                    (\services ->
                        List.map (\service -> { slug = service.metadata.slug, lang = I18n.languageToString lang }) services
                    )
        )
        I18n.languages
        |> BackendTask.combine
        |> BackendTask.map List.concat


type alias Data =
    { translation : I18n
    , service : Service
    }


type alias ActionData =
    {}


data : RouteParams -> BackendTask FatalError Data
data routeParams =
    BackendTask.map2 Data
        (I18nUtils.loadLanguage routeParams.lang)
        (Content.Services.serviceFromLangSlug routeParams.lang routeParams.slug)


head : RouteBuilder.App Data ActionData RouteParams -> List Head.Tag
head app =
    []


view :
    App Data ActionData RouteParams
    -> Shared.Model
    -> View (PagesMsg Msg)
view app model =
    { title = "Capybara House - " ++ app.data.service.metadata.title
    , body = [ Layout.Service.viewService app.data.translation app.data.service ]
    }
