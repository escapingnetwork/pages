module Route.Support exposing
    ( Model, Msg, RouteParams, route, Data, ActionData
    , Contact, EnvVariables
    )

{-|

@docs Model, Msg, RouteParams, route, Data, ActionData

-}

import BackendTask
import BackendTask.Custom
import BackendTask.Env as Env
import BackendTask.Http exposing (jsonBody)
import Captcha exposing (Captcha)
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
import Json.Encode as Encode
import Layout
import Layout.Minimal
import Pages.Form
import PagesMsg exposing (PagesMsg)
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
    {}


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
    { captcha : Captcha
    , minimal : Content.Minimal.Minimal
    }


type alias ActionData =
    { contact : Contact
    , formResponse : Form.ServerResponse String
    }


data : RouteParams -> Request -> BackendTask.BackendTask FatalError (Server.Response.Response Data ErrorPage)
data routeParams request =
    Content.Minimal.support ""
        |> BackendTask.allowFatal
        |> BackendTask.map2 Data
            (BackendTask.Custom.run "captcha"
                Encode.null
                Captcha.decoder
                |> BackendTask.allowFatal
            )
        |> BackendTask.map Server.Response.render


head : RouteBuilder.App Data ActionData RouteParams -> List Head.Tag
head _ =
    let
        translations =
            Translations.init { lang = Translations.En, path = "https://capybara.house" ++ "/i18n" }
    in
    Layout.seoHeaders
        (Translations.seoSupportTitle translations)
        (Translations.seoSupportDescription translations)
        translations


type alias Contact =
    { forename : String
    , surname : String
    , email : String
    , phoneNumber : String
    , message : String
    , language : String
    , captcha : String
    , hiddenCaptcha : String
    }


emptyForm : Contact
emptyForm =
    { forename = ""
    , surname = ""
    , email = ""
    , phoneNumber = ""
    , message = ""
    , language = ""
    , captcha = ""
    , hiddenCaptcha = ""
    }


form : Maybe I18n -> Captcha -> Form.HtmlForm String Contact Contact (PagesMsg Msg)
form translation captchaData =
    let
        t =
            Maybe.withDefault (Translations.init { lang = Translations.En, path = "https://capybara.house" ++ "/i18n" }) translation
    in
    Form.form
        (\forename surname email phoneNumber message language captcha hiddenCaptcha ->
            { combine =
                Validation.succeed Contact
                    |> Validation.andMap forename
                    |> Validation.andMap surname
                    |> Validation.andMap email
                    |> Validation.andMap phoneNumber
                    |> Validation.andMap message
                    |> Validation.andMap language
                    |> Validation.andMap
                        (Validation.map2
                            (\captchaValue hCaptchaValue ->
                                if captchaValue == hCaptchaValue then
                                    Validation.succeed captchaValue

                                else
                                    Validation.fail (Translations.formsErrorCaptcha t) captcha
                            )
                            captcha
                            hiddenCaptcha
                            |> Validation.andThen identity
                        )
                    |> Validation.andMap hiddenCaptcha
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

                        fieldViewCaptcha : String -> Captcha -> Validation.Field String parsed Form.FieldView.Input -> Html msg
                        fieldViewCaptcha label captchaSvg field =
                            Html.div [ Attrs.class "mb-5" ]
                                [ Html.label [ Attrs.class "block mb-2 text-lg font-semibold text-gray-900 dark:text-white" ]
                                    [ Html.text (label ++ " ")
                                    , captchaSvg |> Captcha.toSvg
                                    , field |> Form.FieldView.input [ Attrs.class "bg-gray-50 mt-2 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-primary-500 focus:border-primary-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500" ]
                                    ]
                                , errorsView field
                                ]
                    in
                    [ fieldView (Translations.formsForename t) forename
                    , fieldView (Translations.formsSurname t) surname
                    , fieldView (Translations.formsEmail t) email
                    , fieldView (Translations.formsPhone t) phoneNumber
                    , fieldView (Translations.formsMessage t) message
                    , fieldViewCaptcha "Captcha" captchaData captcha
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
        |> Form.field "forename"
            (Field.text
                |> Field.required (Translations.formsErrorRequired t)
                |> Field.withInitialValue .forename
            )
        |> Form.field "surname"
            (Field.text
                |> Field.required (Translations.formsErrorRequired t)
                |> Field.withInitialValue .surname
            )
        |> Form.field "email"
            (Field.text
                |> Field.required (Translations.formsErrorRequired t)
                |> Field.withInitialValue .email
            )
        |> Form.field "phoneNumber"
            (Field.text
                |> Field.telephone
                |> Field.required (Translations.formsErrorRequired t)
                |> Field.withInitialValue .phoneNumber
            )
        |> Form.field "message"
            (Field.text
                |> Field.textarea
                    { rows = Just 5
                    , cols = Just 20
                    }
                |> Field.required (Translations.formsErrorRequired t)
            )
        |> Form.hiddenField "language"
            (Field.text
                |> Field.required (Translations.formsErrorRequired t)
                |> Field.withInitialValue .language
            )
        |> Form.field "captcha"
            (Field.text
                |> Field.required (Translations.formsErrorRequired t)
                |> Field.withInitialValue .captcha
            )
        |> Form.hiddenField "hiddenCaptcha"
            (Field.text
                |> Field.required (Translations.formsErrorRequired t)
                |> Field.withInitialValue .hiddenCaptcha
            )


view :
    App Data ActionData RouteParams
    -> Shared.Model
    -> View.View (PagesMsg.PagesMsg Msg)
view app shared =
    { title = "Capybara House - Support"
    , body =
        [ Html.div [ Attrs.class "mx-auto prose max-w-none pb-8 pt-8 dark:prose-invert xl:col-span-2 xl:max-w-5xl xl:px-0" ] <|
            List.append (Layout.Minimal.viewEmbeded app.data.minimal)
                [ form (Just shared.i18n) app.data.captcha
                    |> Pages.Form.renderHtml
                        [ Attrs.class "max-w-sm mx-auto"
                        ]
                        (Form.options "support-form"
                            |> Form.withInput { emptyForm | language = "en", hiddenCaptcha = app.data.captcha.text }
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
    case request |> Request.formData (form Nothing Captcha.default |> Form.Handler.init identity) of
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


contactToJSON : Contact -> Encode.Value
contactToJSON contact =
    Encode.object
        [ ( "forename", Encode.string contact.forename )
        , ( "surname", Encode.string contact.surname )
        , ( "email", Encode.string contact.email )
        , ( "phone", Encode.string contact.phoneNumber )
        , ( "message", Encode.string contact.message )
        , ( "language", Encode.string contact.language )
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
                        contact =
                            userResult
                                |> Form.toResult
                                |> Result.withDefault emptyForm
                    in
                    Route.Support__Support_
                        { support = contact.forename }
                        |> Route.redirectTo

                else
                    Server.Response.render response
            )
