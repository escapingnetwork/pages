module Route.Host.CompleteRegistrationNew exposing
    ( Model, Msg, RouteParams, route, Data, ActionData
    , Host
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
    {}


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


type alias Host =
    { email : String
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
    { email = ""
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
        (\email address1 address2 country city eircode facilities singleRooms twinRooms ->
            { combine =
                Validation.succeed Host
                    |> Validation.andMap email
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
                    in
                    [ fieldView "Email" email
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
                    (Form.options "complete-host-form"
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
