module Route.Lang_.About exposing (ActionData, Data, Model, Msg, RouteParams, route)

import BackendTask
import Content.About exposing (About)
import Content.Members exposing (Member)
import Dict
import FatalError exposing (FatalError)
import Head
import I18n as Translations exposing (I18n)
import I18nUtils
import Layout
import Layout.About
import PagesMsg exposing (PagesMsg)
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
    { about : About
    , translation : I18n
    , members : List Member
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
    BackendTask.succeed <| List.map (\lang -> Translations.languageToString lang |> RouteParams) Translations.languages


data : RouteParams -> BackendTask.BackendTask FatalError Data
data r =
    (Content.Members.allMembers
        |> BackendTask.map (List.filter (\{ language, member } -> language == r.lang))
        |> BackendTask.map (List.map .member)
    )
        |> BackendTask.map3 Data
            (Content.About.defaultAbout r.lang
                |> BackendTask.allowFatal
            )
            (I18nUtils.loadLanguage
                r.lang
            )


head :
    App Data ActionData RouteParams
    -> List Head.Tag
head app =
    Layout.seoHeaders
        (Translations.seoAboutTitle app.data.translation)
        (Translations.seoAboutDescription app.data.translation)
        app.data.translation


view :
    App Data ActionData RouteParams
    -> Shared.Model
    -> View (PagesMsg Msg)
view app model =
    { title = "Capybara House - About"
    , body =
        [ Layout.About.view app.data.translation app.data.about app.data.members ]
    }
