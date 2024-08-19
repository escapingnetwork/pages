module Gen.Route.Support exposing (action, annotation_, call_, contactToJSON, data, emptyForm, form, head, make_, mdText, moduleName_, route, sendRequest, values_, view)

{-| 
@docs moduleName_, sendRequest, contactToJSON, action, view, form, emptyForm, head, mdText, data, route, annotation_, make_, call_, values_
-}


import Elm
import Elm.Annotation as Type


{-| The name of this module. -}
moduleName_ : List String
moduleName_ =
    [ "Route", "Support" ]


{-| sendRequest: 
    Form.ServerResponse String
    -> Form.Validated String Route.Support.Contact
    -> Route.Support.EnvVariables
    -> BackendTask.BackendTask FatalError.FatalError (Server.Response.Response Route.Support.ActionData ErrorPage.ErrorPage)
-}
sendRequest :
    Elm.Expression -> Elm.Expression -> Elm.Expression -> Elm.Expression
sendRequest sendRequestArg sendRequestArg0 sendRequestArg1 =
    Elm.apply
        (Elm.value
            { importFrom = [ "Route", "Support" ]
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
                            , Type.namedWith [ "Route", "Support" ] "Contact" []
                            ]
                        , Type.namedWith
                            [ "Route", "Support" ]
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
                                    [ "Route", "Support" ]
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


{-| contactToJSON: Route.Support.Contact -> Json.Encode.Value -}
contactToJSON : Elm.Expression -> Elm.Expression
contactToJSON contactToJSONArg =
    Elm.apply
        (Elm.value
            { importFrom = [ "Route", "Support" ]
            , name = "contactToJSON"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith [ "Route", "Support" ] "Contact" [] ]
                        (Type.namedWith [ "Json", "Encode" ] "Value" [])
                    )
            }
        )
        [ contactToJSONArg ]


{-| action: 
    Route.Support.RouteParams
    -> Server.Request.Request
    -> BackendTask.BackendTask FatalError.FatalError (Server.Response.Response Route.Support.ActionData ErrorPage.ErrorPage)
-}
action : Elm.Expression -> Elm.Expression -> Elm.Expression
action actionArg actionArg0 =
    Elm.apply
        (Elm.value
            { importFrom = [ "Route", "Support" ]
            , name = "action"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith [ "Route", "Support" ] "RouteParams" []
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
                                    [ "Route", "Support" ]
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
    RouteBuilder.App Route.Support.Data Route.Support.ActionData Route.Support.RouteParams
    -> Shared.Model
    -> View.View (PagesMsg.PagesMsg Route.Support.Msg)
-}
view : Elm.Expression -> Elm.Expression -> Elm.Expression
view viewArg viewArg0 =
    Elm.apply
        (Elm.value
            { importFrom = [ "Route", "Support" ]
            , name = "view"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith
                            [ "RouteBuilder" ]
                            "App"
                            [ Type.namedWith [ "Route", "Support" ] "Data" []
                            , Type.namedWith
                                [ "Route", "Support" ]
                                "ActionData"
                                []
                            , Type.namedWith
                                [ "Route", "Support" ]
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
                                [ Type.namedWith [ "Route", "Support" ] "Msg" []
                                ]
                            ]
                        )
                    )
            }
        )
        [ viewArg, viewArg0 ]


{-| form: 
    Maybe Route.Support.I18n
    -> Form.HtmlForm String Route.Support.Contact Route.Support.Contact (PagesMsg.PagesMsg Route.Support.Msg)
-}
form : Elm.Expression -> Elm.Expression
form formArg =
    Elm.apply
        (Elm.value
            { importFrom = [ "Route", "Support" ]
            , name = "form"
            , annotation =
                Just
                    (Type.function
                        [ Type.maybe
                            (Type.namedWith [ "Route", "Support" ] "I18n" [])
                        ]
                        (Type.namedWith
                            [ "Form" ]
                            "HtmlForm"
                            [ Type.string
                            , Type.namedWith [ "Route", "Support" ] "Contact" []
                            , Type.namedWith [ "Route", "Support" ] "Contact" []
                            , Type.namedWith
                                [ "PagesMsg" ]
                                "PagesMsg"
                                [ Type.namedWith [ "Route", "Support" ] "Msg" []
                                ]
                            ]
                        )
                    )
            }
        )
        [ formArg ]


{-| emptyForm: Route.Support.Contact -}
emptyForm : Elm.Expression
emptyForm =
    Elm.value
        { importFrom = [ "Route", "Support" ]
        , name = "emptyForm"
        , annotation = Just (Type.namedWith [ "Route", "Support" ] "Contact" [])
        }


{-| head: 
    RouteBuilder.App Route.Support.Data Route.Support.ActionData Route.Support.RouteParams
    -> List Head.Tag
-}
head : Elm.Expression -> Elm.Expression
head headArg =
    Elm.apply
        (Elm.value
            { importFrom = [ "Route", "Support" ]
            , name = "head"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith
                            [ "RouteBuilder" ]
                            "App"
                            [ Type.namedWith [ "Route", "Support" ] "Data" []
                            , Type.namedWith
                                [ "Route", "Support" ]
                                "ActionData"
                                []
                            , Type.namedWith
                                [ "Route", "Support" ]
                                "RouteParams"
                                []
                            ]
                        ]
                        (Type.list (Type.namedWith [ "Head" ] "Tag" []))
                    )
            }
        )
        [ headArg ]


{-| mdText: BackendTask.BackendTask FatalError.FatalError Route.Support.Data -}
mdText : Elm.Expression
mdText =
    Elm.value
        { importFrom = [ "Route", "Support" ]
        , name = "mdText"
        , annotation =
            Just
                (Type.namedWith
                    [ "BackendTask" ]
                    "BackendTask"
                    [ Type.namedWith [ "FatalError" ] "FatalError" []
                    , Type.namedWith [ "Route", "Support" ] "Data" []
                    ]
                )
        }


{-| data: 
    Route.Support.RouteParams
    -> Server.Request.Request
    -> BackendTask.BackendTask FatalError.FatalError (Server.Response.Response Route.Support.Data ErrorPage.ErrorPage)
-}
data : Elm.Expression -> Elm.Expression -> Elm.Expression
data dataArg dataArg0 =
    Elm.apply
        (Elm.value
            { importFrom = [ "Route", "Support" ]
            , name = "data"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith [ "Route", "Support" ] "RouteParams" []
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
                                    [ "Route", "Support" ]
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


{-| route: RouteBuilder.StatelessRoute Route.Support.RouteParams Route.Support.Data Route.Support.ActionData -}
route : Elm.Expression
route =
    Elm.value
        { importFrom = [ "Route", "Support" ]
        , name = "route"
        , annotation =
            Just
                (Type.namedWith
                    [ "RouteBuilder" ]
                    "StatelessRoute"
                    [ Type.namedWith [ "Route", "Support" ] "RouteParams" []
                    , Type.namedWith [ "Route", "Support" ] "Data" []
                    , Type.namedWith [ "Route", "Support" ] "ActionData" []
                    ]
                )
        }


annotation_ :
    { contact : Type.Annotation
    , actionData : Type.Annotation
    , data : Type.Annotation
    , envVariables : Type.Annotation
    , routeParams : Type.Annotation
    , msg : Type.Annotation
    , model : Type.Annotation
    }
annotation_ =
    { contact =
        Type.alias
            moduleName_
            "Contact"
            []
            (Type.record
                [ ( "forename", Type.string )
                , ( "surname", Type.string )
                , ( "email", Type.string )
                , ( "phoneNumber", Type.string )
                , ( "message", Type.string )
                ]
            )
    , actionData =
        Type.alias
            moduleName_
            "ActionData"
            []
            (Type.record
                [ ( "contact"
                  , Type.namedWith [ "Route", "Support" ] "Contact" []
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
    }


make_ :
    { contact :
        { forename : Elm.Expression
        , surname : Elm.Expression
        , email : Elm.Expression
        , phoneNumber : Elm.Expression
        , message : Elm.Expression
        }
        -> Elm.Expression
    , actionData :
        { contact : Elm.Expression, formResponse : Elm.Expression }
        -> Elm.Expression
    , data : { minimal : Elm.Expression } -> Elm.Expression
    , envVariables :
        { supabaseKey : Elm.Expression, siteUrl : Elm.Expression }
        -> Elm.Expression
    , routeParams : routeParams -> Elm.Expression
    , model : model -> Elm.Expression
    }
make_ =
    { contact =
        \contact_args ->
            Elm.withType
                (Type.alias
                    [ "Route", "Support" ]
                    "Contact"
                    []
                    (Type.record
                        [ ( "forename", Type.string )
                        , ( "surname", Type.string )
                        , ( "email", Type.string )
                        , ( "phoneNumber", Type.string )
                        , ( "message", Type.string )
                        ]
                    )
                )
                (Elm.record
                    [ Tuple.pair "forename" contact_args.forename
                    , Tuple.pair "surname" contact_args.surname
                    , Tuple.pair "email" contact_args.email
                    , Tuple.pair "phoneNumber" contact_args.phoneNumber
                    , Tuple.pair "message" contact_args.message
                    ]
                )
    , actionData =
        \actionData_args ->
            Elm.withType
                (Type.alias
                    [ "Route", "Support" ]
                    "ActionData"
                    []
                    (Type.record
                        [ ( "contact"
                          , Type.namedWith [ "Route", "Support" ] "Contact" []
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
                    [ Tuple.pair "contact" actionData_args.contact
                    , Tuple.pair "formResponse" actionData_args.formResponse
                    ]
                )
    , data =
        \data_args ->
            Elm.withType
                (Type.alias
                    [ "Route", "Support" ]
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
                    [ "Route", "Support" ]
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
                    [ "Route", "Support" ]
                    "RouteParams"
                    []
                    (Type.record [])
                )
                (Elm.record [])
    , model =
        \model_args ->
            Elm.withType
                (Type.alias [ "Route", "Support" ] "Model" [] (Type.record []))
                (Elm.record [])
    }


call_ :
    { sendRequest :
        Elm.Expression -> Elm.Expression -> Elm.Expression -> Elm.Expression
    , contactToJSON : Elm.Expression -> Elm.Expression
    , action : Elm.Expression -> Elm.Expression -> Elm.Expression
    , view : Elm.Expression -> Elm.Expression -> Elm.Expression
    , form : Elm.Expression -> Elm.Expression
    , head : Elm.Expression -> Elm.Expression
    , data : Elm.Expression -> Elm.Expression -> Elm.Expression
    }
call_ =
    { sendRequest =
        \sendRequestArg sendRequestArg0 sendRequestArg1 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Route", "Support" ]
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
                                        [ "Route", "Support" ]
                                        "Contact"
                                        []
                                    ]
                                , Type.namedWith
                                    [ "Route", "Support" ]
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
                                            [ "Route", "Support" ]
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
    , contactToJSON =
        \contactToJSONArg ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Route", "Support" ]
                    , name = "contactToJSON"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.namedWith
                                    [ "Route", "Support" ]
                                    "Contact"
                                    []
                                ]
                                (Type.namedWith [ "Json", "Encode" ] "Value" [])
                            )
                    }
                )
                [ contactToJSONArg ]
    , action =
        \actionArg actionArg0 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Route", "Support" ]
                    , name = "action"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.namedWith
                                    [ "Route", "Support" ]
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
                                            [ "Route", "Support" ]
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
                    { importFrom = [ "Route", "Support" ]
                    , name = "view"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.namedWith
                                    [ "RouteBuilder" ]
                                    "App"
                                    [ Type.namedWith
                                        [ "Route", "Support" ]
                                        "Data"
                                        []
                                    , Type.namedWith
                                        [ "Route", "Support" ]
                                        "ActionData"
                                        []
                                    , Type.namedWith
                                        [ "Route", "Support" ]
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
                                            [ "Route", "Support" ]
                                            "Msg"
                                            []
                                        ]
                                    ]
                                )
                            )
                    }
                )
                [ viewArg, viewArg0 ]
    , form =
        \formArg ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Route", "Support" ]
                    , name = "form"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.maybe
                                    (Type.namedWith
                                        [ "Route", "Support" ]
                                        "I18n"
                                        []
                                    )
                                ]
                                (Type.namedWith
                                    [ "Form" ]
                                    "HtmlForm"
                                    [ Type.string
                                    , Type.namedWith
                                        [ "Route", "Support" ]
                                        "Contact"
                                        []
                                    , Type.namedWith
                                        [ "Route", "Support" ]
                                        "Contact"
                                        []
                                    , Type.namedWith
                                        [ "PagesMsg" ]
                                        "PagesMsg"
                                        [ Type.namedWith
                                            [ "Route", "Support" ]
                                            "Msg"
                                            []
                                        ]
                                    ]
                                )
                            )
                    }
                )
                [ formArg ]
    , head =
        \headArg ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Route", "Support" ]
                    , name = "head"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.namedWith
                                    [ "RouteBuilder" ]
                                    "App"
                                    [ Type.namedWith
                                        [ "Route", "Support" ]
                                        "Data"
                                        []
                                    , Type.namedWith
                                        [ "Route", "Support" ]
                                        "ActionData"
                                        []
                                    , Type.namedWith
                                        [ "Route", "Support" ]
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
                    { importFrom = [ "Route", "Support" ]
                    , name = "data"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.namedWith
                                    [ "Route", "Support" ]
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
                                            [ "Route", "Support" ]
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
    , contactToJSON : Elm.Expression
    , action : Elm.Expression
    , view : Elm.Expression
    , form : Elm.Expression
    , emptyForm : Elm.Expression
    , head : Elm.Expression
    , mdText : Elm.Expression
    , data : Elm.Expression
    , route : Elm.Expression
    }
values_ =
    { sendRequest =
        Elm.value
            { importFrom = [ "Route", "Support" ]
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
                            , Type.namedWith [ "Route", "Support" ] "Contact" []
                            ]
                        , Type.namedWith
                            [ "Route", "Support" ]
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
                                    [ "Route", "Support" ]
                                    "ActionData"
                                    []
                                , Type.namedWith [ "ErrorPage" ] "ErrorPage" []
                                ]
                            ]
                        )
                    )
            }
    , contactToJSON =
        Elm.value
            { importFrom = [ "Route", "Support" ]
            , name = "contactToJSON"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith [ "Route", "Support" ] "Contact" [] ]
                        (Type.namedWith [ "Json", "Encode" ] "Value" [])
                    )
            }
    , action =
        Elm.value
            { importFrom = [ "Route", "Support" ]
            , name = "action"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith [ "Route", "Support" ] "RouteParams" []
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
                                    [ "Route", "Support" ]
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
            { importFrom = [ "Route", "Support" ]
            , name = "view"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith
                            [ "RouteBuilder" ]
                            "App"
                            [ Type.namedWith [ "Route", "Support" ] "Data" []
                            , Type.namedWith
                                [ "Route", "Support" ]
                                "ActionData"
                                []
                            , Type.namedWith
                                [ "Route", "Support" ]
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
                                [ Type.namedWith [ "Route", "Support" ] "Msg" []
                                ]
                            ]
                        )
                    )
            }
    , form =
        Elm.value
            { importFrom = [ "Route", "Support" ]
            , name = "form"
            , annotation =
                Just
                    (Type.function
                        [ Type.maybe
                            (Type.namedWith [ "Route", "Support" ] "I18n" [])
                        ]
                        (Type.namedWith
                            [ "Form" ]
                            "HtmlForm"
                            [ Type.string
                            , Type.namedWith [ "Route", "Support" ] "Contact" []
                            , Type.namedWith [ "Route", "Support" ] "Contact" []
                            , Type.namedWith
                                [ "PagesMsg" ]
                                "PagesMsg"
                                [ Type.namedWith [ "Route", "Support" ] "Msg" []
                                ]
                            ]
                        )
                    )
            }
    , emptyForm =
        Elm.value
            { importFrom = [ "Route", "Support" ]
            , name = "emptyForm"
            , annotation =
                Just (Type.namedWith [ "Route", "Support" ] "Contact" [])
            }
    , head =
        Elm.value
            { importFrom = [ "Route", "Support" ]
            , name = "head"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith
                            [ "RouteBuilder" ]
                            "App"
                            [ Type.namedWith [ "Route", "Support" ] "Data" []
                            , Type.namedWith
                                [ "Route", "Support" ]
                                "ActionData"
                                []
                            , Type.namedWith
                                [ "Route", "Support" ]
                                "RouteParams"
                                []
                            ]
                        ]
                        (Type.list (Type.namedWith [ "Head" ] "Tag" []))
                    )
            }
    , mdText =
        Elm.value
            { importFrom = [ "Route", "Support" ]
            , name = "mdText"
            , annotation =
                Just
                    (Type.namedWith
                        [ "BackendTask" ]
                        "BackendTask"
                        [ Type.namedWith [ "FatalError" ] "FatalError" []
                        , Type.namedWith [ "Route", "Support" ] "Data" []
                        ]
                    )
            }
    , data =
        Elm.value
            { importFrom = [ "Route", "Support" ]
            , name = "data"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith [ "Route", "Support" ] "RouteParams" []
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
                                    [ "Route", "Support" ]
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
            { importFrom = [ "Route", "Support" ]
            , name = "route"
            , annotation =
                Just
                    (Type.namedWith
                        [ "RouteBuilder" ]
                        "StatelessRoute"
                        [ Type.namedWith [ "Route", "Support" ] "RouteParams" []
                        , Type.namedWith [ "Route", "Support" ] "Data" []
                        , Type.namedWith [ "Route", "Support" ] "ActionData" []
                        ]
                    )
            }
    }