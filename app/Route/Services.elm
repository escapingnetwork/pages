module Route.Services exposing (Model, Msg, RouteParams, route, Data, ActionData)

{-|

@docs Model, Msg, RouteParams, route, Data, ActionData

-}

import BackendTask exposing (BackendTask)
import Content.Services exposing (Metadata)
import FatalError exposing (FatalError)
import Head
import Head.Seo as Seo
import Html
import Html.Attributes as Attrs
import LanguageTag.Country as Country
import LanguageTag.Language as Language
import Layout
import Layout.Home
import Layout.Service
import Pages.Url
import PagesMsg exposing (PagesMsg)
import RouteBuilder exposing (App, StatelessRoute)
import Settings
import Shared
import UrlPath
import View exposing (View)


type alias Model =
    {}


type alias Msg =
    ()


type alias RouteParams =
    {}


type alias Data =
    { serviceMetadata : List Metadata
    }


type alias ActionData =
    {}


route : StatelessRoute RouteParams Data ActionData
route =
    RouteBuilder.single
        { head = head
        , data = data
        }
        |> RouteBuilder.buildNoState { view = view }


data : BackendTask FatalError Data
data =
    Content.Services.allServices
        |> BackendTask.map (\allServices -> List.map .service allServices |> (\allMetadata -> { serviceMetadata = allMetadata }))


head :
    App Data ActionData RouteParams
    -> List Head.Tag
head _ =
    Layout.seoHeaders


view :
    App Data ActionData RouteParams
    -> Shared.Model
    -> View (PagesMsg Msg)
view app model =
    { title = "Services"
    , body = [ Html.div [ Attrs.class "mx-auto max-w-none dark:prose-invert xl:col-span-2 xl:max-w-5xl xl:px-0  overflow-hidden " ] <| List.map Layout.Service.viewListItem app.data.serviceMetadata ]
    }
