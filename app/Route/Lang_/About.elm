module Route.Lang_.About exposing (ActionData, Data, Model, Msg, RouteParams, route)

import BackendTask
import Content.About exposing (Author)
import FatalError exposing (FatalError)
import Head
import Head.Seo as Seo
import I18n exposing (I18n)
import I18nUtils
import Layout.About
import Pages.Url
import PagesMsg exposing (PagesMsg)
import RouteBuilder exposing (App, StatelessRoute)
import Shared exposing (Msg(..))
import UrlPath
import View exposing (View)


type alias Model =
    {}


type alias Msg =
    ()


type alias RouteParams =
    { lang : String }


type alias Data =
    { translation : I18n
    , author : Author
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


data : RouteParams -> BackendTask.BackendTask FatalError Data
data r =
    Content.About.defaultAuthor r.lang
        |> BackendTask.allowFatal
        |> BackendTask.map2 Data
            (I18nUtils.loadLanguage r.lang)


head :
    App Data ActionData RouteParams
    -> List Head.Tag
head app =
    Layout.About.seoHeaders app.data.author


view :
    App Data ActionData RouteParams
    -> Shared.Model
    -> View (PagesMsg Msg)
view app model =
    { title = "Capybara House - About"
    , body =
        [ Layout.About.view app.data.translation
            (case model.language of
                I18n.En ->
                    app.data.author

                _ ->
                    app.data.author
            )
        ]
    }
