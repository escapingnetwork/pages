module Route.Lang_.Student.SignUp exposing (..)

{-|

@docs Model, Msg, RouteParams, route, Data, ActionData

-}

import BackendTask
import BackendTask.Env as Env
import BackendTask.Http exposing (emptyBody, jsonBody)
import Content.Minimal
import Countries
import Date exposing (Date)
import Dict
import Effect
import ErrorPage exposing (ErrorPage)
import FatalError exposing (FatalError)
import Form exposing (ServerResponse)
import Form.Field as Field
import Form.FieldView
import Form.Handler
import Form.Validation as Validation
import Head
import Html exposing (Html)
import Html.Attributes as Attrs exposing (height)
import Html.Attributes.Autocomplete exposing (DetailedCompletion(..))
import I18n as Translations
import Json.Encode as Encode
import Json.Encode.Extra as EncodeExtra
import Layout.Minimal
import Pages.Form
import Pages.FormData
import PagesMsg exposing (PagesMsg)
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
    { student : Accommodation
    , formResponse : Form.ServerResponse String
    }


data : RouteParams -> Request -> BackendTask.BackendTask FatalError (Server.Response.Response Data ErrorPage)
data routeParams request =
    mdText routeParams.lang |> BackendTask.map Server.Response.render


mdText : String -> BackendTask.BackendTask FatalError Data
mdText lang =
    Content.Minimal.accommodation lang
        |> BackendTask.allowFatal
        |> BackendTask.map Data


head : RouteBuilder.App Data ActionData RouteParams -> List Head.Tag
head app =
    []


type Sex
    = Male
    | Female
    | Other


sexToString : Sex -> String
sexToString sex =
    case sex of
        Male ->
            "Male"

        Female ->
            "Female"

        Other ->
            "Other"


maybeSexToMaybeString : Maybe Sex -> Maybe String
maybeSexToMaybeString sex =
    case sex of
        Just Male ->
            Just "Male"

        Just Female ->
            Just "Female"

        Just Other ->
            Just "Other"

        _ ->
            Nothing


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


maybeServiceToMaybeString : Maybe Service -> Maybe String
maybeServiceToMaybeString service =
    case service of
        Just HalfBoard ->
            Just "Half-Board"

        Just SelfCatering ->
            Just "Self-Catering"

        Just Hostel ->
            Just "Hostel"

        _ ->
            Nothing


type alias Accommodation =
    { forename : String
    , surname : String
    , email : String
    , phoneNumber : String
    , nationality : Maybe Countries.Country
    , age : Maybe Int
    , sex : Maybe Sex
    , institution : String
    , service : Maybe Service
    , from : Date
    , to : Date
    , message : Maybe String
    }


emptyForm : Accommodation
emptyForm =
    { forename = ""
    , surname = ""
    , email = ""
    , phoneNumber = ""
    , nationality = Nothing
    , age = Nothing
    , sex = Nothing
    , institution = ""
    , service = Nothing
    , from = Date.fromCalendarDate 1969 Time.Jul 20
    , to = Date.fromCalendarDate 1969 Time.Jul 20
    , message = Nothing
    }


form : Translations.I18n -> Form.HtmlForm String Accommodation Accommodation (PagesMsg Msg)
form t =
    Form.form
        (\forename surname email phoneNumber nationality age sex institution service from to message ->
            { combine =
                Validation.succeed Accommodation
                    |> Validation.andMap forename
                    |> Validation.andMap surname
                    |> Validation.andMap email
                    |> Validation.andMap phoneNumber
                    |> Validation.andMap nationality
                    |> Validation.andMap age
                    |> Validation.andMap sex
                    |> Validation.andMap institution
                    |> Validation.andMap service
                    |> Validation.andMap from
                    |> Validation.andMap to
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

                        fieldViewSexSelect : String -> Validation.Field String parsed (Form.FieldView.Options Sex) -> Html msg
                        fieldViewSexSelect label field =
                            Html.div [ Attrs.class "mb-5" ]
                                [ Html.label [ Attrs.class "block mb-2 text-lg font-semibold text-gray-900 dark:text-white" ]
                                    [ Html.text (label ++ " ")
                                    , field
                                        |> Form.FieldView.select [ Attrs.class "bg-gray-50 mt-2 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-primary-500 focus:border-primary-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500" ]
                                            (\entry -> ( [], sexToString entry ))
                                    ]
                                , errorsView field
                                ]

                        fieldViewServiceSelect : String -> Validation.Field String parsed (Form.FieldView.Options Service) -> Html msg
                        fieldViewServiceSelect label field =
                            Html.div [ Attrs.class "mb-5" ]
                                [ Html.label [ Attrs.class "block mb-2 text-lg font-semibold text-gray-900 dark:text-white" ]
                                    [ Html.text (label ++ " ")
                                    , field
                                        |> Form.FieldView.select [ Attrs.class "bg-gray-50 mt-2 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-primary-500 focus:border-primary-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500" ]
                                            (\entry -> ( [], serviceToString entry ))
                                    ]
                                , errorsView field
                                ]

                        fieldViewNationalitySelect : String -> Validation.Field String parsed (Form.FieldView.Options Countries.Country) -> Html msg
                        fieldViewNationalitySelect label field =
                            Html.div [ Attrs.class "mb-5" ]
                                [ Html.label [ Attrs.class "block mb-2 text-lg font-semibold text-gray-900 dark:text-white" ]
                                    [ Html.text (label ++ " ")
                                    , field
                                        |> Form.FieldView.select [ Attrs.class "bg-gray-50 mt-2 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-primary-500 focus:border-primary-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500" ]
                                            (\entry -> ( [], entry.name ))
                                    ]
                                , errorsView field
                                ]
                    in
                    [ Html.input [ Attrs.type_ "hidden", Attrs.attribute "name" "form-name", Attrs.attribute "value" "student-form-netlify" ] []
                    , fieldView (Translations.formsForename t) forename
                    , fieldView (Translations.formsSurname t) surname
                    , fieldView (Translations.formsEmail t) email
                    , fieldView (Translations.formsPhone t) phoneNumber
                    , fieldViewNationalitySelect (Translations.formsCountry t) nationality
                    , fieldView (Translations.formsAge t) age
                    , fieldViewSexSelect (Translations.formsSex t) sex
                    , fieldView (Translations.formsInstitution t) institution
                    , fieldViewServiceSelect (Translations.formsService t) service
                    , fieldView (Translations.formsFrom t) from
                    , fieldView (Translations.formsTo t) to
                    , fieldView (Translations.formsMessage t) message
                    , Html.button
                        [ Attrs.class "text-white bg-primary-500 hover:bg-primary-600 focus:ring-4 focus:outline-none focus:ring-primary-300 font-medium rounded-lg text-md w-full sm:w-auto px-5 py-2.5 text-center dark:bg-primary-600 dark:hover:bg-primary-700 dark:focus:ring-primary-800"
                        , Attrs.type_ "submit"
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
        |> Form.field "nationality"
            (Field.select
                (Countries.all
                    |> List.map
                        (\country -> ( country.name, Countries.Country country.name country.code country.flag ))
                )
                (\_ -> "Invalid")
            )
        |> Form.field "age"
            (Field.int
                { invalid =
                    \_ -> "Must be an integer"
                }
                |> Field.withMin 0 "Must be positive!"
            )
        |> Form.field "sex"
            (Field.select
                [ ( "Male", Male )
                , ( "Female", Female )
                , ( "Other", Other )
                ]
                (\_ -> "Invalid")
            )
        |> Form.field "institution"
            (Field.text
                |> Field.required "Required"
                |> Field.withInitialValue .institution
            )
        |> Form.field "service"
            (Field.select
                [ ( "Self-Catering", SelfCatering )
                , ( "Half-Board", HalfBoard )
                , ( "Hostel", Hostel )
                ]
                (\_ -> "Invalid")
            )
        |> Form.field "from"
            (Field.date
                { invalid = \_ -> "Invalid" }
                |> Field.required "Required"
             -- |> Field.withMin today ("Must be after " ++ Date.toIsoString today)
            )
        |> Form.field "to"
            (Field.date
                { invalid = \_ -> "Invalid" }
                |> Field.required "Required"
            )
        |> Form.field "message"
            (Field.text
                |> Field.textarea
                    { rows = Just 5
                    , cols = Just 20
                    }
            )


view :
    App Data ActionData RouteParams
    -> Shared.Model
    -> View.View (PagesMsg.PagesMsg Msg)
view app shared =
    { title = "Capybara House - Request Accommodation"
    , body =
        [ Html.div [ Attrs.class "mx-auto prose max-w-none pb-8 pt-8 xl:col-span-2 xl:max-w-5xl xl:px-0" ]
            [ Layout.Minimal.view app.data.minimal
            , form shared.i18n
                |> Pages.Form.renderHtml
                    [ Attrs.class "max-w-sm mx-auto"
                    ]
                    (Form.options "student-form-netlify"
                        |> Form.withInput emptyForm
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
    case request |> Request.formData (form (Translations.init { lang = Translations.En, path = "https://capybara.house" ++ "/i18n" }) |> Form.Handler.init identity) of
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


accommodationRequestToJSON : Accommodation -> Encode.Value
accommodationRequestToJSON accommodationRequest =
    Encode.object
        [ ( "forename", Encode.string accommodationRequest.forename )
        , ( "surname", Encode.string accommodationRequest.surname )
        , ( "email", Encode.string accommodationRequest.email )
        , ( "phone", Encode.string accommodationRequest.phoneNumber )
        , ( "country", EncodeExtra.maybe Encode.string (Maybe.map .name accommodationRequest.nationality) )
        , ( "age", EncodeExtra.maybe Encode.int accommodationRequest.age )
        , ( "sex", EncodeExtra.maybe Encode.string (maybeSexToMaybeString accommodationRequest.sex) )
        , ( "institution", Encode.string accommodationRequest.institution )
        , ( "service", EncodeExtra.maybe Encode.string (maybeServiceToMaybeString accommodationRequest.service) )
        , ( "from", Encode.string (Date.toIsoString accommodationRequest.from) )
        , ( "to", Encode.string (Date.toIsoString accommodationRequest.to) )
        , ( "message", EncodeExtra.maybe Encode.string accommodationRequest.message )
        ]


sendRequest : Form.ServerResponse String -> Form.Validated String Accommodation -> EnvVariables -> BackendTask.BackendTask FatalError.FatalError (Server.Response.Response ActionData ErrorPage.ErrorPage)
sendRequest formResponse userResult envVariables =
    let
        student =
            userResult
                |> Form.toResult
                |> Result.withDefault emptyForm

        requestBody =
            accommodationRequestToJSON
                student
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
        , url = envVariables.siteUrl ++ "/rest/v1/accommodation_request_form"
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
                    BackendTask.Http.BadStatus metadata string ->
                        if metadata.statusCode == 401 || metadata.statusCode == 403 || metadata.statusCode == 404 then
                            BackendTask.succeed
                                (ActionData
                                    emptyForm
                                    { formResponse | serverSideErrors = Dict.singleton string [ metadata.statusText ] }
                                )

                        else
                            BackendTask.succeed
                                (ActionData
                                    emptyForm
                                    { formResponse | serverSideErrors = Dict.singleton string [ metadata.statusText ] }
                                )

                    _ ->
                        BackendTask.succeed
                            (ActionData
                                emptyForm
                                { formResponse | serverSideErrors = Dict.singleton "ERROR" [ "OTHER" ] }
                            )
            )
    )
        |> BackendTask.map
            (\response ->
                if Dict.isEmpty response.formResponse.serverSideErrors then
                    Route.Student__SignUp_
                        { signUp = student.forename }
                        |> Route.redirectTo

                else
                    Server.Response.render response
            )
