module Layout.HowItWorks exposing (..)

import Content.Minimal exposing (Minimal)
import Head
import Head.Seo as Seo
import Html exposing (Html, s)
import Html.Attributes as Attrs
import I18n as Translations exposing (I18n)
import Layout.Markdown as Markdown
import Pages.Url
import Route
import Settings
import UrlPath


seoHeaders : Minimal -> List Head.Tag
seoHeaders howItWorks =
    let
        imageUrl =
            [ "media", "how-it-works-banner.png" ] |> UrlPath.join |> Pages.Url.fromPath
    in
    Seo.summary
        { canonicalUrlOverride = Nothing
        , siteName = Settings.title
        , image =
            { url = imageUrl
            , alt = "How It Works at Capybara House"
            , dimensions = Just { width = 300, height = 300 }
            , mimeType = Nothing
            }
        , description = "Learn how Capybara House helps students find accommodation in Ireland in five easy steps."
        , locale = Settings.locale
        , title = howItWorks.title
        }
        |> Seo.website


view : Minimal -> I18n -> Html msg
view howItWorksText translation =
    let
        -- Parse the Markdown body into a list of Html nodes
        parsedContent : List (Html msg)
        parsedContent =
            Markdown.toHtml howItWorksText.body

        -- Extract specific elements by index (assuming order: h1, p, h2, p, h2, p, ...)
        getAt : Int -> List (Html msg) -> Html msg
        getAt index list =
            List.drop index list |> List.head |> Maybe.withDefault (Html.text "Content missing")

        title =
            getAt 0 parsedContent

        -- h1
        intro =
            getAt 1 parsedContent

        -- p
        step1Header =
            getAt 2 parsedContent

        -- h2
        step1Text =
            getAt 3 parsedContent

        -- p
        step2Header =
            getAt 4 parsedContent

        -- h2
        step2Text =
            getAt 5 parsedContent

        -- p
        step3Header =
            getAt 6 parsedContent

        -- h2
        step3Text =
            getAt 7 parsedContent

        -- p
        step4Header =
            getAt 8 parsedContent

        -- h2
        step4Text =
            getAt 9 parsedContent

        -- p
        step5Header =
            getAt 10 parsedContent

        -- h2
        step5Text =
            getAt 11 parsedContent

        -- p
        specialHeader =
            getAt 12 parsedContent

        -- h3
        specialText =
            getAt 13 parsedContent

        -- p
    in
    Html.div
        [ Attrs.class "mx-auto prose max-w-none pb-8 pt-8 dark:prose-invert xl:col-span-2 xl:max-w-5xl xl:px-0" ]
        [ Html.div
            [ Attrs.class "max-w-4xl mx-auto py-8 px-4" ]
            [ title
            , intro
            , Html.div
                [ Attrs.class "flex flex-col md:flex-row items-center mb-12 items-center" ]
                [ Html.div
                    [ Attrs.class "md:w-1/3 mb-4 md:mb-0" ]
                    [ Html.img
                        [ Attrs.src "/assets/howitworks/step1.png"
                        , Attrs.alt "Student filling out a form"
                        , Attrs.class "w-full rounded-lg"
                        ]
                        []
                    ]
                , Html.div
                    [ Attrs.class "md:w-2/3 md:pl-6" ]
                    [ step1Header
                    , step1Text
                    ]
                ]
            , Html.div
                [ Attrs.class "flex flex-col md:flex-row items-center mb-12" ]
                [ Html.div
                    [ Attrs.class "md:w-1/3 mb-4 md:mb-0" ]
                    [ Html.img
                        [ Attrs.src "/assets/howitworks/step2.png"
                        , Attrs.alt "Team reviewing a submission"
                        , Attrs.class "w-full rounded-lg"
                        ]
                        []
                    ]
                , Html.div
                    [ Attrs.class "md:w-2/3 md:pl-6" ]
                    [ step2Header
                    , step2Text
                    ]
                ]
            , Html.div
                [ Attrs.class "flex flex-col md:flex-row items-center mb-12" ]
                [ Html.div
                    [ Attrs.class "md:w-1/3 mb-4 md:mb-0" ]
                    [ Html.img
                        [ Attrs.src "/assets/howitworks/step3.png"
                        , Attrs.alt "Student making a payment"
                        , Attrs.class "w-full rounded-lg"
                        ]
                        []
                    ]
                , Html.div
                    [ Attrs.class "md:w-2/3 md:pl-6" ]
                    [ step3Header
                    , step3Text
                    ]
                ]
            , Html.div
                [ Attrs.class "flex flex-col md:flex-row items-center mb-12" ]
                [ Html.div
                    [ Attrs.class "md:w-1/3 mb-4 md:mb-0" ]
                    [ Html.img
                        [ Attrs.src "/assets/howitworks/step4.png"
                        , Attrs.alt "Team coordinating with hosts"
                        , Attrs.class "w-full rounded-lg"
                        ]
                        []
                    ]
                , Html.div
                    [ Attrs.class "md:w-2/3 md:pl-6" ]
                    [ step4Header
                    , step4Text
                    ]
                ]
            , Html.div
                [ Attrs.class "flex flex-col md:flex-row items-center mb-12" ]
                [ Html.div
                    [ Attrs.class "md:w-1/3 mb-4 md:mb-0" ]
                    [ Html.img
                        [ Attrs.src "/assets/howitworks/step5.png"
                        , Attrs.alt "Student arriving at new home"
                        , Attrs.class "w-full rounded-lg"
                        ]
                        []
                    ]
                , Html.div
                    [ Attrs.class "md:w-2/3 md:pl-6" ]
                    [ step5Header
                    , step5Text
                    ]
                ]
            , Html.div
                [ Attrs.class "flex flex-col space-y-4 sm:flex-row sm:justify-center sm:space-y-0 mb-12"
                ]
                [ Route.link
                    [ Attrs.class "inline-flex justify-center items-center py-3 px-5 text-base font-semibold text-center text-white rounded-lg bg-primary-500 hover:bg-primary-600 focus:ring-4 focus:ring-primary-300 dark:focus:ring-primary-600"
                    , Attrs.style "text-decoration" "none"
                    ]
                    [ Html.text <| Translations.buttonRequestAccommodation translation ]
                    (Route.Lang___Student__SignUp
                        { lang = Translations.languageToString <| Translations.currentLanguage translation }
                    )
                , Route.link
                    [ Attrs.class "inline-flex justify-center hover:text-gray-900 items-center py-3 px-5 sm:ms-4 text-base font-semibold text-center text-primary-500 rounded-lg border border-primary-500  focus:ring-4 focus:ring-primary-300"
                    , Attrs.style "text-decoration" "none"
                    ]
                    [ Html.text <| Translations.buttonServices translation ]
                    (Route.Lang___Services
                        { lang = Translations.languageToString <| Translations.currentLanguage translation }
                    )
                ]
            , Html.div
                [ Attrs.class "bg-gray-100 p-6 rounded-lg text-center" ]
                [ specialHeader
                , specialText
                ]
            ]
        ]
