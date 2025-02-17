module Route.Reviews exposing (..)

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
        |> BackendTask.map2 Data getReviews


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
    { title = "Capybara House - Reviews"
    , body =
        [ Html.div
            [ Attrs.class "space-y-2 pb-8 pt-6 md:space-y-5"
            ]
            [ Html.h1
                [ Attrs.class "text-3xl font-extrabold leading-9 tracking-tight text-gray-900 dark:text-gray-100 sm:text-4xl sm:leading-10 md:text-6xl md:leading-14 text-center"
                ]
                [ Html.text <| I18n.reviewsTitle app.data.translation ]
            , Html.h2
                [ Attrs.class "text-xl font-medium text-gray-600 dark:text-gray-300 text-center" ]
                [ Html.text <| I18n.reviewsSubtitle app.data.translation ]
            ]
        , Html.div
            [ Attrs.class "mx-auto max-w-none dark:prose-invert xl:col-span-2 xl:max-w-5xl xl:px-0  overflow-hidden " ]
          <|
            [ Layout.Reviews.view app.data.translation app.data.reviews ]
        ]
    }
