module Layout.Service exposing
    ( viewListItem
    , viewService
    , viewServiceList
    )

import Content.Services exposing (Metadata, Service)
import Html exposing (Html)
import Html.Attributes as Attrs
import Html.Extra
import Layout.Markdown as Markdown
import Route



-- VIEW


authorImages : List { a | image : String } -> Html msg
authorImages authors =
    List.map
        (\{ image } ->
            Html.img
                [ Attrs.alt "avatar"
                , Attrs.attribute "loading" "lazy"
                , Attrs.width 38
                , Attrs.height 38
                , Attrs.attribute "decoding" "async"
                , Attrs.attribute "data-nimg" "1"
                , Attrs.class "h-12 w-12 rounded-full hidden sm:block"
                , Attrs.style "color" "transparent"
                , Attrs.src image
                ]
                []
        )
        authors
        |> Html.div [ Attrs.class "flex -space-x-2" ]


viewService : Service -> Html msg
viewService { service, body, previousService, nextService } =
    let
        bottomLink slug title =
            Route.link
                [ Attrs.class "hover:text-primary-400 dark:hover:text-primary-400" ]
                [ Html.text title ]
                (Route.Services__Slug_ { slug = slug })

        previous =
            previousService
                |> Html.Extra.viewMaybe
                    (\{ title, slug, image } ->
                        Html.div
                            [ Attrs.class "sm:col-start-1 mt-4 xl:mt-8 relative"
                            ]
                            [ image
                                |> Html.Extra.viewMaybe
                                    (\imagePath ->
                                        Html.img
                                            [ Attrs.alt title
                                            , Attrs.attribute "decoding" "async"
                                            , Attrs.class "h-48 w-full object-cover md:h-144 md:w-full"
                                            , Attrs.src imagePath
                                            ]
                                            []
                                    )
                            , Html.div
                                [ Attrs.class "uppercase tracking-wide text-4xl font-semibold absolute text-white top-1/2 left-1/2 -translate-x-1/2 -translate-y-1/2"
                                ]
                                [ title |> bottomLink slug
                                ]
                            ]
                    )

        next =
            nextService
                |> Html.Extra.viewMaybe
                    (\{ title, slug, image } ->
                        Html.div
                            [ Attrs.class "sm:col-start-2 mt-4 xl:mt-8 relative"
                            ]
                            [ image
                                |> Html.Extra.viewMaybe
                                    (\imagePath ->
                                        Html.img
                                            [ Attrs.alt title
                                            , Attrs.attribute "decoding" "async"
                                            , Attrs.class "h-48 w-full object-cover md:h-144 md:w-full"
                                            , Attrs.src imagePath
                                            ]
                                            []
                                    )
                            , Html.div
                                [ Attrs.class "uppercase tracking-wide text-4xl font-semibold absolute text-white top-1/2 left-1/2 -translate-x-1/2 -translate-y-1/2"
                                ]
                                [ title |> bottomLink slug
                                ]
                            ]
                    )

        header =
            Html.div
                [ Attrs.class "max-w-[65ch] m-auto space-y-1 xl:text-xl dark:border-gray-700"
                ]
                [ Html.div
                    []
                    [ Html.h1 [ Attrs.class "mt-8 pb-4 font-bold text-3xl md:text-5xl text-gray-900 dark:text-gray-100 items-center text-center" ]
                        [ Html.text service.title
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
                                        [ Attrs.alt service.title
                                        , Attrs.attribute "loading" "lazy"
                                        , Attrs.attribute "decoding" "async"
                                        , Attrs.attribute "data-nimg" "fill"
                                        , Attrs.class "object-cover"
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
                    service.image
                ]
    in
    Html.div []
        [ header

        -- , Html.Extra.viewMaybe
        --     (\description ->
        --         Html.div
        --             [ Attrs.class "mx-auto prose-p:my-4 prose lg:prose-xl dark:prose-invert" ]
        --             [ Html.p [ Attrs.class "font-bold" ] [ Html.text description ] ]
        --     )
        --     service.description
        , Html.article
            [ Attrs.class "mx-auto prose lg:prose-xl dark:prose-invert pt-10" ]
            (Markdown.blogpostToHtml body)
        , Html.div
            [ Attrs.class "mx-auto grid grid-flow-row sm:grid-cols-2 text-sm font-medium sm:text-base" ]
            [ previous, next ]
        ]


viewServiceMetadata : Metadata -> Html msg
viewServiceMetadata metadata =
    Html.article
        [ Attrs.class "space-y-2 flex flex-col xl:space-y-0"
        ]
        [ Html.div
            [ Attrs.class "space-y-3"
            ]
            [ Html.div []
                [ Html.h2
                    [ Attrs.class "text-2xl font-bold leading-8 tracking-tight"
                    ]
                    [ Route.Services__Slug_ { slug = metadata.slug }
                        |> Route.link
                            [ Attrs.class "text-gray-900 hover:underline decoration-primary-600 dark:text-gray-100"
                            ]
                            [ Html.text metadata.title ]
                    ]
                ]
            , Html.Extra.viewMaybe
                (\description ->
                    Html.div
                        [ Attrs.class "prose max-w-none text-gray-500 dark:text-gray-400"
                        ]
                        [ Html.text description ]
                )
                metadata.description
            ]
        ]


viewListItem : Metadata -> Html.Html msg
viewListItem metadata =
    Html.div
        [ Attrs.class "row-span 3"
        ]
        [ Html.Extra.viewMaybe
            (\imagePath ->
                Html.div
                    [ Attrs.class "md:shrink-0 relative"
                    ]
                    [ Html.img
                        [ Attrs.alt metadata.title
                        , Attrs.attribute "decoding" "async"
                        , Attrs.class "h-48 w-full object-cover md:h-144 md:w-full"
                        , Attrs.src imagePath
                        ]
                        []
                    , Html.h2
                        [ Attrs.class "uppercase tracking-wide text-4xl font-semibold absolute text-white top-1/2 left-1/2 -translate-x-1/2 -translate-y-1/2"
                        ]
                        [ Route.Services__Slug_ { slug = metadata.slug }
                            |> Route.link
                                [ Attrs.class "hover:text-primary-400 dark:hover:text-primary-400"
                                ]
                                [ Html.text metadata.title ]
                        ]
                    ]
            )
            metadata.image
        , Html.div [ Attrs.class "p-8" ]
            [ Html.Extra.viewMaybe
                (\description ->
                    Html.div
                        [ Attrs.class "block mt-1 text-lg leading-tight font-medium text-gray-500"
                        ]
                        [ Html.text description ]
                )
                metadata.description
            ]
        ]


viewServiceList : List Metadata -> List (Html msg)
viewServiceList metadata =
    let
        header =
            Html.h1
                [ Attrs.class "sm:hidden text-3xl font-extrabold leading-9 tracking-tight text-gray-900 dark:text-gray-100 sm:text-4xl sm:leading-10 md:text-6xl md:leading-14"
                ]
                [ Html.text "All Posts" ]

        allPostsLink =
            Html.h3
                [ Attrs.class "text-primary-700 dark:text-primary-500 font-bold uppercase"
                ]
                [ Html.text "All Posts" ]
    in
    [ Html.div [ Attrs.class "pb-6 pt-6" ] [ header ]
    , Html.div [ Attrs.class "flex sm:space-x-2 md:space-x-12" ]
        [ Html.div [ Attrs.class "hidden max-h-screen h-full sm:flex flex-wrap bg-gray-50 dark:bg-gray-900/70 shadow-md pt-5 dark:shadow-gray-800/40 rounded min-w-[280px] max-w-[280px] overflow-auto" ]
            [ Html.div
                [ Attrs.class "py-4 px-6"
                ]
                [ allPostsLink
                ]
            ]
        , Html.div [] [ Html.ul [] <| List.map (\article -> Html.li [ Attrs.class "py-5" ] [ viewServiceMetadata article ]) metadata ]
        ]
    ]
