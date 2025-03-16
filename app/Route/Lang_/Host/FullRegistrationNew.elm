module Route.Lang_.Host.FullRegistrationNew exposing
    ( Model, Msg, RouteParams, route, Data, ActionData
    , ContactMethod, Host, Service
    )

{-|

@docs Model, Msg, RouteParams, route, Data, ActionData

-}

import BackendTask
import Content.Minimal
import Dict
import FatalError exposing (FatalError)
import Form
import Form.Field as Field
import Form.FieldView
import Form.Validation as Validation
import Head
import Html exposing (Html)
import Html.Attributes as Attrs
import I18n
import Layout.Minimal
import Pages.Form
import PagesMsg exposing (PagesMsg)
import RouteBuilder exposing (App, StatelessRoute)
import Shared
import View


type alias Model =
    {}


type alias Msg =
    ()


type alias RouteParams =
    { lang : String }


route : StatelessRoute RouteParams Data ActionData
route =
    RouteBuilder.preRender
        { head = head
        , data = data
        , pages = pages
        }
        |> RouteBuilder.buildNoState { view = view }


pages : BackendTask.BackendTask FatalError (List RouteParams)
pages =
    BackendTask.succeed <| List.map (\lang -> I18n.languageToString lang |> RouteParams) I18n.languages


type alias Data =
    { minimal : Content.Minimal.Minimal
    }


type alias ActionData =
    { host : Host
    , formResponse : Form.ServerResponse String
    }


data : RouteParams -> BackendTask.BackendTask FatalError Data
data r =
    Content.Minimal.hosts r.lang
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
        [ Html.div [ Attrs.class "mx-auto prose max-w-none pb-8 pt-8 dark:prose-invert xl:col-span-2 xl:max-w-5xl xl:px-0" ] <|
            List.append (Layout.Minimal.viewEmbeded app.data.minimal)
                [ form
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
                                , Attrs.class "hover:text-primary-600 "
                                ]
                                [ Html.text "info@capybara.house" ]
                            ]
                        ]
                ]
        ]
    }
