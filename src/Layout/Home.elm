module Layout.Home exposing (view)

import Html exposing (Html)
import Html.Attributes as Attrs
import I18n as Translations exposing (..)
import Route


view : I18n -> Html msg
view translation =
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
                    [ Html.text <| Translations.homeHeadline translation ]
                , Html.p
                    [ Attrs.class "mb-8 text-lg font-bold text-gray-200 lg:text-xl sm:px-16 lg:px-48"
                    ]
                    [ Html.text <| Translations.homeSubline translation ]
                , Html.div
                    [ Attrs.class "flex flex-col space-y-4 sm:flex-row sm:justify-center sm:space-y-0"
                    ]
                    [ Route.link
                        [ Attrs.class "inline-flex justify-center items-center py-3 px-5 text-base font-semibold text-center text-white rounded-lg bg-primary-500 hover:bg-primary-600 focus:ring-4 focus:ring-primary-300 dark:focus:ring-primary-600"
                        ]
                        [ Html.text <| Translations.buttonRequestAccommodation translation
                        ]
                        (Route.Lang___Student__SignUp
                            { lang = Translations.languageToString <| Translations.currentLanguage translation }
                        )
                    , Route.link
                        [ Attrs.class "inline-flex justify-center hover:text-gray-900 items-center py-3 px-5 sm:ms-4 text-base font-semibold text-center text-white rounded-lg border border-white hover:bg-gray-100 focus:ring-4 focus:ring-gray-400"
                        ]
                        [ Html.text <| Translations.buttonServices translation ]
                        (Route.Lang___Services
                            { lang = Translations.languageToString <| Translations.currentLanguage translation }
                        )
                    ]
                ]
            , Html.video
                [ Attrs.autoplay True
                , Attrs.loop True
                , Attrs.attribute "muted" ""
                , Attrs.id "dublin"
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
        ]
