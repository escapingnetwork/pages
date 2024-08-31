module Route.Index exposing (ActionData, Data, Model, Msg, RouteParams, route)

import BackendTask exposing (BackendTask)
import Content.Blogpost exposing (Metadata)
import FatalError exposing (FatalError)
import Head
import Head.Seo as Seo
import Html
import Html.Attributes as Attrs
import I18n exposing (I18n)
import I18nUtils
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
    {}


type alias Data =
    { translation : I18n
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
        |> BackendTask.map Data


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
        [ Html.div [ Attrs.class "mx-auto" ] <| [ Layout.Home.view app.data.translation ] -- List.map Layout.Blogpost.viewListItem app.data.blogpostMetadata
        ]
    }
