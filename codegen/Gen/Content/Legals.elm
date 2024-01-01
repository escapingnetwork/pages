module Gen.Content.Legals exposing (annotation_, make_, moduleName_, privacyPolicy, termsAndConditions, values_)

{-| 
@docs values_, make_, annotation_, privacyPolicy, termsAndConditions, moduleName_
-}


import Elm
import Elm.Annotation as Type


{-| The name of this module. -}
moduleName_ : List String
moduleName_ =
    [ "Content", "Legals" ]


{-| termsAndConditions: 
    BackendTask { fatal : FatalError
    , recoverable : File.FileReadError Decode.Error
    } Legal
-}
termsAndConditions : Elm.Expression
termsAndConditions =
    Elm.value
        { importFrom = [ "Content", "Legals" ]
        , name = "termsAndConditions"
        , annotation =
            Just
                (Type.namedWith
                    []
                    "BackendTask"
                    [ Type.record
                        [ ( "fatal", Type.namedWith [] "FatalError" [] )
                        , ( "recoverable"
                          , Type.namedWith
                                [ "File" ]
                                "FileReadError"
                                [ Type.namedWith [ "Decode" ] "Error" [] ]
                          )
                        ]
                    , Type.namedWith [] "Legal" []
                    ]
                )
        }


{-| privacyPolicy: 
    BackendTask { fatal : FatalError
    , recoverable : File.FileReadError Decode.Error
    } Legal
-}
privacyPolicy : Elm.Expression
privacyPolicy =
    Elm.value
        { importFrom = [ "Content", "Legals" ]
        , name = "privacyPolicy"
        , annotation =
            Just
                (Type.namedWith
                    []
                    "BackendTask"
                    [ Type.record
                        [ ( "fatal", Type.namedWith [] "FatalError" [] )
                        , ( "recoverable"
                          , Type.namedWith
                                [ "File" ]
                                "FileReadError"
                                [ Type.namedWith [ "Decode" ] "Error" [] ]
                          )
                        ]
                    , Type.namedWith [] "Legal" []
                    ]
                )
        }


annotation_ : { legal : Type.Annotation }
annotation_ =
    { legal =
        Type.alias
            moduleName_
            "Legal"
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
    { legal :
        { body : Elm.Expression
        , title : Elm.Expression
        , company : Elm.Expression
        , slug : Elm.Expression
        }
        -> Elm.Expression
    }
make_ =
    { legal =
        \legal_args ->
            Elm.withType
                (Type.alias
                    [ "Content", "Legals" ]
                    "Legal"
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
                    [ Tuple.pair "body" legal_args.body
                    , Tuple.pair "title" legal_args.title
                    , Tuple.pair "company" legal_args.company
                    , Tuple.pair "slug" legal_args.slug
                    ]
                )
    }


values_ :
    { termsAndConditions : Elm.Expression, privacyPolicy : Elm.Expression }
values_ =
    { termsAndConditions =
        Elm.value
            { importFrom = [ "Content", "Legals" ]
            , name = "termsAndConditions"
            , annotation =
                Just
                    (Type.namedWith
                        []
                        "BackendTask"
                        [ Type.record
                            [ ( "fatal", Type.namedWith [] "FatalError" [] )
                            , ( "recoverable"
                              , Type.namedWith
                                    [ "File" ]
                                    "FileReadError"
                                    [ Type.namedWith [ "Decode" ] "Error" [] ]
                              )
                            ]
                        , Type.namedWith [] "Legal" []
                        ]
                    )
            }
    , privacyPolicy =
        Elm.value
            { importFrom = [ "Content", "Legals" ]
            , name = "privacyPolicy"
            , annotation =
                Just
                    (Type.namedWith
                        []
                        "BackendTask"
                        [ Type.record
                            [ ( "fatal", Type.namedWith [] "FatalError" [] )
                            , ( "recoverable"
                              , Type.namedWith
                                    [ "File" ]
                                    "FileReadError"
                                    [ Type.namedWith [ "Decode" ] "Error" [] ]
                              )
                            ]
                        , Type.namedWith [] "Legal" []
                        ]
                    )
            }
    }


