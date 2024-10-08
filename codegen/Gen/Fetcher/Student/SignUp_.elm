module Gen.Fetcher.Student.SignUp_ exposing (call_, moduleName_, submit, values_)

{-| 
@docs moduleName_, submit, call_, values_
-}


import Elm
import Elm.Annotation as Type


{-| The name of this module. -}
moduleName_ : List String
moduleName_ =
    [ "Fetcher", "Student", "SignUp_" ]


{-| submit: 
    (Result.Result Http.Error Route.Student.SignUp_.ActionData -> msg)
    -> { fields : List ( String, String ), headers : List ( String, String ) }
    -> Pages.Fetcher.Fetcher msg
-}
submit :
    (Elm.Expression -> Elm.Expression)
    -> { fields : List Elm.Expression, headers : List Elm.Expression }
    -> Elm.Expression
submit submitArg submitArg0 =
    Elm.apply
        (Elm.value
            { importFrom = [ "Fetcher", "Student", "SignUp_" ]
            , name = "submit"
            , annotation =
                Just
                    (Type.function
                        [ Type.function
                            [ Type.namedWith
                                [ "Result" ]
                                "Result"
                                [ Type.namedWith [ "Http" ] "Error" []
                                , Type.namedWith
                                    [ "Route", "Student", "SignUp_" ]
                                    "ActionData"
                                    []
                                ]
                            ]
                            (Type.var "msg")
                        , Type.record
                            [ ( "fields"
                              , Type.list (Type.tuple Type.string Type.string)
                              )
                            , ( "headers"
                              , Type.list (Type.tuple Type.string Type.string)
                              )
                            ]
                        ]
                        (Type.namedWith
                            [ "Pages", "Fetcher" ]
                            "Fetcher"
                            [ Type.var "msg" ]
                        )
                    )
            }
        )
        [ Elm.functionReduced "submitUnpack" submitArg
        , Elm.record
            [ Tuple.pair "fields" (Elm.list submitArg0.fields)
            , Tuple.pair "headers" (Elm.list submitArg0.headers)
            ]
        ]


call_ : { submit : Elm.Expression -> Elm.Expression -> Elm.Expression }
call_ =
    { submit =
        \submitArg submitArg0 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Fetcher", "Student", "SignUp_" ]
                    , name = "submit"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.function
                                    [ Type.namedWith
                                        [ "Result" ]
                                        "Result"
                                        [ Type.namedWith [ "Http" ] "Error" []
                                        , Type.namedWith
                                            [ "Route", "Student", "SignUp_" ]
                                            "ActionData"
                                            []
                                        ]
                                    ]
                                    (Type.var "msg")
                                , Type.record
                                    [ ( "fields"
                                      , Type.list
                                            (Type.tuple Type.string Type.string)
                                      )
                                    , ( "headers"
                                      , Type.list
                                            (Type.tuple Type.string Type.string)
                                      )
                                    ]
                                ]
                                (Type.namedWith
                                    [ "Pages", "Fetcher" ]
                                    "Fetcher"
                                    [ Type.var "msg" ]
                                )
                            )
                    }
                )
                [ submitArg, submitArg0 ]
    }


values_ : { submit : Elm.Expression }
values_ =
    { submit =
        Elm.value
            { importFrom = [ "Fetcher", "Student", "SignUp_" ]
            , name = "submit"
            , annotation =
                Just
                    (Type.function
                        [ Type.function
                            [ Type.namedWith
                                [ "Result" ]
                                "Result"
                                [ Type.namedWith [ "Http" ] "Error" []
                                , Type.namedWith
                                    [ "Route", "Student", "SignUp_" ]
                                    "ActionData"
                                    []
                                ]
                            ]
                            (Type.var "msg")
                        , Type.record
                            [ ( "fields"
                              , Type.list (Type.tuple Type.string Type.string)
                              )
                            , ( "headers"
                              , Type.list (Type.tuple Type.string Type.string)
                              )
                            ]
                        ]
                        (Type.namedWith
                            [ "Pages", "Fetcher" ]
                            "Fetcher"
                            [ Type.var "msg" ]
                        )
                    )
            }
    }