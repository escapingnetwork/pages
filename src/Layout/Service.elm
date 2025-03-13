module Layout.Service exposing
    ( viewLangListItem
    , viewListItem
    , viewService
    )

import Content.Services exposing (Metadata, Service)
import Html exposing (Html)
import Html.Attributes as Attrs
import Html.Extra
import I18n as Translations exposing (..)
import Layout.Markdown as Markdown
import Route



-- VIEW


viewService : I18n -> Service -> Html msg
viewService translation { metadata, body, previousService, nextService } =
    let
        previous =
            previousService
                |> Html.Extra.viewMaybe
                    (\{ title, slug, image } ->
                        Html.div
                            [ Attrs.class "relative text-white hover:text-primary-500 w-full lg:col-start-2"
                            ]
                            [ Route.Lang___Services__Slug_ { lang = Translations.languageToString <| Translations.currentLanguage translation, slug = slug }
                                |> Route.link
                                    []
                                    [ image
                                        |> Html.Extra.viewMaybe
                                            (\imagePath ->
                                                Html.img
                                                    [ Attrs.alt title
                                                    , Attrs.attribute "decoding" "async"
                                                    , Attrs.class "h-32 w-full object-cover md:h-48 md:w-full rounded-lg"
                                                    , Attrs.src imagePath
                                                    ]
                                                    []
                                            )
                                    , Html.h2
                                        [ Attrs.class "uppercase tracking-wide md:text-2xl text-xl font-extrabold absolute top-1/2 left-1/2 transform -translate-x-1/2 -translate-y-1/2"
                                        ]
                                        [ Html.text title ]
                                    ]
                            ]
                    )

        next =
            nextService
                |> Html.Extra.viewMaybe
                    (\{ title, slug, image } ->
                        Html.div
                            [ Attrs.class "relative text-white hover:text-primary-500 w-full lg:col-start-3"
                            ]
                            [ Route.Lang___Services__Slug_ { lang = Translations.languageToString <| Translations.currentLanguage translation, slug = slug }
                                |> Route.link
                                    []
                                    [ image
                                        |> Html.Extra.viewMaybe
                                            (\imagePath ->
                                                Html.img
                                                    [ Attrs.alt title
                                                    , Attrs.attribute "decoding" "async"
                                                    , Attrs.class "h-32 w-full object-cover md:h-48 md:w-full rounded-lg"
                                                    , Attrs.src imagePath
                                                    ]
                                                    []
                                            )
                                    , Html.h2
                                        [ Attrs.class "uppercase tracking-wide md:text-2xl text-xl font-extrabold absolute top-1/2 left-1/2 transform -translate-x-1/2 -translate-y-1/2"
                                        ]
                                        [ Html.text title ]
                                    ]
                            ]
                    )

        header =
            Html.div
                [ Attrs.class "max-w-[65ch] m-auto space-y-1 xl:text-xl dark:border-gray-700"
                ]
                [ Html.div
                    []
                    [ Html.h1 [ Attrs.class "mt-8 pb-4 font-extrabold text-3xl md:text-5xl text-gray-900 dark:text-gray-100 items-center text-center" ]
                        [ Html.text metadata.title
                        ]
                    ]
                , Html.Extra.viewMaybe
                    (\imagePath ->
                        Html.div
                            [ Attrs.class "w-full"
                            ]
                            [ Html.div
                                [ Attrs.class "relative mt-6 -mx-6 md:-mx-8 2xl:-mx-24"
                                ]
                                [ Html.div
                                    [ Attrs.class "aspect-[2/1] w-full relative"
                                    ]
                                    [ Html.img
                                        [ Attrs.alt metadata.title
                                        , Attrs.attribute "loading" "lazy"
                                        , Attrs.attribute "decoding" "async"
                                        , Attrs.attribute "data-nimg" "fill"
                                        , Attrs.class "object-cover rounded-lg"
                                        , Attrs.attribute "sizes" "100vw"
                                        , Attrs.style "position" "absolute"
                                        , Attrs.style "height" "100%"
                                        , Attrs.style "width" "100%"
                                        , Attrs.style "inset" "0px"
                                        , Attrs.style "color" "transparent"
                                        , Attrs.src imagePath
                                        ]
                                        []
                                    ]
                                ]
                            ]
                    )
                    metadata.image
                ]
    in
    Html.div []
        [ header
        , Html.article
            [ Attrs.class "mx-auto prose lg:prose-xl dark:prose-invert pt-10"
            ]
            (Markdown.blogpostToHtml body)
        , Html.div [ Attrs.class "text-center mt-10" ]
            [ Route.link
                [ Attrs.class "inline-flex justify-center py-5 px-10 text-base font-semibold text-center text-white rounded-lg bg-primary-500 hover:bg-primary-600 focus:ring-4 focus:ring-primary-300 dark:focus:ring-primary-600"
                ]
                [ Html.text <| Translations.buttonRequestAccommodation translation
                ]
                (Route.Lang___Student__SignUp
                    { lang = Translations.languageToString <| Translations.currentLanguage translation }
                )
            ]
        , Html.div
            [ Attrs.class "mx-auto grid grid-cols-1 lg:grid-cols-4 gap-4 mt-10"
            ]
            [ previous, next ]
        ]


viewListItem : I18n -> Metadata -> Html.Html msg
viewListItem translation metadata =
    Html.div
        [ Attrs.class "row-span-3"
        ]
        [ Html.Extra.viewMaybe
            (\imagePath ->
                Html.div
                    [ Attrs.class "md:shrink-0 relative text-white hover:text-primary-500"
                    ]
                    [ Route.Services__Slug_ { slug = metadata.slug }
                        |> Route.link
                            []
                            [ Html.img
                                [ Attrs.alt metadata.title
                                , Attrs.attribute "decoding" "async"
                                , Attrs.class "h-32 w-full object-cover md:h-48 md:w-full rounded-lg"
                                , Attrs.src imagePath
                                ]
                                []
                            , Html.h2
                                [ Attrs.class "uppercase tracking-wide md:text-2xl text-xl font-extrabold absolute top-1/2 left-1/2 transform -translate-x-1/2 -translate-y-1/2"
                                ]
                                [ Html.text metadata.title ]
                            ]
                    ]
            )
            metadata.image
        , Html.div [ Attrs.class "p-4 md:p-8" ]
            [ Html.Extra.viewMaybe
                (\description ->
                    Html.div
                        [ Attrs.class "block mt-1 text-lg leading-tight font-medium text-gray-500"
                        ]
                        [ Html.text description ]
                )
                metadata.description
            , Route.Services__Slug_ { slug = metadata.slug }
                |> Route.link
                    [ Attrs.class "text-right block mt-1 font-extrabold hover:text-primary-500" ]
                    [ Html.text <| Translations.servicesReadmore translation ++ "..." ]
            ]
        ]


viewLangListItem : I18n -> Metadata -> Html.Html msg
viewLangListItem translation metadata =
    Html.div
        [ Attrs.class "row-span-3"
        ]
        [ Html.Extra.viewMaybe
            (\imagePath ->
                Html.div
                    [ Attrs.class "md:shrink-0 relative text-white hover:text-primary-500"
                    ]
                    [ Route.Lang___Services__Slug_ { lang = Translations.languageToString <| Translations.currentLanguage translation, slug = metadata.slug }
                        |> Route.link
                            []
                            [ Html.img
                                [ Attrs.alt metadata.title
                                , Attrs.attribute "decoding" "async"
                                , Attrs.class "h-32 w-full object-cover md:h-48 md:w-full rounded-lg"
                                , Attrs.src imagePath
                                ]
                                []
                            , Html.h2
                                [ Attrs.class "uppercase tracking-wide md:text-2xl text-xl font-extrabold absolute top-1/2 left-1/2 transform -translate-x-1/2 -translate-y-1/2"
                                ]
                                [ Html.text metadata.title ]
                            ]
                    ]
            )
            metadata.image
        , Html.div [ Attrs.class "p-4 md:p-8" ]
            [ Html.Extra.viewMaybe
                (\description ->
                    Html.div
                        [ Attrs.class "block mt-1 text-lg leading-tight font-medium text-gray-500"
                        ]
                        [ Html.text description ]
                )
                metadata.description
            , Route.Lang___Services__Slug_ { lang = Translations.languageToString <| Translations.currentLanguage translation, slug = metadata.slug }
                |> Route.link
                    [ Attrs.class "text-right block mt-1 font-extrabold hover:text-primary-500" ]
                    [ Html.text <| Translations.servicesReadmore translation ++ "..." ]
            ]
        ]
