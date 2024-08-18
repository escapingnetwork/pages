module Route.Lang_ exposing (ActionData, Data, Model, Msg, RouteParams, route)

import BackendTask exposing (BackendTask)
import Content.Blogpost exposing (Metadata)
import FatalError exposing (FatalError)
import Head
import Head.Seo as Seo
import Html
import Html.Attributes as Attrs
import I18n
import LanguageTag.Language as Language
import LanguageTag.Region as Region
import Layout
import Layout.Blogpost
import Layout.Home
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
    { lang : String }


type alias Data =
    {}


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
data r =
    BackendTask.succeed {}


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
    { title = Settings.title
    , body =
        --TODO move to layout part
        [ -- [ Html.div [ Attrs.class "space-y-2 pb-8 pt-6 md:space-y-5" ]
          --     [ Html.h1 [ Attrs.class "text-3xl font-extrabold leading-9 tracking-tight text-gray-900 dark:text-gray-100 sm:text-4xl sm:leading-10 md:text-6xl md:leading-14" ] [ Html.text "Latest" ]
          --     , Html.p [ Attrs.class "text-lg leading-7 text-gray-500 dark:text-gray-400" ] [ Html.text Settings.subtitle ]
          --     ]
          Html.div [ Attrs.class "mx-auto" ] <| [ Layout.Home.view model.i18n ] -- List.map Layout.Blogpost.viewListItem app.data.blogpostMetadata
        ]
    }
