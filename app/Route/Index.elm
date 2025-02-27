module Route.Index exposing (ActionData, Data, Model, Msg, RouteParams, route)

import BackendTask exposing (BackendTask)
import FatalError exposing (FatalError)
import Head
import Html
import Html.Attributes as Attrs
import I18n exposing (I18n)
import I18nUtils
import Layout
import Layout.Home
import PagesMsg exposing (PagesMsg)
import ReviewUtils exposing (Review, getHomeReviews)
import RouteBuilder exposing (App, StatelessRoute)
import Settings
import Shared
import View exposing (View)


type alias Model =
    {}


type alias Msg =
    ()


type alias RouteParams =
    {}


type alias Data =
    { reviews : List Review
    , translation : I18n
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
    I18nUtils.loadLanguage "en"
        |> BackendTask.map2 Data getHomeReviews


head :
    App Data ActionData RouteParams
    -> List Head.Tag
head app =
    Layout.seoHeaders
        (I18n.seoHomeTitle app.data.translation)
        (I18n.seoHomeDescription app.data.translation)
        app.data.translation


view :
    App Data ActionData RouteParams
    -> Shared.Model
    -> View (PagesMsg Msg)
view app model =
    { title = Settings.title
    , body =
        [ Html.div [ Attrs.class "mx-auto" ] <| [ Layout.Home.view app.data.translation app.data.reviews ] -- List.map Layout.Blogpost.viewListItem app.data.blogpostMetadata
        ]
    }
