module Route.Host.FullRegistrationNew exposing (Model, Msg, RouteParams, route, Data, ActionData)

{-|

@docs Model, Msg, RouteParams, route, Data, ActionData

-}

import BackendTask
import BackendTask.Env as Env
import BackendTask.Http exposing (emptyBody, jsonBody)
import Content.Minimal
import Dict
import Effect
import ErrorPage
import FatalError exposing (FatalError)
import Form
import Form.Field as Field
import Form.FieldView
import Form.Handler
import Form.Validation as Validation
import Head
import Html exposing (Html, address)
import Html.Attributes as Attrs exposing (height)
import Html.Attributes.Autocomplete exposing (DetailedCompletion(..))
import Json.Encode as Encode
import Json.Encode.Extra as EncodeExtra
import LanguageTag.Region exposing (ci)
import Layout.Minimal
import Pages.Form
import PagesMsg exposing (PagesMsg)
import Route
import RouteBuilder exposing (App, StatelessRoute)
import Server.Request as Request exposing (Request)
import Server.Response
import Shared
import UrlPath
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
    RouteBuilder.single
        { head = head
        , data = data
        }
        |> RouteBuilder.buildNoState { view = view }


type alias Data =
    { minimal : Content.Minimal.Minimal
    }


type alias ActionData =
    { host : Host
    , formResponse : Form.ServerResponse String
    }


data : BackendTask.BackendTask FatalError Data
data =
    Content.Minimal.hosts ""
        |> BackendTask.allowFatal
        |> BackendTask.map Data


head : RouteBuilder.App Data ActionData RouteParams -> List Head.Tag
head app =
    []


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
    , address1 : String
    , address2 : String
    , city : String
    , country : String
    , eircode : String
    , facilities : String
    , singleRooms : Maybe Int
    , twinRooms : Maybe Int
    }


emptyForm : Host
emptyForm =
    { forename = ""
    , surname = ""
    , email = ""
    , phoneNumber = ""
    , service = Nothing
    , contactMethod = Nothing
    , address1 = ""
    , address2 = ""
    , city = ""
    , country = ""
    , eircode = ""
    , facilities = ""
    , singleRooms = Nothing
    , twinRooms = Nothing
    }


form : Form.HtmlForm String Host Host (PagesMsg Msg)
form =
    Form.form
        (\forename surname email phoneNumber service contactMethod address1 address2 country city eircode facilities singleRooms twinRooms ->
            { combine =
                Validation.succeed Host
                    |> Validation.andMap forename
                    |> Validation.andMap surname
                    |> Validation.andMap email
                    |> Validation.andMap phoneNumber
                    |> Validation.andMap service
                    |> Validation.andMap contactMethod
                    |> Validation.andMap address1
                    |> Validation.andMap address2
                    |> Validation.andMap country
                    |> Validation.andMap city
                    |> Validation.andMap eircode
                    |> Validation.andMap facilities
                    |> Validation.andMap singleRooms
                    |> Validation.andMap twinRooms
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

                        fieldViewContactMethodSelect : String -> Validation.Field String parsed (Form.FieldView.Options ContactMethod) -> Html msg
                        fieldViewContactMethodSelect label field =
                            Html.div [ Attrs.class "mb-5" ]
                                [ Html.label [ Attrs.class "block mb-2 text-lg font-semibold text-gray-900 dark:text-white" ]
                                    [ Html.text (label ++ " ")
                                    , field
                                        |> Form.FieldView.select [ Attrs.class "bg-gray-50 mt-2 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-primary-500 focus:border-primary-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500" ]
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
                                        |> Form.FieldView.select [ Attrs.class "bg-gray-50 mt-2 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-primary-500 focus:border-primary-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500" ]
                                            (\entry -> ( [], serviceToString entry ))
                                    ]
                                , errorsView field
                                ]
                    in
                    [ fieldView "Forename" forename
                    , fieldView "Surname" surname
                    , fieldView "Email" email
                    , fieldView "Phone Number" phoneNumber
                    , fieldViewServiceSelect "Service" service
                    , fieldViewContactMethodSelect "Favorite Contact Method" contactMethod
                    , fieldView "Address 1" address1
                    , fieldView "Address 2" address2
                    , fieldView "Country" country
                    , fieldView "City" city
                    , fieldView "EIRCode" eircode
                    , fieldView "Facilities" facilities
                    , fieldView "Single Rooms" singleRooms
                    , fieldView "Twin Rooms" twinRooms
                    , Html.button [ Attrs.class "text-white bg-primary-500 hover:bg-primary-600 focus:ring-4 focus:outline-none focus:ring-primary-300 font-medium rounded-lg text-md w-full sm:w-auto px-5 py-2.5 text-center dark:bg-primary-600 dark:hover:bg-primary-700 dark:focus:ring-primary-800" ]
                        [ Html.text
                            (if formState.submitting then
                                "Sending..."

                             else
                                "Submit"
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
        |> Form.field "address1"
            (Field.text
                |> Field.required "Required"
                |> Field.withInitialValue .address1
            )
        |> Form.field "address2"
            (Field.text
                |> Field.required "Required"
                |> Field.withInitialValue .address2
            )
        |> Form.field "country"
            (Field.text
                |> Field.required "Required"
                |> Field.withInitialValue .country
            )
        |> Form.field "city"
            (Field.text
                |> Field.required "Required"
                |> Field.withInitialValue .city
            )
        |> Form.field "eircode"
            (Field.text
                |> Field.required "Required"
                |> Field.withInitialValue .eircode
            )
        |> Form.field "facilities"
            (Field.text
                |> Field.required "Required"
                |> Field.withInitialValue .facilities
            )
        |> Form.field "singleRooms"
            (Field.int
                { invalid =
                    \_ -> "Must be an integer"
                }
            )
        |> Form.field "twinRooms"
            (Field.int
                { invalid =
                    \_ -> "Must be an integer"
                }
            )


view :
    App Data ActionData RouteParams
    -> Shared.Model
    -> View.View (PagesMsg.PagesMsg Msg)
view app shared =
    { title = "Capybara House - Become A Host"
    , body =
        [ Html.div [ Attrs.class "mx-auto prose max-w-none pb-8 pt-8 dark:prose-invert xl:col-span-2 xl:max-w-5xl xl:px-0" ]
            [ Layout.Minimal.view app.data.minimal
            , form
                |> Pages.Form.renderHtml
                    [ Attrs.class "max-w-sm mx-auto"
                    ]
                    (Form.options "full-host-form"
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
                        [ Html.text "There was an error sending your request!" ]
                    , Html.span
                        [ Attrs.class "font-medium"
                        ]
                        [ Html.br [] []
                        , Html.text "Please contact "
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
    case request |> Request.formData (form |> Form.Handler.init identity) of
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


hostRequestToJSON : Host -> Encode.Value
hostRequestToJSON hostRequest =
    Encode.object
        [ ( "forename", Encode.string hostRequest.forename )
        , ( "surname", Encode.string hostRequest.surname )
        , ( "email", Encode.string hostRequest.email )
        , ( "phone", Encode.string hostRequest.phoneNumber )
        , ( "service", Encode.string (maybeServiceToString hostRequest.service) )
        , ( "method", Encode.string (maybeContactMethodToString hostRequest.contactMethod) )
        , ( "address1", Encode.string hostRequest.address1 )
        , ( "address2", Encode.string hostRequest.address2 )
        , ( "emacityil", Encode.string hostRequest.city )
        , ( "country", Encode.string hostRequest.country )
        , ( "eircode", Encode.string hostRequest.eircode )
        , ( "facilities", Encode.string hostRequest.facilities )
        , ( "singleRooms", EncodeExtra.maybe Encode.int hostRequest.singleRooms )
        , ( "twinRooms", EncodeExtra.maybe Encode.int hostRequest.twinRooms )
        ]


sendRequest : Form.ServerResponse String -> Form.Validated String Host -> EnvVariables -> BackendTask.BackendTask FatalError.FatalError (Server.Response.Response ActionData ErrorPage.ErrorPage)
sendRequest formResponse userResult envVariables =
    let
        requestBody =
            hostRequestToJSON
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
