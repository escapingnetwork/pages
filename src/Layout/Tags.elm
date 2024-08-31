module Layout.Tags exposing (viewTag)

import Html exposing (Html)
import Html.Attributes as Attrs
import Route
import String.Normalize


viewTag : String -> Html msg
viewTag slug =
    Route.Tags__Slug_ { slug = String.Normalize.slug slug }
        |> Route.link
            [ Attrs.class "text-sm font-medium uppercase text-primary-700 dark:text-primary-500 hover:text-primary-600 dark:hover:text-primary-400"
            ]
            [ Html.text slug ]
