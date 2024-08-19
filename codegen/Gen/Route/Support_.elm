module Gen.Route.Support_ exposing (annotation_, make_, moduleName_, route, values_)

{-| 
@docs moduleName_, route, annotation_, make_, values_
-}


import Elm
import Elm.Annotation as Type


{-| The name of this module. -}
moduleName_ : List String
moduleName_ =
    [ "Route", "Support_" ]


{-| route: RouteBuilder.StatefulRoute Route.Support_.RouteParams Route.Support_.Data Route.Support_.ActionData Route.Support_.Model Route.Support_.Msg -}
route : Elm.Expression
route =
    Elm.value
        { importFrom = [ "Route", "Support_" ]
        , name = "route"
        , annotation =
            Just
                (Type.namedWith
                    [ "RouteBuilder" ]
                    "StatefulRoute"
                    [ Type.namedWith [ "Route", "Support_" ] "RouteParams" []
                    , Type.namedWith [ "Route", "Support_" ] "Data" []
                    , Type.namedWith [ "Route", "Support_" ] "ActionData" []
                    , Type.namedWith [ "Route", "Support_" ] "Model" []
                    , Type.namedWith [ "Route", "Support_" ] "Msg" []
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
    , routeParams =
        Type.alias
            moduleName_
            "RouteParams"
            []
            (Type.record [ ( "support", Type.string ) ])
    , msg = Type.alias moduleName_ "Msg" [] Type.unit
    , model = Type.alias moduleName_ "Model" [] (Type.record [])
    }


make_ :
    { actionData : actionData -> Elm.Expression
    , data : { minimal : Elm.Expression } -> Elm.Expression
    , routeParams : { support : Elm.Expression } -> Elm.Expression
    , model : model -> Elm.Expression
    }
make_ =
    { actionData =
        \actionData_args ->
            Elm.withType
                (Type.alias
                    [ "Route", "Support_" ]
                    "ActionData"
                    []
                    (Type.record [])
                )
                (Elm.record [])
    , data =
        \data_args ->
            Elm.withType
                (Type.alias
                    [ "Route", "Support_" ]
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
                    [ "Route", "Support_" ]
                    "RouteParams"
                    []
                    (Type.record [ ( "support", Type.string ) ])
                )
                (Elm.record [ Tuple.pair "support" routeParams_args.support ])
    , model =
        \model_args ->
            Elm.withType
                (Type.alias [ "Route", "Support_" ] "Model" [] (Type.record []))
                (Elm.record [])
    }


values_ : { route : Elm.Expression }
values_ =
    { route =
        Elm.value
            { importFrom = [ "Route", "Support_" ]
            , name = "route"
            , annotation =
                Just
                    (Type.namedWith
                        [ "RouteBuilder" ]
                        "StatefulRoute"
                        [ Type.namedWith
                            [ "Route", "Support_" ]
                            "RouteParams"
                            []
                        , Type.namedWith [ "Route", "Support_" ] "Data" []
                        , Type.namedWith [ "Route", "Support_" ] "ActionData" []
                        , Type.namedWith [ "Route", "Support_" ] "Model" []
                        , Type.namedWith [ "Route", "Support_" ] "Msg" []
                        ]
                    )
            }
    }