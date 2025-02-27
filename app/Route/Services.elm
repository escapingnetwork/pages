module Route.Services exposing (Model, Msg, RouteParams, route, Data, ActionData)

{-|

@docs Model, Msg, RouteParams, route, Data, ActionData

-}

import BackendTask exposing (BackendTask)
import Content.Services exposing (Metadata)
import FatalError exposing (FatalError)
import Head
import Html
import Html.Attributes as Attrs
import I18n as Translations
import Layout
import Layout.Service
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
    { serviceMetadata : List Metadata
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
    Content.Services.allServices
        |> BackendTask.map (\allServices -> List.map .metadata allServices |> (\allMetadata -> { serviceMetadata = allMetadata }))


head :
    App Data ActionData RouteParams
    -> List Head.Tag
head _ =
    let
        translations =
            Translations.init { lang = Translations.En, path = "https://capybara.house" ++ "/i18n" }
    in
    Layout.seoHeaders
        (Translations.seoServicesTitle translations)
        (Translations.seoServicesDescription translations)
        translations


view :
    App Data ActionData RouteParams
    -> Shared.Model
    -> View (PagesMsg Msg)
view app model =
    { title = "Capybara House - Services"
    , body =
        [ Html.div
            [ Attrs.class "space-y-2 pb-8 pt-6 md:space-y-5"
            ]
            [ Html.h1
                [ Attrs.class "text-3xl font-extrabold leading-9 tracking-tight text-gray-900 dark:text-gray-100 sm:text-4xl sm:leading-10 md:text-6xl md:leading-14 text-center"
                ]
                [ Html.text <| Translations.buttonServices model.i18n ]
            ]
        , Html.div
            [ Attrs.class "mx-auto max-w-none dark:prose-invert xl:col-span-2 xl:max-w-5xl xl:px-0  overflow-hidden " ]
          <|
            List.map (Layout.Service.viewListItem model.i18n) app.data.serviceMetadata
        ]
    }
