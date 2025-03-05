module ReviewUtils exposing (..)

import BackendTask exposing (BackendTask)
import BackendTask.Env as Env
import BackendTask.Http
import Date exposing (Date)
import FatalError exposing (FatalError)
import Html exposing (Html, tr)
import Html.Attributes as Attrs exposing (name)
import I18n as Translations exposing (I18n)
import I18nUtils exposing (languageToTranslatedLanguage)
import Iso8601
import Json.Decode as Decode
import Json.Decode.Extra as DecodeExtra
import Json.Decode.Pipeline as Pipeline exposing (optional, required)
import Phosphor exposing (toHtml, user, withSize, withSizeUnit)
import Route exposing (Route)
import Time


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
    , submittedAt : Maybe Time.Posix
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
        |> Pipeline.optional "submitted_at" (Decode.maybe DecodeExtra.datetime) Nothing


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


getHomeReviews : BackendTask FatalError (List Review)
getHomeReviews =
    BackendTask.map2 EnvVariables
        (Env.expect "SUPABASE_KEY" |> BackendTask.allowFatal)
        (Env.get "SUPABASE_URL"
            |> BackendTask.map (Maybe.withDefault "http://localhost:1234")
        )
        |> BackendTask.andThen (sendGetHomeReviewsRequest 3)


sendGetHomeReviewsRequest : Int -> EnvVariables -> BackendTask FatalError (List Review)
sendGetHomeReviewsRequest limit envVariables =
    BackendTask.Http.request
        { method = "GET"
        , headers =
            [ ( "Content-Type", "application/json" )
            , ( "Prefer", "return=minimal" )
            , ( "apikey", envVariables.supabaseKey )
            , ( "Authorization", "Bearer " ++ envVariables.supabaseKey )
            ]
        , body = BackendTask.Http.emptyBody
        , url = envVariables.siteUrl ++ "/rest/v1/review?status=eq.approved&select=*,user(forename,role),review_translation(language,content)&limit=" ++ String.fromInt limit
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
        |> BackendTask.map (\reviews -> Maybe.withDefault (Review "" "" "" Student Nothing Nothing Nothing [] ReviewStatusRejected Nothing) (List.head reviews))


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
