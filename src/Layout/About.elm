module Layout.About exposing (view, viewAllMembers)

import Content.About exposing (About)
import Content.Members exposing (Member)
import Dict exposing (Dict)
import Html exposing (Html)
import Html.Attributes as Attrs
import Html.Extra
import I18n as Translations exposing (..)
import Layout.Markdown as Markdown
import Phosphor


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

                "whatsapp" ->
                    Phosphor.whatsappLogo

                "calendly" ->
                    Phosphor.calendarPlus

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
                , Attrs.class "transition-colors duration-200"
                ]
                [ Html.span [ Attrs.class "sr-only" ] [ Html.text name ]
                , icon name Phosphor.Regular
                    |> Phosphor.withClass "fill-current text-gray-500 hover:text-primary-500 dark:text-gray-300 dark:hover:text-primary-400 h-6 w-6"
                    |> Phosphor.toHtml []
                ]
    in
    Html.div
        [ Attrs.class "flex flex-wrap gap-4 mt-6 justify-center" ]
        (List.map socialView socials)


view : I18n -> About -> List Member -> Html msg
view translation about members =
    Html.section
        [ Attrs.class "py-16" ]
        [ Html.div
            [ Attrs.class "container mx-auto px-4 sm:px-6 lg:px-8" ]
            [ Html.header
                [ Attrs.class "text-center mb-12" ]
                [ Html.h1
                    [ Attrs.class "text-3xl font-bold tracking-tight text-gray-900 dark:text-gray-100 sm:text-4xl md:text-5xl" ]
                    [ Html.text <| Translations.aboutTitle translation ]
                ]
            , Html.div
                [ Attrs.class "prose prose-lg max-w-3xl mx-auto mt-8 text-gray-600 dark:text-gray-300" ]
                (Markdown.toHtml about.body)
            , Html.div
                [ Attrs.class "mt-24" ]
                [ viewAllMembers translation members ]
            ]
        ]


viewAllMembers : I18n -> List Member -> Html msg
viewAllMembers translation members =
    let
        teamHeader =
            Html.header
                [ Attrs.class "text-center mb-12" ]
                [ Html.h2
                    [ Attrs.class "text-3xl font-bold tracking-tight text-gray-900 dark:text-gray-100 sm:text-4xl md:text-5xl" ]
                    [ Html.text <| Translations.aboutMeetTeam translation ]
                , Html.p
                    [ Attrs.class "prose prose-lg max-w-3xl mx-auto mt-8 text-gray-600 dark:text-gray-300" ]
                    [ Html.text <| Translations.aboutMeetTeamContent translation ]
                ]

        teamMemberCard member =
            Html.div
                [ Attrs.class "rounded-lg p-6" ]
                [ Html.div
                    [ Attrs.class "flex flex-col items-center text-center" ]
                    [ Html.img
                        [ Attrs.alt <| member.name ++ "'s avatar"
                        , Attrs.attribute "loading" "lazy"
                        , Attrs.width 120
                        , Attrs.height 120
                        , Attrs.class "h-40 w-40 rounded-full object-cover mb-4 border-4 border-gray-100 dark:border-gray-700"
                        , Attrs.src <| Maybe.withDefault "/media/logo.svg" member.avatar
                        ]
                        []
                    , Html.h3
                        [ Attrs.class "text-xl font-semibold text-gray-900 dark:text-gray-100 mb-2" ]
                        [ Html.text member.name ]
                    , Html.Extra.viewMaybe
                        (\occupation ->
                            Html.p
                                [ Attrs.class "text-gray-600 dark:text-gray-400 text-sm mb-1" ]
                                [ Html.text occupation ]
                        )
                        member.occupation
                    , Html.Extra.viewMaybe
                        (\position ->
                            Html.p
                                [ Attrs.class "text-gray-500 dark:text-gray-300 text-sm mb-4 italic" ]
                                [ Html.text position ]
                        )
                        member.company
                    , socialsView member.socials

                    -- , Html.div
                    --     [ Attrs.class "prose prose-md text-gray-600 dark:text-gray-300 mt-4" ]
                    --     (Markdown.toHtml member.body)
                    ]
                ]
    in
    Html.section
        [ Attrs.class "py-12" ]
        [ Html.div
            [ Attrs.class "max-w-7xl mx-auto px-4 sm:px-6 lg:px-8" ]
            [ teamHeader
            , Html.div
                [ Attrs.class "grid grid-cols-1 sm:grid-cols-2 gap-6" ]
                (members |> List.map teamMemberCard)
            ]
        ]
