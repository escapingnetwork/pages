module Route.Lang_.Host.SignUp exposing
    ( Model, Msg, RouteParams, route, Data, ActionData
    , ContactMethod, Host, Service
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
import I18n as Translations
import I18nUtils
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
    { captcha : Captcha
    , translation : Translations.I18n
    , minimal : Content.Minimal.Minimal
    }


type alias ActionData =
    { host : Host
    , formResponse : Form.ServerResponse String
    }


data : RouteParams -> Request -> BackendTask.BackendTask FatalError (Server.Response.Response Data ErrorPage)
data routeParams request =
    Content.Minimal.hosts routeParams.lang
        |> BackendTask.allowFatal
        |> BackendTask.map3 Data
            (BackendTask.Custom.run "captcha"
                Encode.null
                Captcha.decoder
                |> BackendTask.allowFatal
            )
            (I18nUtils.loadLanguage routeParams.lang)
        |> BackendTask.map Server.Response.render


head : RouteBuilder.App Data ActionData RouteParams -> List Head.Tag
head app =
    Layout.seoHeaders
        (Translations.seoHostTitle app.data.translation)
        (Translations.seoHomeDescription app.data.translation)
        app.data.translation


type ContactMethod
    = Email
    | Phone
    | WhatsApp


contactMethodToString : ContactMethod -> String
contactMethodToString contactMethod =
    case contactMethod of
        Email ->
            "Email"

        Phone ->
            "Phone"

        WhatsApp ->
            "WhatsApp"


maybeContactMethodToString : Maybe ContactMethod -> String
maybeContactMethodToString contactMethod =
    case contactMethod of
        Just Email ->
            "Email"

        Just Phone ->
            "Phone"

        Just WhatsApp ->
            "WhatsApp"

        _ ->
            ""


type Service
    = HalfBoard
    | SelfCatering
    | Hostel


serviceToString : Service -> String
serviceToString service =
    case service of
        HalfBoard ->
            "Half-Board"

        SelfCatering ->
            "Self-Catering"

        Hostel ->
            "Hostel"


maybeServiceToString : Maybe Service -> String
maybeServiceToString service =
    case service of
        Just HalfBoard ->
            "Half-Board"

        Just SelfCatering ->
            "Self-Catering"

        Just Hostel ->
            "Hostel"

        _ ->
            ""


type alias Host =
    { forename : String
    , surname : String
    , email : String
    , phoneNumber : String
    , service : Maybe Service
    , contactMethod : Maybe ContactMethod
    , captcha : String
    , hiddenCaptcha : String
    }


emptyForm : Host
emptyForm =
    { forename = ""
    , surname = ""
    , email = ""
    , phoneNumber = ""
    , service = Nothing
    , contactMethod = Nothing
    , captcha = ""
    , hiddenCaptcha = ""
    }


form : Translations.I18n -> Captcha -> Form.HtmlForm String Host Host (PagesMsg Msg)
form t captchaData =
    Form.form
        (\forename surname email phoneNumber service contactMethod captcha hiddenCaptcha ->
            { combine =
                Validation.succeed Host
                    |> Validation.andMap forename
                    |> Validation.andMap surname
                    |> Validation.andMap email
                    |> Validation.andMap phoneNumber
                    |> Validation.andMap service
                    |> Validation.andMap contactMethod
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
                                    , field
                                        |> Form.FieldView.input
                                            [ Attrs.class "bg-gray-50 mt-2 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-primary-500 focus:border-priring-primary-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-priring-primary-500"
                                            , Attrs.attribute "type" label
                                            ]
                                    ]
                                , errorsView field
                                ]

                        fieldViewContactMethodSelect : String -> Validation.Field String parsed (Form.FieldView.Options ContactMethod) -> Html msg
                        fieldViewContactMethodSelect label field =
                            Html.div [ Attrs.class "mb-5" ]
                                [ Html.label [ Attrs.class "block mb-2 text-lg font-semibold text-gray-900 dark:text-white" ]
                                    [ Html.text (label ++ " ")
                                    , field
                                        |> Form.FieldView.select [ Attrs.class "bg-gray-50 mt-2 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-primary-500 focus:border-priring-primary-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-priring-primary-500" ]
                                            (\entry -> ( [], contactMethodToString entry ))
                                    ]
                                , errorsView field
                                ]

                        fieldViewServiceSelect : String -> Validation.Field String parsed (Form.FieldView.Options Service) -> Html msg
                        fieldViewServiceSelect label field =
                            Html.div [ Attrs.class "mb-5" ]
                                [ Html.label [ Attrs.class "block mb-2 text-lg font-semibold text-gray-900 dark:text-white" ]
                                    [ Html.text (label ++ " ")
                                    , field
                                        |> Form.FieldView.select [ Attrs.class "bg-gray-50 mt-2 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-primary-500 focus:border-priring-primary-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-priring-primary-500" ]
                                            (\entry -> ( [], serviceToString entry ))
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
                    [ Html.input [ Attrs.type_ "hidden", Attrs.attribute "name" "form-name", Attrs.attribute "value" "host-form" ] []
                    , fieldView (Translations.formsForename t) forename
                    , fieldView (Translations.formsSurname t) surname
                    , fieldView (Translations.formsEmail t) email
                    , fieldView (Translations.formsPhone t) phoneNumber
                    , fieldViewServiceSelect (Translations.formsService t) service
                    , fieldViewContactMethodSelect (Translations.formsContact t) contactMethod
                    , fieldViewCaptcha "Captcha" captchaData captcha
                    , Html.button
                        [ Attrs.class "text-white bg-primary-500 hover:bg-primary-600 focus:ring-4 focus:outline-none focus:ring-primary-300 font-medium rounded-lg text-md w-full sm:w-auto px-5 py-2.5 text-center dark:bg-primary-600 dark:hover:bg-primary-700 dark:focus:ring-primary-800"
                        , Attrs.attribute "type" "submit"
                        ]
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
                |> Field.required (Translations.formsErrorRequired t)
                |> Field.withInitialValue .phoneNumber
            )
        |> Form.field "service"
            (Field.select
                [ ( "Self-Catering", SelfCatering )
                , ( "Half-Board", HalfBoard )
                , ( "Hostel", Hostel )
                ]
                (\_ -> "Invalid")
            )
        |> Form.field "contactMethod"
            (Field.select
                [ ( "Email", Email )
                , ( "Phone", Phone )
                , ( "WhatsApp", WhatsApp )
                ]
                (\_ -> "Invalid")
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
    { title = "Capybara House - Become A Host"
    , body =
        [ Html.div [ Attrs.class "mx-auto prose max-w-none pb-8 pt-8 dark:prose-invert xl:col-span-2 xl:max-w-5xl xl:px-0" ] <|
            List.append (Layout.Minimal.viewEmbeded app.data.minimal)
                [ form app.data.translation app.data.captcha
                    |> Pages.Form.renderHtml
                        [ Attrs.class "max-w-sm mx-auto"
                        ]
                        (Form.options "host-form"
                            |> Form.withInput { emptyForm | hiddenCaptcha = app.data.captcha.text }
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
                            [ Html.text "There was an error sending your request!" ]
                        , Html.span
                            [ Attrs.class "font-medium"
                            ]
                            [ Html.br [] []
                            , Html.text "Please contact "
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
    case request |> Request.formData (form (Translations.init { lang = Maybe.withDefault Translations.En (Translations.languageFromString routeParams.lang), path = "https://capybara.house" ++ "/i18n" }) Captcha.default |> Form.Handler.init identity) of
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
                        |> BackendTask.andThen (sendRequest routeParams.lang formResponse parsedForm)

                Form.Invalid _ _ ->
                    BackendTask.succeed
                        (Server.Response.render
                            (ActionData
                                emptyForm
                                formResponse
                            )
                        )


hostRequestToJSON : Host -> Encode.Value
hostRequestToJSON hostRequest =
    Encode.object
        [ ( "forename", Encode.string hostRequest.forename )
        , ( "surname", Encode.string hostRequest.surname )
        , ( "email", Encode.string hostRequest.email )
        , ( "phone", Encode.string hostRequest.phoneNumber )
        , ( "service", Encode.string (maybeServiceToString hostRequest.service) )
        , ( "method", Encode.string (maybeContactMethodToString hostRequest.contactMethod) )
        ]


sendRequest : String -> Form.ServerResponse String -> Form.Validated String Host -> EnvVariables -> BackendTask.BackendTask FatalError.FatalError (Server.Response.Response ActionData ErrorPage.ErrorPage)
sendRequest lang formResponse userResult envVariables =
    let
        host =
            userResult
                |> Form.toResult
                |> Result.withDefault emptyForm

        requestBody =
            hostRequestToJSON
                host
                |> jsonBody
    in
    (BackendTask.Http.request
        { method = "POST"
        , headers =
            [ ( "Content-Type", "application/json" )
            , ( "Prefer", "return=minimal" )
            , ( "apikey", envVariables.supabaseKey )
            , ( "Authorization", "Bearer " ++ envVariables.supabaseKey )
            ]
        , url = envVariables.siteUrl ++ "/rest/v1/host_form"
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
    )
        |> BackendTask.map
            (\response ->
                if Dict.isEmpty response.formResponse.serverSideErrors then
                    Route.Lang___Host__SignUp_
                        { lang = lang, signUp = host.forename }
                        |> Route.redirectTo

                else
                    Server.Response.render response
            )
