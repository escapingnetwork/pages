module Rating exposing (Model, Msg(..), init, update, view)

import Html exposing (Html, div, span)
import Html.Attributes as Attrs
import Html.Events exposing (onClick, onMouseEnter, onMouseLeave)
import Phosphor exposing (..)


type alias Model =
    { rating : Int
    , hoverRating : Maybe Int
    }


type Msg
    = SetRating Int
    | HoverRating Int
    | ClearHover


init : Model
init =
    { rating = 2, hoverRating = Nothing }


update : Msg -> Model -> Model
update msg model =
    let
        logmsg =
            Debug.log "msg" msg
    in
    case msg of
        SetRating newRating ->
            { model | rating = newRating, hoverRating = Nothing }

        HoverRating hover ->
            { model | hoverRating = Just hover }

        ClearHover ->
            { model | hoverRating = Nothing }


view : Model -> Html Msg
view model =
    let
        starClass rating =
            if Maybe.withDefault model.rating model.hoverRating >= rating then
                "text-primary-500"

            else
                ""

        rtings =
            Debug.log "ratings" model.rating

        hovers =
            Debug.log "hovers" model.hoverRating

        starIcon rating =
            Html.div
                [ onClick (SetRating rating)
                , onMouseEnter (HoverRating rating)
                , onMouseLeave ClearHover
                ]
            <|
                [ Phosphor.star
                    Phosphor.Fill
                    |> withSize 18
                    |> withSizeUnit "px"
                    |> toHtml
                        [ Attrs.class (starClass rating)
                        , Attrs.style "cursor" "pointer"
                        ]
                ]
    in
    div [ Attrs.class "flex items-center" ]
        (List.range 1 5 |> List.map starIcon)


ratingToStars : Int -> Html msg
ratingToStars rating =
    List.repeat
        (5 - rating)
        (Phosphor.star
            Phosphor.Fill
            |> withSize 18
            |> withSizeUnit "px"
            |> toHtml []
        )
        |> List.map (\x -> x)
        |> List.append
            (List.repeat
                rating
                (Phosphor.star
                    Phosphor.Fill
                    |> withSize 18
                    |> withSizeUnit "px"
                    |> toHtml [ Attrs.class "text-primary-500" ]
                )
            )
        |> List.map (\x -> x)
        |> Html.div [ Attrs.class "flex items-center" ]
