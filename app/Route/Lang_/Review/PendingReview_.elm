module Route.Lang_.Review.PendingReview_ exposing
    ( Model, Msg, RouteParams, route, Data, ActionData
    , EnvVariables, RatingEnum(..), ReviewForm
    )

{-|

@docs Model, Msg, RouteParams, route, Data, ActionData

-}

import BackendTask
import BackendTask.Custom
import BackendTask.Env as Env
import BackendTask.Http exposing (jsonBody)
import Content.Minimal
import Dict
import ErrorPage exposing (ErrorPage)
import FatalError exposing (FatalError)
import Form
import Form.Field as Field
import Form.FieldView
import Form.Handler
import Form.Validation as Validation
import Head
import Html exposing (Html)
import Html.Attributes as Attrs
import I18n as Translations exposing (..)
import I18nUtils
import Json.Encode as Encode
import Layout
import Layout.Minimal
import Pages.Form
import PagesMsg exposing (PagesMsg)
import ReviewUtils exposing (Review, getReview, reviewStatusEnumToString)
import Route
import RouteBuilder exposing (App, StatelessRoute)
import Server.Request as Request exposing (Request)
import Server.Response
import Shared
import View


type alias Model =
    {}


type alias Msg =
    ()


type alias RouteParams =
    { lang : String, pendingReview : String }


type alias EnvVariables =
    { supabaseKey : String
    , siteUrl : String
    }


route : StatelessRoute RouteParams Data ActionData
route =
    RouteBuilder.serverRender
        { head = head
        , data = data
        , action = action
        }
        |> RouteBuilder.buildNoState { view = view }


type alias Data =
    { pendingReview : Review
    , translation : Translations.I18n
    , minimal : Content.Minimal.Minimal
    }


type alias ActionData =
    { review : ReviewForm
    , formResponse : Form.ServerResponse String
    }


data : RouteParams -> Request -> BackendTask.BackendTask FatalError (Server.Response.Response Data ErrorPage)
data routeParams request =
    Content.Minimal.review routeParams.lang
        |> BackendTask.allowFatal
        |> BackendTask.map3 Data
            (getReview routeParams.pendingReview)
            (I18nUtils.loadLanguage routeParams.lang)
        |> BackendTask.map Server.Response.render


head : RouteBuilder.App Data ActionData RouteParams -> List Head.Tag
head app =
    Layout.seoHeaders
        (Translations.seoReviewsTitle app.data.translation)
        (Translations.seoReviewsDescription app.data.translation)
        app.data.translation


type alias ReviewForm =
    { id : String
    , content : String
    , rating : Maybe RatingEnum
    , language : String
    }


emptyForm : ReviewForm
emptyForm =
    { id = ""
    , content = ""
    , rating = Nothing
    , language = ""
    }


type RatingEnum
    = One
    | Two
    | Three
    | Four
    | Five


ratingToString : RatingEnum -> String
ratingToString rting =
    case rting of
        One ->
            "1"

        Two ->
            "2"

        Three ->
            "3"

        Four ->
            "4"

        Five ->
            "5"


rtingToInt : RatingEnum -> Int
rtingToInt rting =
    case rting of
        One ->
            1

        Two ->
            2

        Three ->
            3

        Four ->
            4

        Five ->
            5


form : I18n -> Form.HtmlForm String ReviewForm ReviewForm (PagesMsg Msg)
form t =
    Form.form
        (\id content rating language ->
            { combine =
                Validation.succeed ReviewForm
                    |> Validation.andMap id
                    |> Validation.andMap content
                    |> Validation.andMap rating
                    |> Validation.andMap language
            , view =
                \formState ->
                    let
                        errors : Validation.Field String parsed kind -> List String
                        errors field =
                            formState.errors
                                |> Form.errorsForField field

                        errorsView : Validation.Field String parsed kind -> Html msg
                        errorsView field =
                            case ( formState.submitAttempted, field |> errors ) of
                                ( True, firstItem :: rest ) ->
                                    Html.div []
                                        [ Html.ul
                                            [ Attrs.class "mt-2 text-sm text-red-600 dark:text-red-500"
                                            ]
                                            (List.map
                                                (\error ->
                                                    Html.li []
                                                        [ Html.text error
                                                        ]
                                                )
                                                (firstItem :: rest)
                                            )
                                        ]

                                _ ->
                                    Html.div [] []

                        fieldView : String -> Validation.Field String parsed Form.FieldView.Input -> Html msg
                        fieldView label field =
                            Html.div [ Attrs.class "mb-5" ]
                                [ Html.label [ Attrs.class "block mb-2 text-lg font-semibold text-gray-900 dark:text-white" ]
                                    [ Html.text (label ++ " ")
                                    , field |> Form.FieldView.input [ Attrs.class "bg-gray-50 mt-2 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-primary-500 focus:border-primary-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500" ]
                                    ]
                                , errorsView field
                                ]

                        fieldViewRating : String -> Validation.Field String parsed (Form.FieldView.Options RatingEnum) -> Html msg
                        fieldViewRating label field =
                            Html.div [ Attrs.class "mb-5" ]
                                [ Html.label [ Attrs.class "mb-2 text-lg font-semibold text-gray-900 dark:text-white" ]
                                    [ Html.text (label ++ " ")
                                    , Html.div [ Attrs.class "mt-2 max-w-sm max-auto" ]
                                        [ Form.FieldView.radio [ Attrs.class "flex justify-between" ]
                                            (\enum toRadio ->
                                                Html.label [ Attrs.class "review-cell mt-2" ]
                                                    [ toRadio [ Attrs.class "hidden peer" ]
                                                    , Html.div
                                                        [ Attrs.class "w-12 h-12 rounded-lg bg-gray-200 flex items-center justify-center cursor-pointer transition duration-300 ease-in-out hover:bg-primary-600 hover:text-white peer-checked:bg-primary-500 peer-checked:text-white" ]
                                                        [ Html.text (ratingToString enum) ]
                                                    ]
                                            )
                                            field
                                        ]
                                    , Html.div [ Attrs.class "mt-2 text-xs text-gray-600 dark:text-gray-400 flex justify-between" ]
                                        [ Html.span [] [ Html.text <| Translations.formsRatingVeryUnsatisfied t ]
                                        , Html.span [] [ Html.text <| Translations.formsRatingVerySatisfied t ]
                                        ]
                                    ]
                                , errorsView field
                                ]
                    in
                    [ fieldViewRating (Translations.formsRatingCapybara t) rating
                    , fieldView (Translations.formsContentCapybara t) content
                    , Html.button [ Attrs.class "text-white bg-primary-500 hover:bg-primary-600 focus:ring-4 focus:outline-none focus:ring-primary-300 font-medium rounded-lg text-md w-full sm:w-auto px-5 py-2.5 text-center dark:bg-primary-600 dark:hover:bg-primary-700 dark:focus:ring-primary-800" ]
                        [ Html.text
                            (if formState.submitting then
                                Translations.formsSubmitting t

                             else
                                Translations.formsSubmit t
                            )
                        ]
                    ]
            }
        )
        |> Form.hiddenField "id"
            (Field.text
                |> Field.required (Translations.formsErrorRequired t)
                |> Field.withInitialValue .id
            )
        |> Form.field "content"
            (Field.text
                |> Field.textarea
                    { rows = Just 5
                    , cols = Just 20
                    }
                |> Field.required (Translations.formsErrorRequired t)
            )
        |> Form.field "rating"
            (Field.select
                [ ( "1", One )
                , ( "2", Two )
                , ( "3", Three )
                , ( "4", Four )
                , ( "5", Five )
                ]
                (\_ -> "Invalid")
                |> Field.withInitialValue (\_ -> Five)
            )
        |> Form.hiddenField "language"
            (Field.text
                |> Field.required (Translations.formsErrorRequired t)
                |> Field.withInitialValue .language
            )


view :
    App Data ActionData RouteParams
    -> Shared.Model
    -> View.View (PagesMsg.PagesMsg Msg)
view app shared =
    { title = "Capybara House - " ++ Translations.reviewsTitle shared.i18n
    , body =
        [ Html.div [ Attrs.class "mx-auto prose max-w-none pb-8 pt-8 dark:prose-invert xl:col-span-2 xl:max-w-5xl xl:px-0" ] <|
            List.append (Layout.Minimal.viewEmbeded app.data.minimal)
                [ if (app.data.pendingReview |> .status) == ReviewUtils.ReviewStatusPending then
                    form app.data.translation
                        |> Pages.Form.renderHtml
                            [ Attrs.class "max-w-sm mx-auto"
                            ]
                            (Form.options "review-form"
                                |> Form.withInput { emptyForm | id = app.data.pendingReview |> .id, language = Translations.languageToString <| Translations.currentLanguage app.data.translation }
                                |> Form.withServerResponse (app.action |> Maybe.map .formResponse)
                            )
                            app

                  else
                    Html.div [ Attrs.class "text-center" ]
                        [ Html.h2 [] [ Html.text <| Translations.formsReviewSuccess app.data.translation ]
                        , Html.p [] [ Html.text <| Translations.formsReviewMessage app.data.translation ]
                        ]
                , if Dict.isEmpty <| Maybe.withDefault Dict.empty ((app.action |> Maybe.map .formResponse) |> Maybe.map .serverSideErrors) then
                    Html.text ""

                  else
                    Html.div
                        [ Attrs.class "max-w-sm mx-auto p-4 mb-4 mt-4 border border-red-300 text-center text-md text-red-800 rounded-lg bg-red-50 dark:bg-gray-800 dark:text-red-400"
                        , Attrs.attribute "role" "alert"
                        ]
                        [ Html.span
                            [ Attrs.class "font-semibold"
                            ]
                            [ Html.text <| Translations.formsError app.data.translation ]
                        , Html.span
                            [ Attrs.class "font-medium"
                            ]
                            [ Html.br [] []
                            , Html.text <| Translations.formsErrorContact app.data.translation ++ " "
                            , Html.a
                                [ Attrs.href "mailto:info@capybara.house"
                                , Attrs.class "hover:text-primary-600 "
                                ]
                                [ Html.text "info@capybara.house" ]
                            ]
                        ]
                ]
        ]
    }


action :
    RouteParams
    -> Request.Request
    -> BackendTask.BackendTask FatalError.FatalError (Server.Response.Response ActionData ErrorPage.ErrorPage)
action routeParams request =
    case request |> Request.formData (form (Translations.init { lang = Maybe.withDefault Translations.En (Translations.languageFromString routeParams.lang), path = "https://capybara.house" ++ "/i18n" }) |> Form.Handler.init identity) of
        Nothing ->
            "Expected form submission."
                |> FatalError.fromString
                |> BackendTask.fail

        Just ( formResponse, parsedForm ) ->
            case parsedForm of
                Form.Valid _ ->
                    BackendTask.map2 EnvVariables
                        (Env.expect "SUPABASE_KEY" |> BackendTask.allowFatal)
                        (Env.get "SUPABASE_URL"
                            |> BackendTask.map (Maybe.withDefault "http://localhost:1234")
                        )
                        |> BackendTask.andThen (sendRequest formResponse parsedForm)

                Form.Invalid _ _ ->
                    BackendTask.succeed
                        (Server.Response.render
                            (ActionData
                                emptyForm
                                formResponse
                            )
                        )


reviewToJSON : ReviewForm -> Encode.Value
reviewToJSON review =
    Encode.object
        [ ( "content", Encode.string review.content )
        , ( "rating", Encode.int <| rtingToInt <| Maybe.withDefault One review.rating )
        , ( "language", Encode.string review.language )
        , ( "status", Encode.string <| reviewStatusEnumToString ReviewUtils.ReviewStatusUnderReview )
        ]


sendRequest : Form.ServerResponse String -> Form.Validated String ReviewForm -> EnvVariables -> BackendTask.BackendTask FatalError.FatalError (Server.Response.Response ActionData ErrorPage.ErrorPage)
sendRequest formResponse userResult envVariables =
    let
        reviewRequestBody =
            reviewToJSON
                (userResult
                    |> Form.toResult
                    |> Result.withDefault emptyForm
                )
                |> jsonBody

        reviewId =
            userResult
                |> Form.toResult
                |> Result.withDefault emptyForm
                |> .id
    in
    BackendTask.Http.request
        { method = "PATCH"
        , headers =
            [ ( "Content-Type", "application/json" )
            , ( "Prefer", "return=minimal" )
            , ( "apikey", envVariables.supabaseKey )
            , ( "Authorization", "Bearer " ++ envVariables.supabaseKey )
            ]
        , url = envVariables.siteUrl ++ "/rest/v1/review?id=eq." ++ reviewId
        , body = reviewRequestBody
        , retries = Nothing
        , timeoutInMs = Nothing
        }
        (BackendTask.Http.expectWhatever
            (ActionData
                emptyForm
                formResponse
            )
        )
        |> BackendTask.onError
            (\_ ->
                BackendTask.succeed
                    (ActionData
                        emptyForm
                        { formResponse | serverSideErrors = Dict.singleton "ERROR" [ "ERROR" ] }
                    )
            )
        |> BackendTask.map
            (\response ->
                if Dict.isEmpty response.formResponse.serverSideErrors then
                    let
                        review =
                            userResult
                                |> Form.toResult
                                |> Result.withDefault emptyForm
                    in
                    Route.Lang___Review__PendingReview_ { lang = review.language, pendingReview = review.id }
                        |> Route.redirectTo

                else
                    Server.Response.render response
            )
