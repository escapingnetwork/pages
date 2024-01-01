module Gen.Api exposing (call_, manifest, moduleName_, routes, values_)

{-| 
@docs values_, call_, routes, manifest, moduleName_
-}


import Elm
import Elm.Annotation as Type


{-| The name of this module. -}
moduleName_ : List String
moduleName_ =
    [ "Api" ]


{-| manifest: Manifest.Config -}
manifest : Elm.Expression
manifest =
    Elm.value
        { importFrom = [ "Api" ]
        , name = "manifest"
        , annotation = Just (Type.namedWith [ "Manifest" ] "Config" [])
        }


{-| routes: 
    BackendTask FatalError (List Route)
    -> (Maybe { indent : Int, newLines : Bool } -> Html Never -> String)
    -> List (ApiRoute ApiRoute.Response)
-}
routes :
    Elm.Expression
    -> (Elm.Expression -> Elm.Expression -> Elm.Expression)
    -> Elm.Expression
routes routesArg routesArg0 =
    Elm.apply
        (Elm.value
            { importFrom = [ "Api" ]
            , name = "routes"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith
                            []
                            "BackendTask"
                            [ Type.namedWith [] "FatalError" []
                            , Type.list (Type.namedWith [] "Route" [])
                            ]
                        , Type.function
                            [ Type.namedWith
                                []
                                "Maybe"
                                [ Type.record
                                    [ ( "indent", Type.int )
                                    , ( "newLines", Type.bool )
                                    ]
                                ]
                            , Type.namedWith
                                []
                                "Html"
                                [ Type.namedWith [] "Never" [] ]
                            ]
                            Type.string
                        ]
                        (Type.list
                            (Type.namedWith
                                []
                                "ApiRoute"
                                [ Type.namedWith [ "ApiRoute" ] "Response" [] ]
                            )
                        )
                    )
            }
        )
        [ routesArg
        , Elm.functionReduced
            "routesUnpack"
            (\functionReducedUnpack ->
                Elm.functionReduced "unpack" (routesArg0 functionReducedUnpack)
            )
        ]


call_ : { routes : Elm.Expression -> Elm.Expression -> Elm.Expression }
call_ =
    { routes =
        \routesArg routesArg0 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Api" ]
                    , name = "routes"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.namedWith
                                    []
                                    "BackendTask"
                                    [ Type.namedWith [] "FatalError" []
                                    , Type.list (Type.namedWith [] "Route" [])
                                    ]
                                , Type.function
                                    [ Type.namedWith
                                        []
                                        "Maybe"
                                        [ Type.record
                                            [ ( "indent", Type.int )
                                            , ( "newLines", Type.bool )
                                            ]
                                        ]
                                    , Type.namedWith
                                        []
                                        "Html"
                                        [ Type.namedWith [] "Never" [] ]
                                    ]
                                    Type.string
                                ]
                                (Type.list
                                    (Type.namedWith
                                        []
                                        "ApiRoute"
                                        [ Type.namedWith
                                            [ "ApiRoute" ]
                                            "Response"
                                            []
                                        ]
                                    )
                                )
                            )
                    }
                )
                [ routesArg, routesArg0 ]
    }


values_ : { manifest : Elm.Expression, routes : Elm.Expression }
values_ =
    { manifest =
        Elm.value
            { importFrom = [ "Api" ]
            , name = "manifest"
            , annotation = Just (Type.namedWith [ "Manifest" ] "Config" [])
            }
    , routes =
        Elm.value
            { importFrom = [ "Api" ]
            , name = "routes"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith
                            []
                            "BackendTask"
                            [ Type.namedWith [] "FatalError" []
                            , Type.list (Type.namedWith [] "Route" [])
                            ]
                        , Type.function
                            [ Type.namedWith
                                []
                                "Maybe"
                                [ Type.record
                                    [ ( "indent", Type.int )
                                    , ( "newLines", Type.bool )
                                    ]
                                ]
                            , Type.namedWith
                                []
                                "Html"
                                [ Type.namedWith [] "Never" [] ]
                            ]
                            Type.string
                        ]
                        (Type.list
                            (Type.namedWith
                                []
                                "ApiRoute"
                                [ Type.namedWith [ "ApiRoute" ] "Response" [] ]
                            )
                        )
                    )
            }
    }


