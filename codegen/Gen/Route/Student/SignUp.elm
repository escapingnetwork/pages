module Gen.Route.Student.SignUp exposing (accommodationRequestToJSON, action, annotation_, call_, caseOf_, data, emptyForm, form, head, make_, maybeServiceToMaybeString, maybeSexToMaybeString, mdText, moduleName_, route, sendRequest, serviceToString, sexToString, values_, view)

{-| 
@docs moduleName_, sendRequest, accommodationRequestToJSON, action, view, form, emptyForm, maybeServiceToMaybeString, serviceToString, maybeSexToMaybeString, sexToString, head, mdText, data, route, annotation_, make_, caseOf_, call_, values_
-}


import Elm
import Elm.Annotation as Type
import Elm.Case


{-| The name of this module. -}
moduleName_ : List String
moduleName_ =
    [ "Route", "Student", "SignUp" ]


{-| sendRequest: 
    Form.ServerResponse String
    -> Form.Validated String Route.Student.SignUp.Accommodation
    -> Route.Student.SignUp.EnvVariables
    -> BackendTask.BackendTask FatalError.FatalError (Server.Response.Response Route.Student.SignUp.ActionData ErrorPage.ErrorPage)
-}
sendRequest :
    Elm.Expression -> Elm.Expression -> Elm.Expression -> Elm.Expression
sendRequest sendRequestArg sendRequestArg0 sendRequestArg1 =
    Elm.apply
        (Elm.value
            { importFrom = [ "Route", "Student", "SignUp" ]
            , name = "sendRequest"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith
                            [ "Form" ]
                            "ServerResponse"
                            [ Type.string ]
                        , Type.namedWith
                            [ "Form" ]
                            "Validated"
                            [ Type.string
                            , Type.namedWith
                                [ "Route", "Student", "SignUp" ]
                                "Accommodation"
                                []
                            ]
                        , Type.namedWith
                            [ "Route", "Student", "SignUp" ]
                            "EnvVariables"
                            []
                        ]
                        (Type.namedWith
                            [ "BackendTask" ]
                            "BackendTask"
                            [ Type.namedWith [ "FatalError" ] "FatalError" []
                            , Type.namedWith
                                [ "Server", "Response" ]
                                "Response"
                                [ Type.namedWith
                                    [ "Route", "Student", "SignUp" ]
                                    "ActionData"
                                    []
                                , Type.namedWith [ "ErrorPage" ] "ErrorPage" []
                                ]
                            ]
                        )
                    )
            }
        )
        [ sendRequestArg, sendRequestArg0, sendRequestArg1 ]


{-| accommodationRequestToJSON: Route.Student.SignUp.Accommodation -> Json.Encode.Value -}
accommodationRequestToJSON : Elm.Expression -> Elm.Expression
accommodationRequestToJSON accommodationRequestToJSONArg =
    Elm.apply
        (Elm.value
            { importFrom = [ "Route", "Student", "SignUp" ]
            , name = "accommodationRequestToJSON"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith
                            [ "Route", "Student", "SignUp" ]
                            "Accommodation"
                            []
                        ]
                        (Type.namedWith [ "Json", "Encode" ] "Value" [])
                    )
            }
        )
        [ accommodationRequestToJSONArg ]


{-| action: 
    Route.Student.SignUp.RouteParams
    -> Server.Request.Request
    -> BackendTask.BackendTask FatalError.FatalError (Server.Response.Response Route.Student.SignUp.ActionData ErrorPage.ErrorPage)
-}
action : Elm.Expression -> Elm.Expression -> Elm.Expression
action actionArg actionArg0 =
    Elm.apply
        (Elm.value
            { importFrom = [ "Route", "Student", "SignUp" ]
            , name = "action"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith
                            [ "Route", "Student", "SignUp" ]
                            "RouteParams"
                            []
                        , Type.namedWith [ "Server", "Request" ] "Request" []
                        ]
                        (Type.namedWith
                            [ "BackendTask" ]
                            "BackendTask"
                            [ Type.namedWith [ "FatalError" ] "FatalError" []
                            , Type.namedWith
                                [ "Server", "Response" ]
                                "Response"
                                [ Type.namedWith
                                    [ "Route", "Student", "SignUp" ]
                                    "ActionData"
                                    []
                                , Type.namedWith [ "ErrorPage" ] "ErrorPage" []
                                ]
                            ]
                        )
                    )
            }
        )
        [ actionArg, actionArg0 ]


{-| view: 
    RouteBuilder.App Route.Student.SignUp.Data Route.Student.SignUp.ActionData Route.Student.SignUp.RouteParams
    -> Shared.Model
    -> View.View (PagesMsg.PagesMsg Route.Student.SignUp.Msg)
-}
view : Elm.Expression -> Elm.Expression -> Elm.Expression
view viewArg viewArg0 =
    Elm.apply
        (Elm.value
            { importFrom = [ "Route", "Student", "SignUp" ]
            , name = "view"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith
                            [ "RouteBuilder" ]
                            "App"
                            [ Type.namedWith
                                [ "Route", "Student", "SignUp" ]
                                "Data"
                                []
                            , Type.namedWith
                                [ "Route", "Student", "SignUp" ]
                                "ActionData"
                                []
                            , Type.namedWith
                                [ "Route", "Student", "SignUp" ]
                                "RouteParams"
                                []
                            ]
                        , Type.namedWith [ "Shared" ] "Model" []
                        ]
                        (Type.namedWith
                            [ "View" ]
                            "View"
                            [ Type.namedWith
                                [ "PagesMsg" ]
                                "PagesMsg"
                                [ Type.namedWith
                                    [ "Route", "Student", "SignUp" ]
                                    "Msg"
                                    []
                                ]
                            ]
                        )
                    )
            }
        )
        [ viewArg, viewArg0 ]


{-| form: Form.HtmlForm String Route.Student.SignUp.Accommodation Route.Student.SignUp.Accommodation (PagesMsg.PagesMsg Route.Student.SignUp.Msg) -}
form : Elm.Expression
form =
    Elm.value
        { importFrom = [ "Route", "Student", "SignUp" ]
        , name = "form"
        , annotation =
            Just
                (Type.namedWith
                    [ "Form" ]
                    "HtmlForm"
                    [ Type.string
                    , Type.namedWith
                        [ "Route", "Student", "SignUp" ]
                        "Accommodation"
                        []
                    , Type.namedWith
                        [ "Route", "Student", "SignUp" ]
                        "Accommodation"
                        []
                    , Type.namedWith
                        [ "PagesMsg" ]
                        "PagesMsg"
                        [ Type.namedWith
                            [ "Route", "Student", "SignUp" ]
                            "Msg"
                            []
                        ]
                    ]
                )
        }


{-| emptyForm: Route.Student.SignUp.Accommodation -}
emptyForm : Elm.Expression
emptyForm =
    Elm.value
        { importFrom = [ "Route", "Student", "SignUp" ]
        , name = "emptyForm"
        , annotation =
            Just
                (Type.namedWith
                    [ "Route", "Student", "SignUp" ]
                    "Accommodation"
                    []
                )
        }


{-| maybeServiceToMaybeString: Maybe Route.Student.SignUp.Service -> Maybe String -}
maybeServiceToMaybeString : Elm.Expression -> Elm.Expression
maybeServiceToMaybeString maybeServiceToMaybeStringArg =
    Elm.apply
        (Elm.value
            { importFrom = [ "Route", "Student", "SignUp" ]
            , name = "maybeServiceToMaybeString"
            , annotation =
                Just
                    (Type.function
                        [ Type.maybe
                            (Type.namedWith
                                [ "Route", "Student", "SignUp" ]
                                "Service"
                                []
                            )
                        ]
                        (Type.maybe Type.string)
                    )
            }
        )
        [ maybeServiceToMaybeStringArg ]


{-| serviceToString: Route.Student.SignUp.Service -> String -}
serviceToString : Elm.Expression -> Elm.Expression
serviceToString serviceToStringArg =
    Elm.apply
        (Elm.value
            { importFrom = [ "Route", "Student", "SignUp" ]
            , name = "serviceToString"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith
                            [ "Route", "Student", "SignUp" ]
                            "Service"
                            []
                        ]
                        Type.string
                    )
            }
        )
        [ serviceToStringArg ]


{-| maybeSexToMaybeString: Maybe Route.Student.SignUp.Sex -> Maybe String -}
maybeSexToMaybeString : Elm.Expression -> Elm.Expression
maybeSexToMaybeString maybeSexToMaybeStringArg =
    Elm.apply
        (Elm.value
            { importFrom = [ "Route", "Student", "SignUp" ]
            , name = "maybeSexToMaybeString"
            , annotation =
                Just
                    (Type.function
                        [ Type.maybe
                            (Type.namedWith
                                [ "Route", "Student", "SignUp" ]
                                "Sex"
                                []
                            )
                        ]
                        (Type.maybe Type.string)
                    )
            }
        )
        [ maybeSexToMaybeStringArg ]


{-| sexToString: Route.Student.SignUp.Sex -> String -}
sexToString : Elm.Expression -> Elm.Expression
sexToString sexToStringArg =
    Elm.apply
        (Elm.value
            { importFrom = [ "Route", "Student", "SignUp" ]
            , name = "sexToString"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith
                            [ "Route", "Student", "SignUp" ]
                            "Sex"
                            []
                        ]
                        Type.string
                    )
            }
        )
        [ sexToStringArg ]


{-| head: 
    RouteBuilder.App Route.Student.SignUp.Data Route.Student.SignUp.ActionData Route.Student.SignUp.RouteParams
    -> List Head.Tag
-}
head : Elm.Expression -> Elm.Expression
head headArg =
    Elm.apply
        (Elm.value
            { importFrom = [ "Route", "Student", "SignUp" ]
            , name = "head"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith
                            [ "RouteBuilder" ]
                            "App"
                            [ Type.namedWith
                                [ "Route", "Student", "SignUp" ]
                                "Data"
                                []
                            , Type.namedWith
                                [ "Route", "Student", "SignUp" ]
                                "ActionData"
                                []
                            , Type.namedWith
                                [ "Route", "Student", "SignUp" ]
                                "RouteParams"
                                []
                            ]
                        ]
                        (Type.list (Type.namedWith [ "Head" ] "Tag" []))
                    )
            }
        )
        [ headArg ]


{-| mdText: BackendTask.BackendTask FatalError.FatalError Route.Student.SignUp.Data -}
mdText : Elm.Expression
mdText =
    Elm.value
        { importFrom = [ "Route", "Student", "SignUp" ]
        , name = "mdText"
        , annotation =
            Just
                (Type.namedWith
                    [ "BackendTask" ]
                    "BackendTask"
                    [ Type.namedWith [ "FatalError" ] "FatalError" []
                    , Type.namedWith [ "Route", "Student", "SignUp" ] "Data" []
                    ]
                )
        }


{-| data: 
    Route.Student.SignUp.RouteParams
    -> Server.Request.Request
    -> BackendTask.BackendTask FatalError.FatalError (Server.Response.Response Route.Student.SignUp.Data ErrorPage.ErrorPage)
-}
data : Elm.Expression -> Elm.Expression -> Elm.Expression
data dataArg dataArg0 =
    Elm.apply
        (Elm.value
            { importFrom = [ "Route", "Student", "SignUp" ]
            , name = "data"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith
                            [ "Route", "Student", "SignUp" ]
                            "RouteParams"
                            []
                        , Type.namedWith [ "Server", "Request" ] "Request" []
                        ]
                        (Type.namedWith
                            [ "BackendTask" ]
                            "BackendTask"
                            [ Type.namedWith [ "FatalError" ] "FatalError" []
                            , Type.namedWith
                                [ "Server", "Response" ]
                                "Response"
                                [ Type.namedWith
                                    [ "Route", "Student", "SignUp" ]
                                    "Data"
                                    []
                                , Type.namedWith [ "ErrorPage" ] "ErrorPage" []
                                ]
                            ]
                        )
                    )
            }
        )
        [ dataArg, dataArg0 ]


{-| route: RouteBuilder.StatelessRoute Route.Student.SignUp.RouteParams Route.Student.SignUp.Data Route.Student.SignUp.ActionData -}
route : Elm.Expression
route =
    Elm.value
        { importFrom = [ "Route", "Student", "SignUp" ]
        , name = "route"
        , annotation =
            Just
                (Type.namedWith
                    [ "RouteBuilder" ]
                    "StatelessRoute"
                    [ Type.namedWith
                        [ "Route", "Student", "SignUp" ]
                        "RouteParams"
                        []
                    , Type.namedWith [ "Route", "Student", "SignUp" ] "Data" []
                    , Type.namedWith
                        [ "Route", "Student", "SignUp" ]
                        "ActionData"
                        []
                    ]
                )
        }


annotation_ :
    { accommodation : Type.Annotation
    , actionData : Type.Annotation
    , data : Type.Annotation
    , envVariables : Type.Annotation
    , routeParams : Type.Annotation
    , msg : Type.Annotation
    , model : Type.Annotation
    , service : Type.Annotation
    , sex : Type.Annotation
    }
annotation_ =
    { accommodation =
        Type.alias
            moduleName_
            "Accommodation"
            []
            (Type.record
                [ ( "forename", Type.string )
                , ( "surname", Type.string )
                , ( "email", Type.string )
                , ( "phoneNumber", Type.string )
                , ( "nationality"
                  , Type.maybe (Type.namedWith [ "Countries" ] "Country" [])
                  )
                , ( "age", Type.maybe Type.int )
                , ( "sex"
                  , Type.maybe
                        (Type.namedWith
                            [ "Route", "Student", "SignUp" ]
                            "Sex"
                            []
                        )
                  )
                , ( "institution", Type.string )
                , ( "service"
                  , Type.maybe
                        (Type.namedWith
                            [ "Route", "Student", "SignUp" ]
                            "Service"
                            []
                        )
                  )
                , ( "from", Type.namedWith [ "Date" ] "Date" [] )
                , ( "to", Type.namedWith [ "Date" ] "Date" [] )
                , ( "message", Type.maybe Type.string )
                ]
            )
    , actionData =
        Type.alias
            moduleName_
            "ActionData"
            []
            (Type.record
                [ ( "student"
                  , Type.namedWith
                        [ "Route", "Student", "SignUp" ]
                        "Accommodation"
                        []
                  )
                , ( "formResponse"
                  , Type.namedWith [ "Form" ] "ServerResponse" [ Type.string ]
                  )
                ]
            )
    , data =
        Type.alias
            moduleName_
            "Data"
            []
            (Type.record
                [ ( "minimal"
                  , Type.namedWith [ "Content", "Minimal" ] "Minimal" []
                  )
                ]
            )
    , envVariables =
        Type.alias
            moduleName_
            "EnvVariables"
            []
            (Type.record
                [ ( "supabaseKey", Type.string ), ( "siteUrl", Type.string ) ]
            )
    , routeParams = Type.alias moduleName_ "RouteParams" [] (Type.record [])
    , msg = Type.alias moduleName_ "Msg" [] Type.unit
    , model = Type.alias moduleName_ "Model" [] (Type.record [])
    , service = Type.namedWith [ "Route", "Student", "SignUp" ] "Service" []
    , sex = Type.namedWith [ "Route", "Student", "SignUp" ] "Sex" []
    }


make_ :
    { accommodation :
        { forename : Elm.Expression
        , surname : Elm.Expression
        , email : Elm.Expression
        , phoneNumber : Elm.Expression
        , nationality : Elm.Expression
        , age : Elm.Expression
        , sex : Elm.Expression
        , institution : Elm.Expression
        , service : Elm.Expression
        , from : Elm.Expression
        , to : Elm.Expression
        , message : Elm.Expression
        }
        -> Elm.Expression
    , actionData :
        { student : Elm.Expression, formResponse : Elm.Expression }
        -> Elm.Expression
    , data : { minimal : Elm.Expression } -> Elm.Expression
    , envVariables :
        { supabaseKey : Elm.Expression, siteUrl : Elm.Expression }
        -> Elm.Expression
    , routeParams : routeParams -> Elm.Expression
    , model : model -> Elm.Expression
    , halfBoard : Elm.Expression
    , selfCatering : Elm.Expression
    , hostel : Elm.Expression
    , male : Elm.Expression
    , female : Elm.Expression
    , other : Elm.Expression
    }
make_ =
    { accommodation =
        \accommodation_args ->
            Elm.withType
                (Type.alias
                    [ "Route", "Student", "SignUp" ]
                    "Accommodation"
                    []
                    (Type.record
                        [ ( "forename", Type.string )
                        , ( "surname", Type.string )
                        , ( "email", Type.string )
                        , ( "phoneNumber", Type.string )
                        , ( "nationality"
                          , Type.maybe
                                (Type.namedWith [ "Countries" ] "Country" [])
                          )
                        , ( "age", Type.maybe Type.int )
                        , ( "sex"
                          , Type.maybe
                                (Type.namedWith
                                    [ "Route", "Student", "SignUp" ]
                                    "Sex"
                                    []
                                )
                          )
                        , ( "institution", Type.string )
                        , ( "service"
                          , Type.maybe
                                (Type.namedWith
                                    [ "Route", "Student", "SignUp" ]
                                    "Service"
                                    []
                                )
                          )
                        , ( "from", Type.namedWith [ "Date" ] "Date" [] )
                        , ( "to", Type.namedWith [ "Date" ] "Date" [] )
                        , ( "message", Type.maybe Type.string )
                        ]
                    )
                )
                (Elm.record
                    [ Tuple.pair "forename" accommodation_args.forename
                    , Tuple.pair "surname" accommodation_args.surname
                    , Tuple.pair "email" accommodation_args.email
                    , Tuple.pair "phoneNumber" accommodation_args.phoneNumber
                    , Tuple.pair "nationality" accommodation_args.nationality
                    , Tuple.pair "age" accommodation_args.age
                    , Tuple.pair "sex" accommodation_args.sex
                    , Tuple.pair "institution" accommodation_args.institution
                    , Tuple.pair "service" accommodation_args.service
                    , Tuple.pair "from" accommodation_args.from
                    , Tuple.pair "to" accommodation_args.to
                    , Tuple.pair "message" accommodation_args.message
                    ]
                )
    , actionData =
        \actionData_args ->
            Elm.withType
                (Type.alias
                    [ "Route", "Student", "SignUp" ]
                    "ActionData"
                    []
                    (Type.record
                        [ ( "student"
                          , Type.namedWith
                                [ "Route", "Student", "SignUp" ]
                                "Accommodation"
                                []
                          )
                        , ( "formResponse"
                          , Type.namedWith
                                [ "Form" ]
                                "ServerResponse"
                                [ Type.string ]
                          )
                        ]
                    )
                )
                (Elm.record
                    [ Tuple.pair "student" actionData_args.student
                    , Tuple.pair "formResponse" actionData_args.formResponse
                    ]
                )
    , data =
        \data_args ->
            Elm.withType
                (Type.alias
                    [ "Route", "Student", "SignUp" ]
                    "Data"
                    []
                    (Type.record
                        [ ( "minimal"
                          , Type.namedWith [ "Content", "Minimal" ] "Minimal" []
                          )
                        ]
                    )
                )
                (Elm.record [ Tuple.pair "minimal" data_args.minimal ])
    , envVariables =
        \envVariables_args ->
            Elm.withType
                (Type.alias
                    [ "Route", "Student", "SignUp" ]
                    "EnvVariables"
                    []
                    (Type.record
                        [ ( "supabaseKey", Type.string )
                        , ( "siteUrl", Type.string )
                        ]
                    )
                )
                (Elm.record
                    [ Tuple.pair "supabaseKey" envVariables_args.supabaseKey
                    , Tuple.pair "siteUrl" envVariables_args.siteUrl
                    ]
                )
    , routeParams =
        \routeParams_args ->
            Elm.withType
                (Type.alias
                    [ "Route", "Student", "SignUp" ]
                    "RouteParams"
                    []
                    (Type.record [])
                )
                (Elm.record [])
    , model =
        \model_args ->
            Elm.withType
                (Type.alias
                    [ "Route", "Student", "SignUp" ]
                    "Model"
                    []
                    (Type.record [])
                )
                (Elm.record [])
    , halfBoard =
        Elm.value
            { importFrom = [ "Route", "Student", "SignUp" ]
            , name = "HalfBoard"
            , annotation = Just (Type.namedWith [] "Service" [])
            }
    , selfCatering =
        Elm.value
            { importFrom = [ "Route", "Student", "SignUp" ]
            , name = "SelfCatering"
            , annotation = Just (Type.namedWith [] "Service" [])
            }
    , hostel =
        Elm.value
            { importFrom = [ "Route", "Student", "SignUp" ]
            , name = "Hostel"
            , annotation = Just (Type.namedWith [] "Service" [])
            }
    , male =
        Elm.value
            { importFrom = [ "Route", "Student", "SignUp" ]
            , name = "Male"
            , annotation = Just (Type.namedWith [] "Sex" [])
            }
    , female =
        Elm.value
            { importFrom = [ "Route", "Student", "SignUp" ]
            , name = "Female"
            , annotation = Just (Type.namedWith [] "Sex" [])
            }
    , other =
        Elm.value
            { importFrom = [ "Route", "Student", "SignUp" ]
            , name = "Other"
            , annotation = Just (Type.namedWith [] "Sex" [])
            }
    }


caseOf_ :
    { service :
        Elm.Expression
        -> { serviceTags_0_0
            | halfBoard : Elm.Expression
            , selfCatering : Elm.Expression
            , hostel : Elm.Expression
        }
        -> Elm.Expression
    , sex :
        Elm.Expression
        -> { sexTags_1_0
            | male : Elm.Expression
            , female : Elm.Expression
            , other : Elm.Expression
        }
        -> Elm.Expression
    }
caseOf_ =
    { service =
        \serviceExpression serviceTags ->
            Elm.Case.custom
                serviceExpression
                (Type.namedWith [ "Route", "Student", "SignUp" ] "Service" [])
                [ Elm.Case.branch0 "HalfBoard" serviceTags.halfBoard
                , Elm.Case.branch0 "SelfCatering" serviceTags.selfCatering
                , Elm.Case.branch0 "Hostel" serviceTags.hostel
                ]
    , sex =
        \sexExpression sexTags ->
            Elm.Case.custom
                sexExpression
                (Type.namedWith [ "Route", "Student", "SignUp" ] "Sex" [])
                [ Elm.Case.branch0 "Male" sexTags.male
                , Elm.Case.branch0 "Female" sexTags.female
                , Elm.Case.branch0 "Other" sexTags.other
                ]
    }


call_ :
    { sendRequest :
        Elm.Expression -> Elm.Expression -> Elm.Expression -> Elm.Expression
    , accommodationRequestToJSON : Elm.Expression -> Elm.Expression
    , action : Elm.Expression -> Elm.Expression -> Elm.Expression
    , view : Elm.Expression -> Elm.Expression -> Elm.Expression
    , maybeServiceToMaybeString : Elm.Expression -> Elm.Expression
    , serviceToString : Elm.Expression -> Elm.Expression
    , maybeSexToMaybeString : Elm.Expression -> Elm.Expression
    , sexToString : Elm.Expression -> Elm.Expression
    , head : Elm.Expression -> Elm.Expression
    , data : Elm.Expression -> Elm.Expression -> Elm.Expression
    }
call_ =
    { sendRequest =
        \sendRequestArg sendRequestArg0 sendRequestArg1 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Route", "Student", "SignUp" ]
                    , name = "sendRequest"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.namedWith
                                    [ "Form" ]
                                    "ServerResponse"
                                    [ Type.string ]
                                , Type.namedWith
                                    [ "Form" ]
                                    "Validated"
                                    [ Type.string
                                    , Type.namedWith
                                        [ "Route", "Student", "SignUp" ]
                                        "Accommodation"
                                        []
                                    ]
                                , Type.namedWith
                                    [ "Route", "Student", "SignUp" ]
                                    "EnvVariables"
                                    []
                                ]
                                (Type.namedWith
                                    [ "BackendTask" ]
                                    "BackendTask"
                                    [ Type.namedWith
                                        [ "FatalError" ]
                                        "FatalError"
                                        []
                                    , Type.namedWith
                                        [ "Server", "Response" ]
                                        "Response"
                                        [ Type.namedWith
                                            [ "Route", "Student", "SignUp" ]
                                            "ActionData"
                                            []
                                        , Type.namedWith
                                            [ "ErrorPage" ]
                                            "ErrorPage"
                                            []
                                        ]
                                    ]
                                )
                            )
                    }
                )
                [ sendRequestArg, sendRequestArg0, sendRequestArg1 ]
    , accommodationRequestToJSON =
        \accommodationRequestToJSONArg ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Route", "Student", "SignUp" ]
                    , name = "accommodationRequestToJSON"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.namedWith
                                    [ "Route", "Student", "SignUp" ]
                                    "Accommodation"
                                    []
                                ]
                                (Type.namedWith [ "Json", "Encode" ] "Value" [])
                            )
                    }
                )
                [ accommodationRequestToJSONArg ]
    , action =
        \actionArg actionArg0 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Route", "Student", "SignUp" ]
                    , name = "action"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.namedWith
                                    [ "Route", "Student", "SignUp" ]
                                    "RouteParams"
                                    []
                                , Type.namedWith
                                    [ "Server", "Request" ]
                                    "Request"
                                    []
                                ]
                                (Type.namedWith
                                    [ "BackendTask" ]
                                    "BackendTask"
                                    [ Type.namedWith
                                        [ "FatalError" ]
                                        "FatalError"
                                        []
                                    , Type.namedWith
                                        [ "Server", "Response" ]
                                        "Response"
                                        [ Type.namedWith
                                            [ "Route", "Student", "SignUp" ]
                                            "ActionData"
                                            []
                                        , Type.namedWith
                                            [ "ErrorPage" ]
                                            "ErrorPage"
                                            []
                                        ]
                                    ]
                                )
                            )
                    }
                )
                [ actionArg, actionArg0 ]
    , view =
        \viewArg viewArg0 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Route", "Student", "SignUp" ]
                    , name = "view"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.namedWith
                                    [ "RouteBuilder" ]
                                    "App"
                                    [ Type.namedWith
                                        [ "Route", "Student", "SignUp" ]
                                        "Data"
                                        []
                                    , Type.namedWith
                                        [ "Route", "Student", "SignUp" ]
                                        "ActionData"
                                        []
                                    , Type.namedWith
                                        [ "Route", "Student", "SignUp" ]
                                        "RouteParams"
                                        []
                                    ]
                                , Type.namedWith [ "Shared" ] "Model" []
                                ]
                                (Type.namedWith
                                    [ "View" ]
                                    "View"
                                    [ Type.namedWith
                                        [ "PagesMsg" ]
                                        "PagesMsg"
                                        [ Type.namedWith
                                            [ "Route", "Student", "SignUp" ]
                                            "Msg"
                                            []
                                        ]
                                    ]
                                )
                            )
                    }
                )
                [ viewArg, viewArg0 ]
    , maybeServiceToMaybeString =
        \maybeServiceToMaybeStringArg ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Route", "Student", "SignUp" ]
                    , name = "maybeServiceToMaybeString"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.maybe
                                    (Type.namedWith
                                        [ "Route", "Student", "SignUp" ]
                                        "Service"
                                        []
                                    )
                                ]
                                (Type.maybe Type.string)
                            )
                    }
                )
                [ maybeServiceToMaybeStringArg ]
    , serviceToString =
        \serviceToStringArg ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Route", "Student", "SignUp" ]
                    , name = "serviceToString"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.namedWith
                                    [ "Route", "Student", "SignUp" ]
                                    "Service"
                                    []
                                ]
                                Type.string
                            )
                    }
                )
                [ serviceToStringArg ]
    , maybeSexToMaybeString =
        \maybeSexToMaybeStringArg ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Route", "Student", "SignUp" ]
                    , name = "maybeSexToMaybeString"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.maybe
                                    (Type.namedWith
                                        [ "Route", "Student", "SignUp" ]
                                        "Sex"
                                        []
                                    )
                                ]
                                (Type.maybe Type.string)
                            )
                    }
                )
                [ maybeSexToMaybeStringArg ]
    , sexToString =
        \sexToStringArg ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Route", "Student", "SignUp" ]
                    , name = "sexToString"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.namedWith
                                    [ "Route", "Student", "SignUp" ]
                                    "Sex"
                                    []
                                ]
                                Type.string
                            )
                    }
                )
                [ sexToStringArg ]
    , head =
        \headArg ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Route", "Student", "SignUp" ]
                    , name = "head"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.namedWith
                                    [ "RouteBuilder" ]
                                    "App"
                                    [ Type.namedWith
                                        [ "Route", "Student", "SignUp" ]
                                        "Data"
                                        []
                                    , Type.namedWith
                                        [ "Route", "Student", "SignUp" ]
                                        "ActionData"
                                        []
                                    , Type.namedWith
                                        [ "Route", "Student", "SignUp" ]
                                        "RouteParams"
                                        []
                                    ]
                                ]
                                (Type.list (Type.namedWith [ "Head" ] "Tag" []))
                            )
                    }
                )
                [ headArg ]
    , data =
        \dataArg dataArg0 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Route", "Student", "SignUp" ]
                    , name = "data"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.namedWith
                                    [ "Route", "Student", "SignUp" ]
                                    "RouteParams"
                                    []
                                , Type.namedWith
                                    [ "Server", "Request" ]
                                    "Request"
                                    []
                                ]
                                (Type.namedWith
                                    [ "BackendTask" ]
                                    "BackendTask"
                                    [ Type.namedWith
                                        [ "FatalError" ]
                                        "FatalError"
                                        []
                                    , Type.namedWith
                                        [ "Server", "Response" ]
                                        "Response"
                                        [ Type.namedWith
                                            [ "Route", "Student", "SignUp" ]
                                            "Data"
                                            []
                                        , Type.namedWith
                                            [ "ErrorPage" ]
                                            "ErrorPage"
                                            []
                                        ]
                                    ]
                                )
                            )
                    }
                )
                [ dataArg, dataArg0 ]
    }


values_ :
    { sendRequest : Elm.Expression
    , accommodationRequestToJSON : Elm.Expression
    , action : Elm.Expression
    , view : Elm.Expression
    , form : Elm.Expression
    , emptyForm : Elm.Expression
    , maybeServiceToMaybeString : Elm.Expression
    , serviceToString : Elm.Expression
    , maybeSexToMaybeString : Elm.Expression
    , sexToString : Elm.Expression
    , head : Elm.Expression
    , mdText : Elm.Expression
    , data : Elm.Expression
    , route : Elm.Expression
    }
values_ =
    { sendRequest =
        Elm.value
            { importFrom = [ "Route", "Student", "SignUp" ]
            , name = "sendRequest"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith
                            [ "Form" ]
                            "ServerResponse"
                            [ Type.string ]
                        , Type.namedWith
                            [ "Form" ]
                            "Validated"
                            [ Type.string
                            , Type.namedWith
                                [ "Route", "Student", "SignUp" ]
                                "Accommodation"
                                []
                            ]
                        , Type.namedWith
                            [ "Route", "Student", "SignUp" ]
                            "EnvVariables"
                            []
                        ]
                        (Type.namedWith
                            [ "BackendTask" ]
                            "BackendTask"
                            [ Type.namedWith [ "FatalError" ] "FatalError" []
                            , Type.namedWith
                                [ "Server", "Response" ]
                                "Response"
                                [ Type.namedWith
                                    [ "Route", "Student", "SignUp" ]
                                    "ActionData"
                                    []
                                , Type.namedWith [ "ErrorPage" ] "ErrorPage" []
                                ]
                            ]
                        )
                    )
            }
    , accommodationRequestToJSON =
        Elm.value
            { importFrom = [ "Route", "Student", "SignUp" ]
            , name = "accommodationRequestToJSON"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith
                            [ "Route", "Student", "SignUp" ]
                            "Accommodation"
                            []
                        ]
                        (Type.namedWith [ "Json", "Encode" ] "Value" [])
                    )
            }
    , action =
        Elm.value
            { importFrom = [ "Route", "Student", "SignUp" ]
            , name = "action"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith
                            [ "Route", "Student", "SignUp" ]
                            "RouteParams"
                            []
                        , Type.namedWith [ "Server", "Request" ] "Request" []
                        ]
                        (Type.namedWith
                            [ "BackendTask" ]
                            "BackendTask"
                            [ Type.namedWith [ "FatalError" ] "FatalError" []
                            , Type.namedWith
                                [ "Server", "Response" ]
                                "Response"
                                [ Type.namedWith
                                    [ "Route", "Student", "SignUp" ]
                                    "ActionData"
                                    []
                                , Type.namedWith [ "ErrorPage" ] "ErrorPage" []
                                ]
                            ]
                        )
                    )
            }
    , view =
        Elm.value
            { importFrom = [ "Route", "Student", "SignUp" ]
            , name = "view"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith
                            [ "RouteBuilder" ]
                            "App"
                            [ Type.namedWith
                                [ "Route", "Student", "SignUp" ]
                                "Data"
                                []
                            , Type.namedWith
                                [ "Route", "Student", "SignUp" ]
                                "ActionData"
                                []
                            , Type.namedWith
                                [ "Route", "Student", "SignUp" ]
                                "RouteParams"
                                []
                            ]
                        , Type.namedWith [ "Shared" ] "Model" []
                        ]
                        (Type.namedWith
                            [ "View" ]
                            "View"
                            [ Type.namedWith
                                [ "PagesMsg" ]
                                "PagesMsg"
                                [ Type.namedWith
                                    [ "Route", "Student", "SignUp" ]
                                    "Msg"
                                    []
                                ]
                            ]
                        )
                    )
            }
    , form =
        Elm.value
            { importFrom = [ "Route", "Student", "SignUp" ]
            , name = "form"
            , annotation =
                Just
                    (Type.namedWith
                        [ "Form" ]
                        "HtmlForm"
                        [ Type.string
                        , Type.namedWith
                            [ "Route", "Student", "SignUp" ]
                            "Accommodation"
                            []
                        , Type.namedWith
                            [ "Route", "Student", "SignUp" ]
                            "Accommodation"
                            []
                        , Type.namedWith
                            [ "PagesMsg" ]
                            "PagesMsg"
                            [ Type.namedWith
                                [ "Route", "Student", "SignUp" ]
                                "Msg"
                                []
                            ]
                        ]
                    )
            }
    , emptyForm =
        Elm.value
            { importFrom = [ "Route", "Student", "SignUp" ]
            , name = "emptyForm"
            , annotation =
                Just
                    (Type.namedWith
                        [ "Route", "Student", "SignUp" ]
                        "Accommodation"
                        []
                    )
            }
    , maybeServiceToMaybeString =
        Elm.value
            { importFrom = [ "Route", "Student", "SignUp" ]
            , name = "maybeServiceToMaybeString"
            , annotation =
                Just
                    (Type.function
                        [ Type.maybe
                            (Type.namedWith
                                [ "Route", "Student", "SignUp" ]
                                "Service"
                                []
                            )
                        ]
                        (Type.maybe Type.string)
                    )
            }
    , serviceToString =
        Elm.value
            { importFrom = [ "Route", "Student", "SignUp" ]
            , name = "serviceToString"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith
                            [ "Route", "Student", "SignUp" ]
                            "Service"
                            []
                        ]
                        Type.string
                    )
            }
    , maybeSexToMaybeString =
        Elm.value
            { importFrom = [ "Route", "Student", "SignUp" ]
            , name = "maybeSexToMaybeString"
            , annotation =
                Just
                    (Type.function
                        [ Type.maybe
                            (Type.namedWith
                                [ "Route", "Student", "SignUp" ]
                                "Sex"
                                []
                            )
                        ]
                        (Type.maybe Type.string)
                    )
            }
    , sexToString =
        Elm.value
            { importFrom = [ "Route", "Student", "SignUp" ]
            , name = "sexToString"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith
                            [ "Route", "Student", "SignUp" ]
                            "Sex"
                            []
                        ]
                        Type.string
                    )
            }
    , head =
        Elm.value
            { importFrom = [ "Route", "Student", "SignUp" ]
            , name = "head"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith
                            [ "RouteBuilder" ]
                            "App"
                            [ Type.namedWith
                                [ "Route", "Student", "SignUp" ]
                                "Data"
                                []
                            , Type.namedWith
                                [ "Route", "Student", "SignUp" ]
                                "ActionData"
                                []
                            , Type.namedWith
                                [ "Route", "Student", "SignUp" ]
                                "RouteParams"
                                []
                            ]
                        ]
                        (Type.list (Type.namedWith [ "Head" ] "Tag" []))
                    )
            }
    , mdText =
        Elm.value
            { importFrom = [ "Route", "Student", "SignUp" ]
            , name = "mdText"
            , annotation =
                Just
                    (Type.namedWith
                        [ "BackendTask" ]
                        "BackendTask"
                        [ Type.namedWith [ "FatalError" ] "FatalError" []
                        , Type.namedWith
                            [ "Route", "Student", "SignUp" ]
                            "Data"
                            []
                        ]
                    )
            }
    , data =
        Elm.value
            { importFrom = [ "Route", "Student", "SignUp" ]
            , name = "data"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith
                            [ "Route", "Student", "SignUp" ]
                            "RouteParams"
                            []
                        , Type.namedWith [ "Server", "Request" ] "Request" []
                        ]
                        (Type.namedWith
                            [ "BackendTask" ]
                            "BackendTask"
                            [ Type.namedWith [ "FatalError" ] "FatalError" []
                            , Type.namedWith
                                [ "Server", "Response" ]
                                "Response"
                                [ Type.namedWith
                                    [ "Route", "Student", "SignUp" ]
                                    "Data"
                                    []
                                , Type.namedWith [ "ErrorPage" ] "ErrorPage" []
                                ]
                            ]
                        )
                    )
            }
    , route =
        Elm.value
            { importFrom = [ "Route", "Student", "SignUp" ]
            , name = "route"
            , annotation =
                Just
                    (Type.namedWith
                        [ "RouteBuilder" ]
                        "StatelessRoute"
                        [ Type.namedWith
                            [ "Route", "Student", "SignUp" ]
                            "RouteParams"
                            []
                        , Type.namedWith
                            [ "Route", "Student", "SignUp" ]
                            "Data"
                            []
                        , Type.namedWith
                            [ "Route", "Student", "SignUp" ]
                            "ActionData"
                            []
                        ]
                    )
            }
    }