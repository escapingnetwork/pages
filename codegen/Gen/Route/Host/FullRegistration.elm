module Gen.Route.Host.FullRegistration exposing (action, annotation_, call_, data, head, make_, moduleName_, route, values_, view)

{-| 
@docs moduleName_, action, view, head, data, route, annotation_, make_, call_, values_
-}


import Elm
import Elm.Annotation as Type


{-| The name of this module. -}
moduleName_ : List String
moduleName_ =
    [ "Route", "Host", "FullRegistration" ]


{-| action: 
    Route.Host.FullRegistration.RouteParams
    -> Server.Request.Request
    -> BackendTask.BackendTask FatalError.FatalError (Server.Response.Response Route.Host.FullRegistration.ActionData ErrorPage.ErrorPage)
-}
action : Elm.Expression -> Elm.Expression -> Elm.Expression
action actionArg actionArg0 =
    Elm.apply
        (Elm.value
            { importFrom = [ "Route", "Host", "FullRegistration" ]
            , name = "action"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith
                            [ "Route", "Host", "FullRegistration" ]
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
                                    [ "Route", "Host", "FullRegistration" ]
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
    RouteBuilder.App Route.Host.FullRegistration.Data Route.Host.FullRegistration.ActionData Route.Host.FullRegistration.RouteParams
    -> Shared.Model
    -> View.View (PagesMsg.PagesMsg Route.Host.FullRegistration.Msg)
-}
view : Elm.Expression -> Elm.Expression -> Elm.Expression
view viewArg viewArg0 =
    Elm.apply
        (Elm.value
            { importFrom = [ "Route", "Host", "FullRegistration" ]
            , name = "view"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith
                            [ "RouteBuilder" ]
                            "App"
                            [ Type.namedWith
                                [ "Route", "Host", "FullRegistration" ]
                                "Data"
                                []
                            , Type.namedWith
                                [ "Route", "Host", "FullRegistration" ]
                                "ActionData"
                                []
                            , Type.namedWith
                                [ "Route", "Host", "FullRegistration" ]
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
                                    [ "Route", "Host", "FullRegistration" ]
                                    "Msg"
                                    []
                                ]
                            ]
                        )
                    )
            }
        )
        [ viewArg, viewArg0 ]


{-| head: 
    RouteBuilder.App Route.Host.FullRegistration.Data Route.Host.FullRegistration.ActionData Route.Host.FullRegistration.RouteParams
    -> List Head.Tag
-}
head : Elm.Expression -> Elm.Expression
head headArg =
    Elm.apply
        (Elm.value
            { importFrom = [ "Route", "Host", "FullRegistration" ]
            , name = "head"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith
                            [ "RouteBuilder" ]
                            "App"
                            [ Type.namedWith
                                [ "Route", "Host", "FullRegistration" ]
                                "Data"
                                []
                            , Type.namedWith
                                [ "Route", "Host", "FullRegistration" ]
                                "ActionData"
                                []
                            , Type.namedWith
                                [ "Route", "Host", "FullRegistration" ]
                                "RouteParams"
                                []
                            ]
                        ]
                        (Type.list (Type.namedWith [ "Head" ] "Tag" []))
                    )
            }
        )
        [ headArg ]


{-| data: BackendTask.BackendTask FatalError.FatalError Route.Host.FullRegistration.Data -}
data : Elm.Expression
data =
    Elm.value
        { importFrom = [ "Route", "Host", "FullRegistration" ]
        , name = "data"
        , annotation =
            Just
                (Type.namedWith
                    [ "BackendTask" ]
                    "BackendTask"
                    [ Type.namedWith [ "FatalError" ] "FatalError" []
                    , Type.namedWith
                        [ "Route", "Host", "FullRegistration" ]
                        "Data"
                        []
                    ]
                )
        }


{-| route: RouteBuilder.StatelessRoute Route.Host.FullRegistration.RouteParams Route.Host.FullRegistration.Data Route.Host.FullRegistration.ActionData -}
route : Elm.Expression
route =
    Elm.value
        { importFrom = [ "Route", "Host", "FullRegistration" ]
        , name = "route"
        , annotation =
            Just
                (Type.namedWith
                    [ "RouteBuilder" ]
                    "StatelessRoute"
                    [ Type.namedWith
                        [ "Route", "Host", "FullRegistration" ]
                        "RouteParams"
                        []
                    , Type.namedWith
                        [ "Route", "Host", "FullRegistration" ]
                        "Data"
                        []
                    , Type.namedWith
                        [ "Route", "Host", "FullRegistration" ]
                        "ActionData"
                        []
                    ]
                )
        }


annotation_ :
    { actionData : Type.Annotation
    , data : Type.Annotation
    , routeParams : Type.Annotation
    , msg : Type.Annotation
    , model : Type.Annotation
    }
annotation_ =
    { actionData = Type.alias moduleName_ "ActionData" [] (Type.record [])
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
    , routeParams = Type.alias moduleName_ "RouteParams" [] (Type.record [])
    , msg = Type.alias moduleName_ "Msg" [] Type.unit
    , model = Type.alias moduleName_ "Model" [] (Type.record [])
    }


make_ :
    { actionData : actionData -> Elm.Expression
    , data : { minimal : Elm.Expression } -> Elm.Expression
    , routeParams : routeParams -> Elm.Expression
    , model : model -> Elm.Expression
    }
make_ =
    { actionData =
        \actionData_args ->
            Elm.withType
                (Type.alias
                    [ "Route", "Host", "FullRegistration" ]
                    "ActionData"
                    []
                    (Type.record [])
                )
                (Elm.record [])
    , data =
        \data_args ->
            Elm.withType
                (Type.alias
                    [ "Route", "Host", "FullRegistration" ]
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
    , routeParams =
        \routeParams_args ->
            Elm.withType
                (Type.alias
                    [ "Route", "Host", "FullRegistration" ]
                    "RouteParams"
                    []
                    (Type.record [])
                )
                (Elm.record [])
    , model =
        \model_args ->
            Elm.withType
                (Type.alias
                    [ "Route", "Host", "FullRegistration" ]
                    "Model"
                    []
                    (Type.record [])
                )
                (Elm.record [])
    }


call_ :
    { action : Elm.Expression -> Elm.Expression -> Elm.Expression
    , view : Elm.Expression -> Elm.Expression -> Elm.Expression
    , head : Elm.Expression -> Elm.Expression
    }
call_ =
    { action =
        \actionArg actionArg0 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Route", "Host", "FullRegistration" ]
                    , name = "action"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.namedWith
                                    [ "Route", "Host", "FullRegistration" ]
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
                                            [ "Route"
                                            , "Host"
                                            , "FullRegistration"
                                            ]
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
                    { importFrom = [ "Route", "Host", "FullRegistration" ]
                    , name = "view"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.namedWith
                                    [ "RouteBuilder" ]
                                    "App"
                                    [ Type.namedWith
                                        [ "Route", "Host", "FullRegistration" ]
                                        "Data"
                                        []
                                    , Type.namedWith
                                        [ "Route", "Host", "FullRegistration" ]
                                        "ActionData"
                                        []
                                    , Type.namedWith
                                        [ "Route", "Host", "FullRegistration" ]
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
                                            [ "Route"
                                            , "Host"
                                            , "FullRegistration"
                                            ]
                                            "Msg"
                                            []
                                        ]
                                    ]
                                )
                            )
                    }
                )
                [ viewArg, viewArg0 ]
    , head =
        \headArg ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Route", "Host", "FullRegistration" ]
                    , name = "head"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.namedWith
                                    [ "RouteBuilder" ]
                                    "App"
                                    [ Type.namedWith
                                        [ "Route", "Host", "FullRegistration" ]
                                        "Data"
                                        []
                                    , Type.namedWith
                                        [ "Route", "Host", "FullRegistration" ]
                                        "ActionData"
                                        []
                                    , Type.namedWith
                                        [ "Route", "Host", "FullRegistration" ]
                                        "RouteParams"
                                        []
                                    ]
                                ]
                                (Type.list (Type.namedWith [ "Head" ] "Tag" []))
                            )
                    }
                )
                [ headArg ]
    }


values_ :
    { action : Elm.Expression
    , view : Elm.Expression
    , head : Elm.Expression
    , data : Elm.Expression
    , route : Elm.Expression
    }
values_ =
    { action =
        Elm.value
            { importFrom = [ "Route", "Host", "FullRegistration" ]
            , name = "action"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith
                            [ "Route", "Host", "FullRegistration" ]
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
                                    [ "Route", "Host", "FullRegistration" ]
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
            { importFrom = [ "Route", "Host", "FullRegistration" ]
            , name = "view"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith
                            [ "RouteBuilder" ]
                            "App"
                            [ Type.namedWith
                                [ "Route", "Host", "FullRegistration" ]
                                "Data"
                                []
                            , Type.namedWith
                                [ "Route", "Host", "FullRegistration" ]
                                "ActionData"
                                []
                            , Type.namedWith
                                [ "Route", "Host", "FullRegistration" ]
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
                                    [ "Route", "Host", "FullRegistration" ]
                                    "Msg"
                                    []
                                ]
                            ]
                        )
                    )
            }
    , head =
        Elm.value
            { importFrom = [ "Route", "Host", "FullRegistration" ]
            , name = "head"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith
                            [ "RouteBuilder" ]
                            "App"
                            [ Type.namedWith
                                [ "Route", "Host", "FullRegistration" ]
                                "Data"
                                []
                            , Type.namedWith
                                [ "Route", "Host", "FullRegistration" ]
                                "ActionData"
                                []
                            , Type.namedWith
                                [ "Route", "Host", "FullRegistration" ]
                                "RouteParams"
                                []
                            ]
                        ]
                        (Type.list (Type.namedWith [ "Head" ] "Tag" []))
                    )
            }
    , data =
        Elm.value
            { importFrom = [ "Route", "Host", "FullRegistration" ]
            , name = "data"
            , annotation =
                Just
                    (Type.namedWith
                        [ "BackendTask" ]
                        "BackendTask"
                        [ Type.namedWith [ "FatalError" ] "FatalError" []
                        , Type.namedWith
                            [ "Route", "Host", "FullRegistration" ]
                            "Data"
                            []
                        ]
                    )
            }
    , route =
        Elm.value
            { importFrom = [ "Route", "Host", "FullRegistration" ]
            , name = "route"
            , annotation =
                Just
                    (Type.namedWith
                        [ "RouteBuilder" ]
                        "StatelessRoute"
                        [ Type.namedWith
                            [ "Route", "Host", "FullRegistration" ]
                            "RouteParams"
                            []
                        , Type.namedWith
                            [ "Route", "Host", "FullRegistration" ]
                            "Data"
                            []
                        , Type.namedWith
                            [ "Route", "Host", "FullRegistration" ]
                            "ActionData"
                            []
                        ]
                    )
            }
    }