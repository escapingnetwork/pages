module Gen.Route.Booking.TermsAndConditions exposing (annotation_, make_, moduleName_, route, values_)

{-| 
@docs values_, make_, annotation_, route, moduleName_
-}


import Elm
import Elm.Annotation as Type


{-| The name of this module. -}
moduleName_ : List String
moduleName_ =
    [ "Route", "Booking", "TermsAndConditions" ]


{-| route: RouteBuilder.StatefulRoute RouteParams Data ActionData Model Msg -}
route : Elm.Expression
route =
    Elm.value
        { importFrom = [ "Route", "Booking", "TermsAndConditions" ]
        , name = "route"
        , annotation =
            Just
                (Type.namedWith
                    [ "RouteBuilder" ]
                    "StatefulRoute"
                    [ Type.namedWith [] "RouteParams" []
                    , Type.namedWith [] "Data" []
                    , Type.namedWith [] "ActionData" []
                    , Type.namedWith [] "Model" []
                    , Type.namedWith [] "Msg" []
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
                [ ( "legal", Type.namedWith [ "Content", "Legals" ] "Legal" [] )
                ]
            )
    , routeParams = Type.alias moduleName_ "RouteParams" [] (Type.record [])
    , msg = Type.alias moduleName_ "Msg" [] Type.unit
    , model = Type.alias moduleName_ "Model" [] (Type.record [])
    }


make_ :
    { actionData : actionData -> Elm.Expression
    , data : { legal : Elm.Expression } -> Elm.Expression
    , routeParams : routeParams -> Elm.Expression
    , model : model -> Elm.Expression
    }
make_ =
    { actionData =
        \actionData_args ->
            Elm.withType
                (Type.alias
                    [ "Route", "Booking", "TermsAndConditions" ]
                    "ActionData"
                    []
                    (Type.record [])
                )
                (Elm.record [])
    , data =
        \data_args ->
            Elm.withType
                (Type.alias
                    [ "Route", "Booking", "TermsAndConditions" ]
                    "Data"
                    []
                    (Type.record
                        [ ( "legal"
                          , Type.namedWith [ "Content", "Legals" ] "Legal" []
                          )
                        ]
                    )
                )
                (Elm.record [ Tuple.pair "legal" data_args.legal ])
    , routeParams =
        \routeParams_args ->
            Elm.withType
                (Type.alias
                    [ "Route", "Booking", "TermsAndConditions" ]
                    "RouteParams"
                    []
                    (Type.record [])
                )
                (Elm.record [])
    , model =
        \model_args ->
            Elm.withType
                (Type.alias
                    [ "Route", "Booking", "TermsAndConditions" ]
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
            { importFrom = [ "Route", "Booking", "TermsAndConditions" ]
            , name = "route"
            , annotation =
                Just
                    (Type.namedWith
                        [ "RouteBuilder" ]
                        "StatefulRoute"
                        [ Type.namedWith [] "RouteParams" []
                        , Type.namedWith [] "Data" []
                        , Type.namedWith [] "ActionData" []
                        , Type.namedWith [] "Model" []
                        , Type.namedWith [] "Msg" []
                        ]
                    )
            }
    }


