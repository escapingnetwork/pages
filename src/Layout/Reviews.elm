module Layout.Reviews exposing (homeView, showFullReview, showReview, view)

import Html exposing (Html, div)
import Html.Attributes as Attrs exposing (class)
import I18n as Translations exposing (I18n, currentLanguage)
import I18nUtils exposing (languageToTranslatedLanguage)
import Iso8601
import Phosphor exposing (toHtml, user, withSize, withSizeUnit)
import ReviewUtils exposing (Review, getTranslation, userRoleEnumToTranslatedString)
import Route exposing (Route)


view : I18n -> List Review -> List (Html msg)
view i18n reviews =
    [ Html.div
        [ Attrs.class "space-y-2 pb-8 pt-6 md:space-y-5"
        ]
        [ Html.h1
            [ Attrs.class "text-3xl font-extrabold leading-9 tracking-tight text-gray-900 dark:text-gray-100 sm:text-4xl sm:leading-10 md:text-6xl md:leading-14 text-center"
            ]
            [ Html.text <| Translations.reviewsTitle i18n ]
        , Html.h2
            [ Attrs.class "text-xl font-medium text-gray-600 dark:text-gray-300 text-center" ]
            [ Html.text <| Translations.reviewsSubtitle i18n ]
        ]
    , Html.div
        [ Attrs.class "mx-auto max-w-none dark:prose-invert xl:col-span-2 xl:max-w-5xl xl:px-0  overflow-hidden " ]
      <|
        List.map (showFullReview i18n) reviews
    ]


homeView : I18n -> List Review -> Html msg
homeView translation reviews =
    Html.div [ Attrs.class "container mx-auto px-4 py-8" ]
        [ Html.div [ Attrs.class "col-span-1" ]
            [ Route.link
                [ Attrs.class "cursor-pointer" ]
                [ Html.h2 [ Attrs.class "text-3xl font-bold mb-6 text-center text-gray-800 hover:text-primary-600" ]
                    [ Html.text <| Translations.reviewsTitle translation ]
                ]
                (Route.Lang___Reviews
                    { lang = Translations.languageToString <| Translations.currentLanguage translation }
                )
            , Html.div [ Attrs.class "grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6" ] (List.map (showReview translation) reviews)
            ]
        ]


showFullReview : I18n -> Review -> Html msg
showFullReview translation review =
    let
        currentLanguage =
            Translations.languageToString <| Translations.currentLanguage translation
    in
    Html.div
        [ Attrs.class "block p-6 bg-white rounded-lg hover:bg-gray-100 relative" ]
        [ Html.div
            [ Attrs.class "flex items-center mb-2 space-x-4" ]
            [ Html.span
                [ Attrs.class "px-2 py-1 text-xs font-semibold text-white bg-gray-400 rounded" ]
                [ Html.text <| userRoleEnumToTranslatedString translation review.role ]
            , Html.span
                [ Attrs.class "mb-2 text-2xl font-bold tracking-tight text-gray-900 dark:text-white" ]
                [ Html.text review.name ]
            , case review.rating of
                Just rating ->
                    ratingToStars rating

                Nothing ->
                    Html.text ""
            ]
        , if currentLanguage == Maybe.withDefault "en" review.language then
            Html.div
                [ Attrs.class "text-gray-700 dark:text-gray-400" ]
                [ case review.content of
                    Just comment ->
                        Html.p
                            [ Attrs.class "font-normal text-gray-700 dark:text-gray-400 " ]
                            [ Html.text comment ]

                    Nothing ->
                        Html.text ""
                , Html.div
                    [ Attrs.class "text-xs text-gray-500 italic mt-2" ]
                    [ Html.text <| Maybe.withDefault "" (Maybe.map (\time -> String.left 10 (Iso8601.fromTime time)) review.submittedAt) ]
                ]

          else
            Html.div
                [ Attrs.class "text-gray-700 dark:text-gray-400 mb-2" ]
                [ case review.content of
                    Just comment ->
                        Html.p
                            [ Attrs.class "font-normal text-gray-700 dark:text-gray-400 " ]
                            [ Html.text <| getTranslation currentLanguage review.translations ]

                    Nothing ->
                        Html.text ""
                , Html.div
                    [ Attrs.class "text-xs text-gray-500 italic mt-2" ]
                    [ Html.text <| Maybe.withDefault "" (Maybe.map (\time -> String.left 10 (Iso8601.fromTime time)) review.submittedAt) ]
                , Html.div
                    [ Attrs.class "absolute bottom-2 right-2 text-xs text-gray-500 italic" ]
                    [ Html.text <| Translations.reviewsTranslated translation ++ " " ++ languageToTranslatedLanguage translation (Maybe.withDefault "en" review.language) ]
                ]
        ]


ratingToStars : Int -> Html msg
ratingToStars rating =
    List.repeat
        rating
        (Phosphor.star
            Phosphor.Fill
            |> withSize 18
            |> withSizeUnit "px"
            |> toHtml []
        )
        |> Html.div [ Attrs.class "flex items-center fill-current text-primary-500" ]


showReview : I18n -> Review -> Html msg
showReview translation review =
    let
        currentLanguage =
            Translations.languageToString <| Translations.currentLanguage translation
    in
    Route.link
        [ Attrs.class "cursor-pointer" ]
        [ Html.div
            [ Attrs.class "block max-w-sm p-6 rounded-lg hover:bg-gray-100 relative" ]
            [ Html.div
                [ Attrs.class "flex items-center mb-2 space-x-4" ]
                [ Html.span
                    [ Attrs.class "px-2 py-1 text-xs font-semibold text-white bg-gray-400 rounded" ]
                    [ Html.text <| userRoleEnumToTranslatedString translation review.role ]
                , Html.span
                    [ Attrs.class "mb-2 text-2xl font-bold tracking-tight text-gray-900" ]
                    [ Html.text review.name ]
                , case review.rating of
                    Just rating ->
                        ratingToStars rating

                    Nothing ->
                        Html.text ""
                ]
            , if currentLanguage == Maybe.withDefault "en" review.language then
                Html.div
                    [ Attrs.class "text-gray-700" ]
                    [ case review.content of
                        Just comment ->
                            Html.p
                                [ Attrs.class "font-normal text-gray-700" ]
                                [ Html.text (trimComment comment) ]

                        Nothing ->
                            Html.text ""
                    , Html.div
                        [ Attrs.class "text-xs text-gray-500 italic mt-2" ]
                        [ Html.text <| Maybe.withDefault "" (Maybe.map (\time -> String.left 10 (Iso8601.fromTime time)) review.submittedAt) ]
                    ]

              else
                Html.div
                    [ Attrs.class "text-gray-700 mb-2" ]
                    [ case review.content of
                        Just _ ->
                            Html.p
                                [ Attrs.class "font-normal text-gray-700" ]
                                [ Html.text <| getTranslation currentLanguage review.translations ]

                        Nothing ->
                            Html.text ""
                    , Html.div
                        [ Attrs.class "text-xs text-gray-500 italic mt-2" ]
                        [ Html.text <| Maybe.withDefault "" (Maybe.map (\time -> String.left 10 (Iso8601.fromTime time)) review.submittedAt) ]
                    , Html.div
                        [ Attrs.class "absolute bottom-2 right-2 text-xs text-gray-500 italic" ]
                        [ Html.text <| Translations.reviewsTranslated translation ++ " " ++ languageToTranslatedLanguage translation (Maybe.withDefault "en" review.language) ]
                    ]
            ]
        ]
        (Route.Lang___Reviews { lang = Translations.languageToString <| Translations.currentLanguage translation })


trimComment : String -> String
trimComment comment =
    if String.length comment > 200 then
        String.left 200 comment ++ "..."

    else
        comment
