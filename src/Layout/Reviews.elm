module Layout.Reviews exposing (view)

import Html exposing (Html, div)
import Html.Attributes exposing (class)
import I18n exposing (I18n)
import ReviewUtils exposing (Review, showFullReview)


view : I18n -> List Review -> Html msg
view i18n reviews =
    div [ class "container mx-auto p-4" ]
        (List.map (showFullReview i18n) reviews)
