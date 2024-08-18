module Route.Lang_.Services exposing (Model, Msg, RouteParams, route, Data, ActionData)

{-|

@docs Model, Msg, RouteParams, route, Data, ActionData

-}

import BackendTask exposing (BackendTask)
import Content.Services exposing (Metadata)
import Effect exposing (Effect)
import FatalError exposing (FatalError)
import Head
import Head.Seo as Seo
import Html
import Html.Attributes as Attrs
import I18n as Translations exposing (..)
import LanguageTag.Language as Language
import LanguageTag.Region as Country
import Layout
import Layout.Home
import Layout.Service
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
    { lang : String
    }


type alias Data =
    { serviceMetadata : List Metadata
    }


type alias ActionData =
    {}


init :
    RouteBuilder.App Data ActionData RouteParams
    -> Shared.Model
    -> ( Model, Effect.Effect Msg )
init app shared =
    ( {}, Effect.none )


pages : BackendTask FatalError (List RouteParams)
pages =
    BackendTask.succeed <| List.map (\lang -> Translations.languageToString lang |> RouteParams) Translations.languages


route : StatelessRoute RouteParams Data ActionData
route =
    RouteBuilder.preRender
        { head = head
        , data = data
        , pages = pages
        }
        |> RouteBuilder.buildNoState { view = view }


data : RouteParams -> BackendTask FatalError Data
data r =
    Content.Services.allServicesLang
        |> BackendTask.map (List.filter (\allServices -> allServices.language == r.lang))
        |> BackendTask.map
            (\allServicesLang ->
                List.map .service allServicesLang
                    |> (\allServices ->
                            List.map .metadata allServices
                                |> (\metadata -> { serviceMetadata = metadata })
                       )
            )



-- |> BackendTask.map (List.map (\allServices -> .metadata allServices |> (\allMetadata -> { serviceMetadata = allMetadata })))


head : RouteBuilder.App Data ActionData RouteParams -> List Head.Tag
head _ =
    Layout.seoHeaders


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
            List.map (Layout.Service.viewLangListItem model.i18n) app.data.serviceMetadata
        ]
    }
