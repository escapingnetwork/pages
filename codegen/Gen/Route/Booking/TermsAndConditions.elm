module Gen.Route.Booking.TermsAndConditions exposing (annotation_, make_, moduleName_, route, values_)

{-| 
@docs moduleName_, route, annotation_, make_, values_
-}


import Elm
import Elm.Annotation as Type


{-| The name of this module. -}
moduleName_ : List String
moduleName_ =
    [ "Route", "Booking", "TermsAndConditions" ]


{-| route: RouteBuilder.StatefulRoute Route.Booking.TermsAndConditions.RouteParams Route.Booking.TermsAndConditions.Data Route.Booking.TermsAndConditions.ActionData Route.Booking.TermsAndConditions.Model Route.Booking.TermsAndConditions.Msg -}
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
                    [ Type.namedWith
                        [ "Route", "Booking", "TermsAndConditions" ]
                        "RouteParams"
                        []
                    , Type.namedWith
                        [ "Route", "Booking", "TermsAndConditions" ]
                        "Data"
                        []
                    , Type.namedWith
                        [ "Route", "Booking", "TermsAndConditions" ]
                        "ActionData"
                        []
                    , Type.namedWith
                        [ "Route", "Booking", "TermsAndConditions" ]
                        "Model"
                        []
                    , Type.namedWith
                        [ "Route", "Booking", "TermsAndConditions" ]
                        "Msg"
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
                        [ Type.namedWith
                            [ "Route", "Booking", "TermsAndConditions" ]
                            "RouteParams"
                            []
                        , Type.namedWith
                            [ "Route", "Booking", "TermsAndConditions" ]
                            "Data"
                            []
                        , Type.namedWith
                            [ "Route", "Booking", "TermsAndConditions" ]
                            "ActionData"
                            []
                        , Type.namedWith
                            [ "Route", "Booking", "TermsAndConditions" ]
                            "Model"
                            []
                        , Type.namedWith
                            [ "Route", "Booking", "TermsAndConditions" ]
                            "Msg"
                            []
                        ]
                    )
            }
    }