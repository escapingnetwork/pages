module ReviewUtils exposing (..)

import BackendTask exposing (BackendTask)
import BackendTask.Env as Env
import BackendTask.Http
import Date exposing (Date)
import FatalError exposing (FatalError)
import Html exposing (Html)
import Html.Attributes as Attrs exposing (name)
import I18n as Translations exposing (I18n)
import I18nUtils exposing (languageToTranslatedLanguage)
import Json.Decode as Decode
import Json.Decode.Extra as DecodeExtra
import Json.Decode.Pipeline as Pipeline exposing (optional, required)
import Phosphor exposing (toHtml, user, withSize, withSizeUnit)
import Route exposing (Route)


type alias EnvVariables =
    { supabaseKey : String
    , siteUrl : String
    }


type alias Review =
    { id : String
    , accommodationId : String
    , name : String
    , role : UserRole
    , rating : Maybe Int
    , language : Maybe String
    , content : Maybe String
    , translations : List ReviewTranslation
    , status : ReviewStatus
    }


type ReviewStatus
    = ReviewStatusPending
    | ReviewStatusApproved
    | ReviewStatusRejected
    | ReviewStatusUnderReview


type UserRole
    = Student
    | Host


userRoleEnumToString : UserRole -> String
userRoleEnumToString role =
    case role of
        Student ->
            "student"

        Host ->
            "host"


userRoleStringToEnum : String -> UserRole
userRoleStringToEnum role =
    case role of
        "student" ->
            Student

        "host" ->
            Host

        _ ->
            Student


userRoleEnumToTranslatedString : I18n -> UserRole -> String
userRoleEnumToTranslatedString translation role =
    case role of
        Student ->
            Translations.reviewsUserTypeStudent translation

        Host ->
            Translations.reviewsUserTypeHost translation


reviewStatusStringToEnum : String -> ReviewStatus
reviewStatusStringToEnum status =
    case status of
        "pending" ->
            ReviewStatusPending

        "approved" ->
            ReviewStatusApproved

        "rejected" ->
            ReviewStatusRejected

        "under_review" ->
            ReviewStatusUnderReview

        _ ->
            ReviewStatusPending


reviewStatusEnumToString : ReviewStatus -> String
reviewStatusEnumToString status =
    case status of
        ReviewStatusPending ->
            "pending"

        ReviewStatusApproved ->
            "approved"

        ReviewStatusRejected ->
            "rejected"

        ReviewStatusUnderReview ->
            "under_review"


type alias ReviewTranslation =
    { language : String
    , content : String
    }


decodeReviews : Decode.Decoder (List Review)
decodeReviews =
    Decode.list decodeReview


decodeReview : Decode.Decoder Review
decodeReview =
    Decode.succeed Review
        |> Pipeline.required "id" Decode.string
        |> Pipeline.required "accommodation_id" Decode.string
        |> Pipeline.custom (Decode.at [ "user", "forename" ] Decode.string)
        |> Pipeline.custom (Decode.at [ "user", "role" ] (Decode.string |> Decode.andThen (Decode.succeed << userRoleStringToEnum)))
        |> Pipeline.optional "rating" (Decode.maybe Decode.int) Nothing
        |> Pipeline.optional "language" (Decode.maybe Decode.string) Nothing
        |> Pipeline.optional "content" (Decode.maybe Decode.string) Nothing
        |> Pipeline.required "review_translation" (Decode.list decodeReviewTranslation)
        |> Pipeline.required "status" (Decode.string |> Decode.andThen (Decode.succeed << reviewStatusStringToEnum))


decodeReviewTranslation : Decode.Decoder ReviewTranslation
decodeReviewTranslation =
    Decode.succeed ReviewTranslation
        |> Pipeline.required "language" Decode.string
        |> Pipeline.required "content" Decode.string


getTranslation : String -> List ReviewTranslation -> String
getTranslation language translations =
    case List.filter (\translation -> translation.language == language) translations of
        [ translation ] ->
            translation.content

        _ ->
            ""


getReviews : BackendTask FatalError (List Review)
getReviews =
    BackendTask.map2 EnvVariables
        (Env.expect "SUPABASE_KEY" |> BackendTask.allowFatal)
        (Env.get "SUPABASE_URL"
            |> BackendTask.map (Maybe.withDefault "http://localhost:1234")
        )
        |> BackendTask.andThen sendGetReviewsRequest


sendGetReviewsRequest : EnvVariables -> BackendTask FatalError (List Review)
sendGetReviewsRequest envVariables =
    BackendTask.Http.request
        { method = "GET"
        , headers =
            [ ( "Content-Type", "application/json" )
            , ( "Prefer", "return=minimal" )
            , ( "apikey", envVariables.supabaseKey )
            , ( "Authorization", "Bearer " ++ envVariables.supabaseKey )
            ]
        , body = BackendTask.Http.emptyBody
        , url = envVariables.siteUrl ++ "/rest/v1/review?status=eq.approved&select=*,user(forename,role),review_translation(language,content)"
        , retries = Nothing
        , timeoutInMs = Nothing
        }
        (BackendTask.Http.expectJson
            decodeReviews
        )
        |> BackendTask.onError
            (\_ ->
                BackendTask.succeed
                    []
            )


getReview : String -> BackendTask FatalError Review
getReview reviewId =
    BackendTask.map2 EnvVariables
        (Env.expect "SUPABASE_KEY" |> BackendTask.allowFatal)
        (Env.get "SUPABASE_URL"
            |> BackendTask.map (Maybe.withDefault "http://localhost:1234")
        )
        |> BackendTask.andThen (sendGetReviewRequest reviewId)
        |> BackendTask.map (\reviews -> Maybe.withDefault (Review "" "" "" Student Nothing Nothing Nothing [] ReviewStatusRejected) (List.head reviews))


sendGetReviewRequest : String -> EnvVariables -> BackendTask FatalError (List Review)
sendGetReviewRequest reviewId envVariables =
    BackendTask.Http.request
        { method = "GET"
        , headers =
            [ ( "Content-Type", "application/json" )
            , ( "Prefer", "return=minimal" )
            , ( "apikey", envVariables.supabaseKey )
            , ( "Authorization", "Bearer " ++ envVariables.supabaseKey )
            ]
        , body = BackendTask.Http.emptyBody
        , url = envVariables.siteUrl ++ "/rest/v1/review?id=eq." ++ reviewId ++ "&select=*,user(forename,role),review_translation(language,content)"
        , retries = Nothing
        , timeoutInMs = Nothing
        }
        (BackendTask.Http.expectJson
            decodeReviews
        )
        |> BackendTask.onError
            (\_ ->
                BackendTask.succeed
                    []
            )


showReview : I18n -> Review -> Html msg
showReview translation review =
    let
        currentLanguage =
            Translations.languageToString <| Translations.currentLanguage translation
    in
    Route.link
        [ Attrs.class "cursor-pointer" ]
        [ Html.div
            [ Attrs.class "block max-w-sm p-6 bg-white rounded-lg hover:bg-gray-100 relative" ]
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
                        Html.span
                            [ Attrs.class "flex items-center justify-between" ]
                        <|
                            [ ratingToStars rating ]

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
                                [ Html.text (trimComment comment) ]

                        Nothing ->
                            Html.text ""
                    ]

              else
                Html.div
                    [ Attrs.class "text-gray-700 dark:text-gray-400 mb-2" ]
                    [ case review.content of
                        Just _ ->
                            Html.p
                                [ Attrs.class "font-normal text-gray-700 dark:text-gray-400 " ]
                                [ Html.text <| getTranslation currentLanguage review.translations ]

                        Nothing ->
                            Html.text ""
                    , Html.div
                        [ Attrs.class "absolute bottom-2 right-2 text-xs text-gray-500 italic" ]
                        [ Html.text <| Translations.reviewsTranslated translation ++ " " ++ languageToTranslatedLanguage translation (Maybe.withDefault "en" review.language) ]
                    ]
            ]
        ]
        (Route.Reviews__Review_ { review = review.id })


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
                    Html.span
                        [ Attrs.class "flex items-center justify-between" ]
                    <|
                        [ ratingToStars rating ]

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
                    [ Attrs.class "absolute bottom-2 right-2 text-xs text-gray-500 italic" ]
                    [ Html.text <| Translations.reviewsTranslated translation ++ " " ++ languageToTranslatedLanguage translation (Maybe.withDefault "en" review.language) ]
                ]
        ]


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


trimComment : String -> String
trimComment comment =
    if String.length comment > 200 then
        String.left 200 comment ++ "..."

    else
        comment
