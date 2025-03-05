module Route.Lang_.Reviews exposing (ActionData, Data, Model, Msg, RouteParams, route)

import BackendTask exposing (BackendTask)
import FatalError exposing (FatalError)
import Head
import Html
import Html.Attributes as Attrs
import I18n exposing (I18n)
import I18nUtils
import Layout
import Layout.Reviews
import PagesMsg exposing (PagesMsg)
import ReviewUtils exposing (Review, getReviews)
import RouteBuilder exposing (App, StatelessRoute)
import Shared
import View exposing (View)


type alias Model =
    {}


type alias Msg =
    ()


type alias RouteParams =
    { lang : String }


type alias Data =
    { reviews : List Review
    , translation : I18n
    }


type alias ActionData =
    {}


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
    BackendTask.succeed <| List.map (\lang -> I18n.languageToString lang |> RouteParams) I18n.languages


data : RouteParams -> BackendTask FatalError Data
data routeParams =
    I18nUtils.loadLanguage routeParams.lang
        |> BackendTask.map2 Data getReviews


head :
    App Data ActionData RouteParams
    -> List Head.Tag
head app =
    Layout.seoHeaders
        (I18n.seoReviewsTitle app.data.translation)
        (I18n.seoReviewsDescription app.data.translation)
        app.data.translation


view :
    App Data ActionData RouteParams
    -> Shared.Model
    -> View (PagesMsg Msg)
view app model =
    { title = "Capybara House - Reviews"
    , body = Layout.Reviews.view app.data.translation app.data.reviews
    }
