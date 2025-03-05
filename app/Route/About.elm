module Route.About exposing (ActionData, Data, Model, Msg, RouteParams, route)

import BackendTask
import Content.About exposing (About)
import Content.Members exposing (Member)
import Dict
import FatalError exposing (FatalError)
import Head
import I18n as Translations
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
    {}


type alias Data =
    { about : About
    , members : List Member
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


data : BackendTask.BackendTask FatalError Data
data =
    (Content.Members.allMembers
        |> BackendTask.map (List.filter (\{ language, member } -> language == "en"))
        |> BackendTask.map (List.map .member)
    )
        |> BackendTask.map2 Data
            (Content.About.defaultAbout "en"
                |> BackendTask.allowFatal
            )


head :
    App Data ActionData RouteParams
    -> List Head.Tag
head _ =
    let
        translations =
            Translations.init { lang = Translations.En, path = "https://capybara.house" ++ "/i18n" }
    in
    Layout.seoHeaders
        (Translations.seoAboutTitle translations)
        (Translations.seoAboutDescription translations)
        translations


view :
    App Data ActionData RouteParams
    -> Shared.Model
    -> View (PagesMsg Msg)
view app model =
    { title = "Capybara House - About"
    , body =
        [ Layout.About.view model.i18n app.data.about app.data.members
        ]
    }
