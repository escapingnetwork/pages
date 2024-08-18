module Route.Lang_.Support exposing (..)

{-|

@docs Model, Msg, RouteParams, route, Data, ActionData

-}

import BackendTask
import BackendTask.Env as Env
import BackendTask.Http exposing (emptyBody, jsonBody)
import Content.Minimal
import Date exposing (Date)
import Dict
import Effect
import ErrorPage exposing (ErrorPage)
import FatalError exposing (FatalError)
import Form
import Form.Field as Field
import Form.FieldView
import Form.Handler
import Form.Validation as Validation
import Head
import Html exposing (Html, u)
import Html.Attributes as Attrs exposing (height)
import I18n as Translations exposing (..)
import Json.Encode as Encode
import Layout.Minimal
import Pages.Form
import Pages.FormData
import PagesMsg exposing (PagesMsg)
import Phosphor exposing (userRectangle)
import Route
import RouteBuilder exposing (App, StatelessRoute)
import Server.Request as Request exposing (Request)
import Server.Response
import Shared
import Time
import UrlPath
import View


type alias Model =
    {}


type alias Msg =
    ()


type alias RouteParams =
    { lang : String }


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
    { minimal : Content.Minimal.Minimal
    }


type alias ActionData =
    { contact : Contact
    , formResponse : Form.ServerResponse String
    }


data : RouteParams -> Request -> BackendTask.BackendTask FatalError (Server.Response.Response Data ErrorPage)
data routeParams request =
    mdText routeParams.lang
        |> BackendTask.map Server.Response.render


mdText : String -> BackendTask.BackendTask FatalError Data
mdText lang =
    Content.Minimal.support lang
        |> BackendTask.allowFatal
        |> BackendTask.map Data


head : RouteBuilder.App Data ActionData RouteParams -> List Head.Tag
head app =
    []


type alias Contact =
    { forename : String
    , surname : String
    , email : String
    , phoneNumber : String
    , message : String
    }


emptyForm : Contact
emptyForm =
    { forename = ""
    , surname = ""
    , email = ""
    , phoneNumber = ""
    , message = ""
    }


form : Maybe I18n -> Form.HtmlForm String Contact Contact (PagesMsg Msg)
form translation =
    let
        t =
            Maybe.withDefault (Translations.init { lang = Translations.En, path = "https://capybara.house" ++ "/i18n" }) translation
    in
    Form.form
        (\forename surname email phoneNumber message ->
            { combine =
                Validation.succeed Contact
                    |> Validation.andMap forename
                    |> Validation.andMap surname
                    |> Validation.andMap email
                    |> Validation.andMap phoneNumber
                    |> Validation.andMap message
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
                    in
                    [ Html.input [ Attrs.type_ "hidden", Attrs.attribute "name" "form-name", Attrs.attribute "value" "support-form" ] []
                    , fieldView (Translations.formsForename t) forename
                    , fieldView (Translations.formsSurname t) surname
                    , fieldView (Translations.formsEmail t) email
                    , fieldView (Translations.formsPhone t) phoneNumber
                    , fieldView (Translations.formsMessage t) message
                    , Html.button [ Attrs.class "text-white bg-primary-500 hover:bg-primary-600 focus:ring-4 focus:outline-none focus:ring-primary-300 font-medium rounded-lg text-md w-full sm:w-auto px-5 py-2.5 text-center dark:bg-primary-600 dark:hover:bg-primary-700 dark:focus:ring-primary-800" ]
                        [ Html.text
                            (if formState.submitting then
                                Translations.formsSubmitting t

                             else
                                Translations.formsSubmit t
                            )
                        ]
                    ]

            --
            --     [ Html.h1
            --         [ Attrs.class "text-5xl font-extrabold mt-2"
            --         ]
            --         [ Html.text "Thank You!"
            --         , Html.small
            --             [ Attrs.class "ms-2 font-semibold text-gray-500 dark:text-gray-400"
            --             ]
            --             [ Html.text " We'll get back to you soon!" ]
            --         ]
            --     ]
            }
        )
        |> Form.field "forename"
            (Field.text
                |> Field.required "Required"
                |> Field.withInitialValue .forename
            )
        |> Form.field "surname"
            (Field.text
                |> Field.required "Required"
                |> Field.withInitialValue .surname
            )
        |> Form.field "email"
            (Field.text
                |> Field.required "Required"
                |> Field.withInitialValue .email
             --|> Form.withServerValidation
             --    (\username ->
             --        if username == "asdf" then
             --            BackendTask.succeed [ "username is taken" ]
             --
             --        else
             --            BackendTask.succeed []
             --    )
            )
        |> Form.field "phoneNumber"
            (Field.text
                |> Field.telephone
                |> Field.required "Required"
                |> Field.withInitialValue .phoneNumber
            )
        |> Form.field "message"
            (Field.text
                |> Field.textarea
                    { rows = Just 5
                    , cols = Just 20
                    }
                |> Field.required "Required"
            )


view :
    App Data ActionData RouteParams
    -> Shared.Model
    -> View.View (PagesMsg.PagesMsg Msg)
view app shared =
    { title = "Capybara House - Support"
    , body =
        [ Html.div [ Attrs.class "mx-auto prose max-w-none pb-8 pt-8 dark:prose-invert xl:col-span-2 xl:max-w-5xl xl:px-0" ]
            [ Layout.Minimal.view app.data.minimal
            , form (Just shared.i18n)
                |> Pages.Form.renderHtml
                    [ Attrs.class "max-w-sm mx-auto"
                    ]
                    (Form.options "support-form"
                        |> Form.withInput emptyForm
                        |> Form.withAction "/support"
                        |> Form.withServerResponse (app.action |> Maybe.map .formResponse)
                    )
                    app
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
                        [ Html.text <| Translations.formsError shared.i18n ]
                    , Html.span
                        [ Attrs.class "font-medium"
                        ]
                        [ Html.br [] []
                        , Html.text <| Translations.formsErrorContact shared.i18n ++ " "
                        , Html.a
                            [ Attrs.href "mailto:info@capybara.house"
                            , Attrs.class "hover:underline "
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
    case request |> Request.formData (form Nothing |> Form.Handler.init identity) of
        Nothing ->
            "Expected form submission."
                |> FatalError.fromString
                |> BackendTask.fail

        Just ( formResponse, userResult ) ->
            BackendTask.map2 EnvVariables
                (Env.expect "SUPABASE_KEY" |> BackendTask.allowFatal)
                (Env.get "SUPABASE_URL"
                    |> BackendTask.map (Maybe.withDefault "http://localhost:1234")
                )
                |> BackendTask.andThen (sendRequest formResponse userResult)


contactToJSON : Contact -> Encode.Value
contactToJSON contact =
    Encode.object
        [ ( "forename", Encode.string contact.forename )
        , ( "surname", Encode.string contact.surname )
        , ( "email", Encode.string contact.email )
        , ( "phone", Encode.string contact.phoneNumber )
        , ( "message", Encode.string contact.message )
        ]


sendRequest : Form.ServerResponse String -> Form.Validated String Contact -> EnvVariables -> BackendTask.BackendTask FatalError.FatalError (Server.Response.Response ActionData ErrorPage.ErrorPage)
sendRequest formResponse userResult envVariables =
    let
        requestBody =
            contactToJSON
                (userResult
                    |> Form.toResult
                    |> Result.withDefault emptyForm
                )
                |> jsonBody
    in
    BackendTask.Http.request
        { method = "POST"
        , headers =
            [ ( "Content-Type", "application/json" )
            , ( "Prefer", "return=minimal" )
            , ( "apikey", envVariables.supabaseKey )
            , ( "Authorization", "Bearer " ++ envVariables.supabaseKey )
            ]
        , url = envVariables.siteUrl ++ "/rest/v1/support_form"
        , body = requestBody
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
            (\{ recoverable } ->
                case recoverable of
                    _ ->
                        BackendTask.succeed
                            (ActionData
                                emptyForm
                                { formResponse | serverSideErrors = Dict.singleton "ERROR" [ "ERROR" ] }
                            )
            )
        |> BackendTask.map
            (\response ->
                let
                    contact =
                        userResult
                            |> Form.toResult
                            |> Result.withDefault emptyForm
                in
                if Dict.isEmpty response.formResponse.serverSideErrors then
                    Route.Support__Support_
                        { support = contact.forename }
                        |> Route.redirectTo

                else
                    Server.Response.render response
            )
