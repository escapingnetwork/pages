module Route.Lang_.Host.FullRegistration exposing (Model, Msg, RouteParams, route, Data, ActionData)

{-|

@docs Model, Msg, RouteParams, route, Data, ActionData

-}

import BackendTask
import Content.Minimal
import FatalError exposing (FatalError)
import Head
import Html
import Html.Attributes as Attrs
import I18n
import Layout.Minimal
import PagesMsg
import RouteBuilder exposing (App, StatelessRoute)
import Shared
import View


type alias Model =
    {}


type alias Msg =
    ()


type alias RouteParams =
    { lang : String }


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


type alias Data =
    { minimal : Content.Minimal.Minimal }


type alias ActionData =
    {}


data : RouteParams -> BackendTask.BackendTask FatalError Data
data r =
    Content.Minimal.hosts r.lang
        |> BackendTask.allowFatal
        |> BackendTask.map Data


head : RouteBuilder.App Data ActionData RouteParams -> List Head.Tag
head app =
    []


view :
    App Data ActionData RouteParams
    -> Shared.Model
    -> View.View (PagesMsg.PagesMsg Msg)
view app shared =
    { title = "Capybara House - Become A Host"
    , body =
        [ Html.div [ Attrs.class "mx-auto prose max-w-none pb-8 pt-8 dark:prose-invert xl:col-span-2 xl:max-w-5xl xl:px-0" ] <|
            List.append (Layout.Minimal.viewEmbeded app.data.minimal)
                [ Html.iframe
                    [ Attrs.attribute "data-tally-src" "https://tally.so/embed/3xYZMG?alignLeft=0&hideTitle=1&transparentBackground=1&dynamicHeight=1"
                    , Attrs.attribute "frameborder" "0"
                    , Attrs.style "width" "100%"
                    , Attrs.height 2400
                    , Attrs.class "mx-auto prose dark:prose-invert xl:max-w-5xl xl:px-0"
                    , Attrs.title "Become A Host"
                    , Attrs.src "https://tally.so/embed/3xYZMG?alignLeft=0&hideTitle=1&transparentBackground=1&dynamicHeight=1"
                    ]
                    []
                ]
        ]
    }
