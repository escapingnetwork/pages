module Gen.Content.Minimal exposing (accommodation, annotation_, completeRegistration, hosts, make_, moduleName_, partners, privacyPolicy, support, termsAndConditions, values_)

{-| 
@docs moduleName_, completeRegistration, accommodation, support, hosts, partners, termsAndConditions, privacyPolicy, annotation_, make_, values_
-}


import Elm
import Elm.Annotation as Type


{-| The name of this module. -}
moduleName_ : List String
moduleName_ =
    [ "Content", "Minimal" ]


{-| completeRegistration: 
    BackendTask.BackendTask { fatal : FatalError.FatalError
    , recoverable : BackendTask.File.FileReadError Json.Decode.Error
    } Content.Minimal.Minimal
-}
completeRegistration : Elm.Expression
completeRegistration =
    Elm.value
        { importFrom = [ "Content", "Minimal" ]
        , name = "completeRegistration"
        , annotation =
            Just
                (Type.namedWith
                    [ "BackendTask" ]
                    "BackendTask"
                    [ Type.record
                        [ ( "fatal"
                          , Type.namedWith [ "FatalError" ] "FatalError" []
                          )
                        , ( "recoverable"
                          , Type.namedWith
                                [ "BackendTask", "File" ]
                                "FileReadError"
                                [ Type.namedWith [ "Json", "Decode" ] "Error" []
                                ]
                          )
                        ]
                    , Type.namedWith [ "Content", "Minimal" ] "Minimal" []
                    ]
                )
        }


{-| accommodation: 
    BackendTask.BackendTask { fatal : FatalError.FatalError
    , recoverable : BackendTask.File.FileReadError Json.Decode.Error
    } Content.Minimal.Minimal
-}
accommodation : Elm.Expression
accommodation =
    Elm.value
        { importFrom = [ "Content", "Minimal" ]
        , name = "accommodation"
        , annotation =
            Just
                (Type.namedWith
                    [ "BackendTask" ]
                    "BackendTask"
                    [ Type.record
                        [ ( "fatal"
                          , Type.namedWith [ "FatalError" ] "FatalError" []
                          )
                        , ( "recoverable"
                          , Type.namedWith
                                [ "BackendTask", "File" ]
                                "FileReadError"
                                [ Type.namedWith [ "Json", "Decode" ] "Error" []
                                ]
                          )
                        ]
                    , Type.namedWith [ "Content", "Minimal" ] "Minimal" []
                    ]
                )
        }


{-| support: 
    BackendTask.BackendTask { fatal : FatalError.FatalError
    , recoverable : BackendTask.File.FileReadError Json.Decode.Error
    } Content.Minimal.Minimal
-}
support : Elm.Expression
support =
    Elm.value
        { importFrom = [ "Content", "Minimal" ]
        , name = "support"
        , annotation =
            Just
                (Type.namedWith
                    [ "BackendTask" ]
                    "BackendTask"
                    [ Type.record
                        [ ( "fatal"
                          , Type.namedWith [ "FatalError" ] "FatalError" []
                          )
                        , ( "recoverable"
                          , Type.namedWith
                                [ "BackendTask", "File" ]
                                "FileReadError"
                                [ Type.namedWith [ "Json", "Decode" ] "Error" []
                                ]
                          )
                        ]
                    , Type.namedWith [ "Content", "Minimal" ] "Minimal" []
                    ]
                )
        }


{-| hosts: 
    BackendTask.BackendTask { fatal : FatalError.FatalError
    , recoverable : BackendTask.File.FileReadError Json.Decode.Error
    } Content.Minimal.Minimal
-}
hosts : Elm.Expression
hosts =
    Elm.value
        { importFrom = [ "Content", "Minimal" ]
        , name = "hosts"
        , annotation =
            Just
                (Type.namedWith
                    [ "BackendTask" ]
                    "BackendTask"
                    [ Type.record
                        [ ( "fatal"
                          , Type.namedWith [ "FatalError" ] "FatalError" []
                          )
                        , ( "recoverable"
                          , Type.namedWith
                                [ "BackendTask", "File" ]
                                "FileReadError"
                                [ Type.namedWith [ "Json", "Decode" ] "Error" []
                                ]
                          )
                        ]
                    , Type.namedWith [ "Content", "Minimal" ] "Minimal" []
                    ]
                )
        }


{-| partners: 
    BackendTask.BackendTask { fatal : FatalError.FatalError
    , recoverable : BackendTask.File.FileReadError Json.Decode.Error
    } Content.Minimal.Minimal
-}
partners : Elm.Expression
partners =
    Elm.value
        { importFrom = [ "Content", "Minimal" ]
        , name = "partners"
        , annotation =
            Just
                (Type.namedWith
                    [ "BackendTask" ]
                    "BackendTask"
                    [ Type.record
                        [ ( "fatal"
                          , Type.namedWith [ "FatalError" ] "FatalError" []
                          )
                        , ( "recoverable"
                          , Type.namedWith
                                [ "BackendTask", "File" ]
                                "FileReadError"
                                [ Type.namedWith [ "Json", "Decode" ] "Error" []
                                ]
                          )
                        ]
                    , Type.namedWith [ "Content", "Minimal" ] "Minimal" []
                    ]
                )
        }


{-| termsAndConditions: 
    BackendTask.BackendTask { fatal : FatalError.FatalError
    , recoverable : BackendTask.File.FileReadError Json.Decode.Error
    } Content.Minimal.Minimal
-}
termsAndConditions : Elm.Expression
termsAndConditions =
    Elm.value
        { importFrom = [ "Content", "Minimal" ]
        , name = "termsAndConditions"
        , annotation =
            Just
                (Type.namedWith
                    [ "BackendTask" ]
                    "BackendTask"
                    [ Type.record
                        [ ( "fatal"
                          , Type.namedWith [ "FatalError" ] "FatalError" []
                          )
                        , ( "recoverable"
                          , Type.namedWith
                                [ "BackendTask", "File" ]
                                "FileReadError"
                                [ Type.namedWith [ "Json", "Decode" ] "Error" []
                                ]
                          )
                        ]
                    , Type.namedWith [ "Content", "Minimal" ] "Minimal" []
                    ]
                )
        }


{-| privacyPolicy: 
    BackendTask.BackendTask { fatal : FatalError.FatalError
    , recoverable : BackendTask.File.FileReadError Json.Decode.Error
    } Content.Minimal.Minimal
-}
privacyPolicy : Elm.Expression
privacyPolicy =
    Elm.value
        { importFrom = [ "Content", "Minimal" ]
        , name = "privacyPolicy"
        , annotation =
            Just
                (Type.namedWith
                    [ "BackendTask" ]
                    "BackendTask"
                    [ Type.record
                        [ ( "fatal"
                          , Type.namedWith [ "FatalError" ] "FatalError" []
                          )
                        , ( "recoverable"
                          , Type.namedWith
                                [ "BackendTask", "File" ]
                                "FileReadError"
                                [ Type.namedWith [ "Json", "Decode" ] "Error" []
                                ]
                          )
                        ]
                    , Type.namedWith [ "Content", "Minimal" ] "Minimal" []
                    ]
                )
        }


annotation_ : { minimal : Type.Annotation }
annotation_ =
    { minimal =
        Type.alias
            moduleName_
            "Minimal"
            []
            (Type.record
                [ ( "body", Type.string )
                , ( "title", Type.string )
                , ( "company", Type.string )
                , ( "slug", Type.string )
                ]
            )
    }


make_ :
    { minimal :
        { body : Elm.Expression
        , title : Elm.Expression
        , company : Elm.Expression
        , slug : Elm.Expression
        }
        -> Elm.Expression
    }
make_ =
    { minimal =
        \minimal_args ->
            Elm.withType
                (Type.alias
                    [ "Content", "Minimal" ]
                    "Minimal"
                    []
                    (Type.record
                        [ ( "body", Type.string )
                        , ( "title", Type.string )
                        , ( "company", Type.string )
                        , ( "slug", Type.string )
                        ]
                    )
                )
                (Elm.record
                    [ Tuple.pair "body" minimal_args.body
                    , Tuple.pair "title" minimal_args.title
                    , Tuple.pair "company" minimal_args.company
                    , Tuple.pair "slug" minimal_args.slug
                    ]
                )
    }


values_ :
    { completeRegistration : Elm.Expression
    , accommodation : Elm.Expression
    , support : Elm.Expression
    , hosts : Elm.Expression
    , partners : Elm.Expression
    , termsAndConditions : Elm.Expression
    , privacyPolicy : Elm.Expression
    }
values_ =
    { completeRegistration =
        Elm.value
            { importFrom = [ "Content", "Minimal" ]
            , name = "completeRegistration"
            , annotation =
                Just
                    (Type.namedWith
                        [ "BackendTask" ]
                        "BackendTask"
                        [ Type.record
                            [ ( "fatal"
                              , Type.namedWith [ "FatalError" ] "FatalError" []
                              )
                            , ( "recoverable"
                              , Type.namedWith
                                    [ "BackendTask", "File" ]
                                    "FileReadError"
                                    [ Type.namedWith
                                        [ "Json", "Decode" ]
                                        "Error"
                                        []
                                    ]
                              )
                            ]
                        , Type.namedWith [ "Content", "Minimal" ] "Minimal" []
                        ]
                    )
            }
    , accommodation =
        Elm.value
            { importFrom = [ "Content", "Minimal" ]
            , name = "accommodation"
            , annotation =
                Just
                    (Type.namedWith
                        [ "BackendTask" ]
                        "BackendTask"
                        [ Type.record
                            [ ( "fatal"
                              , Type.namedWith [ "FatalError" ] "FatalError" []
                              )
                            , ( "recoverable"
                              , Type.namedWith
                                    [ "BackendTask", "File" ]
                                    "FileReadError"
                                    [ Type.namedWith
                                        [ "Json", "Decode" ]
                                        "Error"
                                        []
                                    ]
                              )
                            ]
                        , Type.namedWith [ "Content", "Minimal" ] "Minimal" []
                        ]
                    )
            }
    , support =
        Elm.value
            { importFrom = [ "Content", "Minimal" ]
            , name = "support"
            , annotation =
                Just
                    (Type.namedWith
                        [ "BackendTask" ]
                        "BackendTask"
                        [ Type.record
                            [ ( "fatal"
                              , Type.namedWith [ "FatalError" ] "FatalError" []
                              )
                            , ( "recoverable"
                              , Type.namedWith
                                    [ "BackendTask", "File" ]
                                    "FileReadError"
                                    [ Type.namedWith
                                        [ "Json", "Decode" ]
                                        "Error"
                                        []
                                    ]
                              )
                            ]
                        , Type.namedWith [ "Content", "Minimal" ] "Minimal" []
                        ]
                    )
            }
    , hosts =
        Elm.value
            { importFrom = [ "Content", "Minimal" ]
            , name = "hosts"
            , annotation =
                Just
                    (Type.namedWith
                        [ "BackendTask" ]
                        "BackendTask"
                        [ Type.record
                            [ ( "fatal"
                              , Type.namedWith [ "FatalError" ] "FatalError" []
                              )
                            , ( "recoverable"
                              , Type.namedWith
                                    [ "BackendTask", "File" ]
                                    "FileReadError"
                                    [ Type.namedWith
                                        [ "Json", "Decode" ]
                                        "Error"
                                        []
                                    ]
                              )
                            ]
                        , Type.namedWith [ "Content", "Minimal" ] "Minimal" []
                        ]
                    )
            }
    , partners =
        Elm.value
            { importFrom = [ "Content", "Minimal" ]
            , name = "partners"
            , annotation =
                Just
                    (Type.namedWith
                        [ "BackendTask" ]
                        "BackendTask"
                        [ Type.record
                            [ ( "fatal"
                              , Type.namedWith [ "FatalError" ] "FatalError" []
                              )
                            , ( "recoverable"
                              , Type.namedWith
                                    [ "BackendTask", "File" ]
                                    "FileReadError"
                                    [ Type.namedWith
                                        [ "Json", "Decode" ]
                                        "Error"
                                        []
                                    ]
                              )
                            ]
                        , Type.namedWith [ "Content", "Minimal" ] "Minimal" []
                        ]
                    )
            }
    , termsAndConditions =
        Elm.value
            { importFrom = [ "Content", "Minimal" ]
            , name = "termsAndConditions"
            , annotation =
                Just
                    (Type.namedWith
                        [ "BackendTask" ]
                        "BackendTask"
                        [ Type.record
                            [ ( "fatal"
                              , Type.namedWith [ "FatalError" ] "FatalError" []
                              )
                            , ( "recoverable"
                              , Type.namedWith
                                    [ "BackendTask", "File" ]
                                    "FileReadError"
                                    [ Type.namedWith
                                        [ "Json", "Decode" ]
                                        "Error"
                                        []
                                    ]
                              )
                            ]
                        , Type.namedWith [ "Content", "Minimal" ] "Minimal" []
                        ]
                    )
            }
    , privacyPolicy =
        Elm.value
            { importFrom = [ "Content", "Minimal" ]
            , name = "privacyPolicy"
            , annotation =
                Just
                    (Type.namedWith
                        [ "BackendTask" ]
                        "BackendTask"
                        [ Type.record
                            [ ( "fatal"
                              , Type.namedWith [ "FatalError" ] "FatalError" []
                              )
                            , ( "recoverable"
                              , Type.namedWith
                                    [ "BackendTask", "File" ]
                                    "FileReadError"
                                    [ Type.namedWith
                                        [ "Json", "Decode" ]
                                        "Error"
                                        []
                                    ]
                              )
                            ]
                        , Type.namedWith [ "Content", "Minimal" ] "Minimal" []
                        ]
                    )
            }
    }