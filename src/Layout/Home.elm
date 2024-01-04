module Layout.Home exposing (..)

import Content.About exposing (Author)
import Head
import Head.Seo as Seo
import Html exposing (Html)
import Html.Attributes as Attrs
import Html.Extra
import Layout.Markdown as Markdown
import Pages.Url
import Phosphor
import Settings
import Svg exposing (path, svg)
import Svg.Attributes as SvgAttr
import UrlPath


seoHeaders : Author -> List Head.Tag
seoHeaders author =
    let
        imageUrl =
            author.avatar
                |> Maybe.map (\authorAvatar -> Pages.Url.fromPath <| UrlPath.fromString authorAvatar)
                |> Maybe.withDefault
                    ([ "media", "blog-image.png" ] |> UrlPath.join |> Pages.Url.fromPath)
    in
    Seo.summary
        { canonicalUrlOverride = Nothing
        , siteName = Settings.title
        , image =
            { url = imageUrl
            , alt = author.name
            , dimensions = Just { width = 300, height = 300 }
            , mimeType = Nothing
            }
        , description = author.name ++ " - " ++ (author.occupation |> Maybe.withDefault ("Author of blogposts on " ++ Settings.title))
        , locale = Settings.locale
        , title = author.name
        }
        |> Seo.website


socialsView : List ( String, String ) -> Html msg
socialsView socials =
    let
        icon socialName =
            case socialName of
                "email" ->
                    Phosphor.envelopeSimple

                "facebook" ->
                    Phosphor.facebookLogo

                "github" ->
                    Phosphor.githubLogo

                "twitter" ->
                    Phosphor.twitterLogo

                "linkedin" ->
                    Phosphor.linkedinLogo

                "youtube" ->
                    Phosphor.youtubeLogo

                "tiktok" ->
                    Phosphor.tiktokLogo

                _ ->
                    Phosphor.link

        socialLink name link =
            if name == "email" then
                "mailto:" ++ link

            else
                link

        socialView ( name, link ) =
            Html.a
                [ Attrs.target "_blank"
                , Attrs.rel "noopener noreferrer"
                , Attrs.href <| socialLink name link
                ]
                [ Html.span
                    [ Attrs.class "sr-only"
                    ]
                    [ Html.text name ]
                , icon name Phosphor.Regular
                    |> Phosphor.withClass "fill-current text-gray-500 hover:text-primary-500 dark:text-gray-200 dark:hover:text-primary-400 h-8 w-8"
                    |> Phosphor.toHtml []
                ]
    in
    List.map socialView socials
        |> Html.div
            [ Attrs.class "flex space-x-3 pt-6"
            ]


view : Html msg
view =
    Html.div
        [ Attrs.class "divide-y divide-gray-200 dark:divide-gray-700"
        ]
        [ Html.section
            [ Attrs.class "relative flex items-center justify-center h-screen mb-12 overflow-hidden" ]
            [ Html.div
                [ Attrs.class "px-4 mx-auto max-w-screen-xl text-center py-24 lg:py-56 relative z-30 p-5 text-2xl text-white"
                ]
                [ Html.h1
                    [ Attrs.class "mb-4 text-4xl font-extrabold tracking-tight leading-none text-white md:text-5xl lg:text-6xl"
                    ]
                    [ Html.text "Looking for accomodation in Dublin?" ]
                , Html.p
                    [ Attrs.class "mb-8 text-lg font-normal text-gray-300 lg:text-xl sm:px-16 lg:px-48"
                    ]
                    [ Html.text "Here at Capybara House we focus on providing the best options for lodging in Ireland." ]
                , Html.div
                    [ Attrs.class "flex flex-col space-y-4 sm:flex-row sm:justify-center sm:space-y-0"
                    ]
                    [ Html.a
                        [ Attrs.href "/student/sign-up"
                        , Attrs.class "inline-flex justify-center items-center py-3 px-5 text-base font-medium text-center text-white rounded-lg bg-primary-400 hover:bg-primary-600 focus:ring-4 focus:ring-primary-300 dark:focus:ring-primary-600"
                        ]
                        [ Html.text "Request Accomodation"
                        ]
                    , Html.a
                        [ Attrs.href "/services"
                        , Attrs.class "inline-flex justify-center hover:text-gray-900 items-center py-3 px-5 sm:ms-4 text-base font-medium text-center text-white rounded-lg border border-white hover:bg-gray-100 focus:ring-4 focus:ring-gray-400"
                        ]
                        [ Html.text "Our Services" ]
                    ]
                ]
            , Html.video
                [ Attrs.autoplay True
                , Attrs.loop True
                , Attrs.attribute "muted" ""
                , Attrs.class "absolute z-10 w-auto min-w-full min-h-full max-w-none"
                , Attrs.class "bg-center bg-no-repeat bg-[url('/media/video.mp4')] bg-gray-700 bg-blend-multiply"
                ]
                [ Html.source
                    [ Attrs.src "/media/video.mp4"
                    , Attrs.type_ "video/mp4"
                    ]
                    []
                ]
            ]

        -- -- , Html.div
        -- --     [ Attrs.class "items-start space-y-2 xl:grid xl:grid-cols-2 xl:gap-x-8 xl:space-y-0"
        -- --     ]
        -- --     [ Html.div
        -- --         [ Attrs.class "flex flex-col items-center space-x-2 pt-8"
        -- --         ]
        -- --         [ Html.img
        -- --             [ Attrs.alt "avatar"
        -- --             , Attrs.attribute "loading" "lazy"
        -- --             , Attrs.width 192
        -- --             , Attrs.height 192
        -- --             , Attrs.attribute "decoding" "async"
        -- --             , Attrs.attribute "data-nimg" "1"
        -- --             , Attrs.class "h-48 w-48"
        -- --             , Attrs.src "/images/services/half-board.jpg"
        -- --             , Attrs.style "color" "transparent"
        -- --             ]
        -- --             []
        -- --         , Html.h3
        -- --             [ Attrs.class "pb-2 pt-4 text-2xl font-bold leading-8 tracking-tight"
        -- --             ]
        -- --             [ Html.text "TEST" ]
        -- --         , Html.Extra.viewMaybe
        -- --             (\occupation ->
        -- --                 Html.div
        -- --                     [ Attrs.class "text-gray-500 dark:text-gray-400"
        -- --                     ]
        -- --                     [ Html.text occupation ]
        -- --             )
        -- --             (Just "")
        -- --         , Html.Extra.viewMaybe
        -- --             (\company ->
        -- --                 Html.div
        -- --                     [ Attrs.class "text-gray-500 dark:text-gray-400"
        -- --                     ]
        -- --                     [ Html.text company ]
        -- --             )
        -- --             (Just "")
        -- --         , socialsView [ ( "", "" ) ]
        -- --         ]
        --     , Html.div
        --         [ Attrs.class "prose max-w-none pb-8 pt-8 dark:prose-invert xl:col-span-2"
        --         ]
        --       <|
        --         Markdown.toHtml ""
        --     ]
        ]
