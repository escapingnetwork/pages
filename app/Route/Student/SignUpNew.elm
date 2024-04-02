module Route.Student.SignUpNew exposing (..)

{-|

@docs Model, Msg, RouteParams, route, Data, ActionData

-}

import BackendTask
import Content.Minimal
import Date exposing (Date)
import Effect
import ErrorPage exposing (ErrorPage)
import FatalError exposing (FatalError)
import Form
import Form.Field as Field
import Form.FieldView
import Form.Handler
import Form.Validation as Validation
import Head
import Html exposing (Html)
import Html.Attributes as Attrs exposing (height)
import Layout.Minimal
import Pages.Form
import Pages.FormData
import PagesMsg exposing (PagesMsg)
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
    {}


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
    { student : Student
    , formResponse : Form.ServerResponse String
    }


data : RouteParams -> Request -> BackendTask.BackendTask FatalError (Server.Response.Response Data ErrorPage)
data routeParams request =
    mdText |> BackendTask.map Server.Response.render


mdText : BackendTask.BackendTask FatalError Data
mdText =
    Content.Minimal.accommodation
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


type alias Student =
    { forename : String
    , surname : String
    , email : String
    , phoneNumber : String
    , nationality : String
    , age : Maybe Int
    , sex : Maybe Sex
    , institution : String
    , service : Maybe Service
    , from : Date
    , to : Date
    , message : String
    }


emptyForm : Student
emptyForm =
    { forename = ""
    , surname = ""
    , email = ""
    , phoneNumber = ""
    , nationality = ""
    , age = Nothing
    , sex = Nothing
    , institution = ""
    , service = Nothing
    , from = Date.fromCalendarDate 1969 Time.Jul 20
    , to = Date.fromCalendarDate 1969 Time.Jul 20
    , message = ""
    }


form : Form.HtmlForm String Student Student (PagesMsg Msg)
form =
    Form.form
        (\forename surname email phoneNumber nationality age sex institution service from to message ->
            { combine =
                Validation.succeed Student
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
                    in
                    [ Html.input [ Attrs.type_ "hidden", Attrs.attribute "name" "form-name", Attrs.attribute "value" "student-form" ] []
                    , fieldView "Forename" forename
                    , fieldView "Surname" surname
                    , fieldView "Email" email
                    , fieldView "Phone Number" phoneNumber
                    , fieldView "Nationality" nationality
                    , fieldView "Age" age
                    , fieldViewSexSelect "Sex" sex
                    , fieldView "Institution" institution
                    , fieldViewServiceSelect "Service" service
                    , fieldView "From" from
                    , fieldView "To" to
                    , fieldView "Message" message
                    , Html.button
                        [ Attrs.class "text-white bg-primary-500 hover:bg-primary-600 focus:ring-4 focus:outline-none focus:ring-primary-300 font-medium rounded-lg text-md w-full sm:w-auto px-5 py-2.5 text-center dark:bg-primary-600 dark:hover:bg-primary-700 dark:focus:ring-primary-800"
                        , Attrs.type_ "submit"
                        ]
                        [ Html.text
                            (if formState.submitting then
                                "Updating..."

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
        |> Form.field "nationality"
            (Field.text
                |> Field.required "Required"
                |> Field.withInitialValue .nationality
            )
        |> Form.field "age"
            (Field.int
                { invalid =
                    \_ -> "Must be an integer"
                }
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
                |> Field.required "Required"
            )


view :
    App Data ActionData RouteParams
    -> Shared.Model
    -> View.View (PagesMsg.PagesMsg Msg)
view app shared =
    { title = "Capybara House - Request Accommodation"
    , body =
        [ Html.div [ Attrs.class "mx-auto prose max-w-none pb-8 pt-8 dark:prose-invert xl:col-span-2 xl:max-w-5xl xl:px-0" ]
            [ Layout.Minimal.view app.data.minimal
            , form
                |> Pages.Form.renderHtml
                    [ Attrs.class "max-w-sm mx-auto"
                    , Attrs.attribute "name" "student-form"
                    ]
                    (Form.options "student-form"
                        |> Form.withInput emptyForm
                        |> Form.withServerResponse (app.action |> Maybe.map .formResponse)
                    )
                    app
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
            "Expected form submission." |> FatalError.fromString |> BackendTask.fail

        Just ( formResponse, userResult ) ->
            ActionData
                (userResult
                    |> Form.toResult
                    -- TODO nicer error handling
                    -- TODO wire up BackendTask server-side validation errors
                    |> Result.withDefault emptyForm
                )
                formResponse
                |> Server.Response.render
                |> BackendTask.succeed
