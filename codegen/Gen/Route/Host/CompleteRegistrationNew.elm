module Gen.Route.Host.CompleteRegistrationNew exposing (annotation_, make_, moduleName_, route, values_)

{-| 
@docs moduleName_, route, annotation_, make_, values_
-}


import Elm
import Elm.Annotation as Type


{-| The name of this module. -}
moduleName_ : List String
moduleName_ =
    [ "Route", "Host", "CompleteRegistrationNew" ]


{-| route: RouteBuilder.StatelessRoute Route.Host.CompleteRegistrationNew.RouteParams Route.Host.CompleteRegistrationNew.Data Route.Host.CompleteRegistrationNew.ActionData -}
route : Elm.Expression
route =
    Elm.value
        { importFrom = [ "Route", "Host", "CompleteRegistrationNew" ]
        , name = "route"
        , annotation =
            Just
                (Type.namedWith
                    [ "RouteBuilder" ]
                    "StatelessRoute"
                    [ Type.namedWith
                        [ "Route", "Host", "CompleteRegistrationNew" ]
                        "RouteParams"
                        []
                    , Type.namedWith
                        [ "Route", "Host", "CompleteRegistrationNew" ]
                        "Data"
                        []
                    , Type.namedWith
                        [ "Route", "Host", "CompleteRegistrationNew" ]
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
    { actionData =
        Type.alias
            moduleName_
            "ActionData"
            []
            (Type.record
                [ ( "host"
                  , Type.namedWith
                        [ "Route", "Host", "CompleteRegistrationNew" ]
                        "Host"
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
    , routeParams = Type.alias moduleName_ "RouteParams" [] (Type.record [])
    , msg = Type.alias moduleName_ "Msg" [] Type.unit
    , model = Type.alias moduleName_ "Model" [] (Type.record [])
    }


make_ :
    { actionData :
        { host : Elm.Expression, formResponse : Elm.Expression }
        -> Elm.Expression
    , data : { minimal : Elm.Expression } -> Elm.Expression
    , routeParams : routeParams -> Elm.Expression
    , model : model -> Elm.Expression
    }
make_ =
    { actionData =
        \actionData_args ->
            Elm.withType
                (Type.alias
                    [ "Route", "Host", "CompleteRegistrationNew" ]
                    "ActionData"
                    []
                    (Type.record
                        [ ( "host"
                          , Type.namedWith
                                [ "Route", "Host", "CompleteRegistrationNew" ]
                                "Host"
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
                    [ Tuple.pair "host" actionData_args.host
                    , Tuple.pair "formResponse" actionData_args.formResponse
                    ]
                )
    , data =
        \data_args ->
            Elm.withType
                (Type.alias
                    [ "Route", "Host", "CompleteRegistrationNew" ]
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
                    [ "Route", "Host", "CompleteRegistrationNew" ]
                    "RouteParams"
                    []
                    (Type.record [])
                )
                (Elm.record [])
    , model =
        \model_args ->
            Elm.withType
                (Type.alias
                    [ "Route", "Host", "CompleteRegistrationNew" ]
                    "Model"
                    []
                    (Type.record [])
                )
                (Elm.record [])
    }


values_ : { route : Elm.Expression }
values_ =
    { route =
        Elm.value
            { importFrom = [ "Route", "Host", "CompleteRegistrationNew" ]
            , name = "route"
            , annotation =
                Just
                    (Type.namedWith
                        [ "RouteBuilder" ]
                        "StatelessRoute"
                        [ Type.namedWith
                            [ "Route", "Host", "CompleteRegistrationNew" ]
                            "RouteParams"
                            []
                        , Type.namedWith
                            [ "Route", "Host", "CompleteRegistrationNew" ]
                            "Data"
                            []
                        , Type.namedWith
                            [ "Route", "Host", "CompleteRegistrationNew" ]
                            "ActionData"
                            []
                        ]
                    )
            }
    }