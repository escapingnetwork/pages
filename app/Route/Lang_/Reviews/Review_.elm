module Route.Lang_.Reviews.Review_ exposing (..)

import BackendTask exposing (BackendTask)
import Effect exposing (Effect)
import FatalError exposing (FatalError)
import Head
import Html
import Html.Attributes as Attrs
import I18n as Translations exposing (I18n)
import I18nUtils
import PagesMsg
import ReviewUtils exposing (Review, getReview)
import RouteBuilder exposing (App, StatelessRoute)
import Shared
import View


type alias Model =
    {}


type alias Msg =
    ()


type alias RouteParams =
    { lang : String
    , review : String
    }


route : StatelessRoute RouteParams Data ActionData
route =
    RouteBuilder.preRender
        { head = head
        , pages = pages
        , data = data
        }
        |> RouteBuilder.buildNoState { view = view }


head : RouteBuilder.App Data ActionData RouteParams -> List Head.Tag
head app =
    []


pages : BackendTask FatalError (List RouteParams)
pages =
    ReviewUtils.getReviews
        |> BackendTask.andThen
            (\reviews ->
                BackendTask.succeed <|
                    List.concatMap
                        (\review ->
                            List.map
                                (\lang -> { lang = Translations.languageToString lang, review = review.id })
                                Translations.languages
                        )
                        reviews
            )


type alias Data =
    { review : Review
    , translation : I18n
    }


type alias ActionData =
    {}


data : RouteParams -> BackendTask FatalError Data
data routeParams =
    I18nUtils.loadLanguage routeParams.lang
        |> BackendTask.map2 Data (getReview routeParams.review)


view :
    App Data ActionData RouteParams
    -> Shared.Model
    -> View.View (PagesMsg.PagesMsg Msg)
view app model =
    { title = "Capybara House - Reviews"
    , body =
        [ Html.div
            [ Attrs.class "space-y-2 pb-8 pt-6 md:space-y-5"
            ]
            [ Html.h1
                [ Attrs.class "text-3xl font-extrabold leading-9 tracking-tight text-gray-900 dark:text-gray-100 sm:text-4xl sm:leading-10 md:text-6xl md:leading-14 text-center"
                ]
                [ Html.text <| Translations.reviewsTitle app.data.translation ]
            , Html.h2
                [ Attrs.class "text-xl font-medium text-gray-600 dark:text-gray-300 text-center" ]
                [ Html.text <| Translations.reviewsSubtitle app.data.translation ]
            ]
        , Html.div
            [ Attrs.class "mx-auto max-w-none dark:prose-invert xl:col-span-2 xl:max-w-5xl xl:px-0  overflow-hidden " ]
            [ ReviewUtils.showFullReview app.data.translation app.data.review ]
        ]
    }
