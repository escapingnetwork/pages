module Route.About exposing (ActionData, Data, Model, Msg, RouteParams, route)

import BackendTask
import Content.About exposing (Author)
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
    { author : Author }


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
    Content.About.defaultAuthor ""
        |> BackendTask.allowFatal
        |> BackendTask.map Data


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
        [ Layout.About.view model.i18n
            (case model.language of
                Translations.En ->
                    app.data.author

                _ ->
                    app.data.author
            )
        ]
    }
