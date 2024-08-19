module Gen.Route.PrivacyPolicy exposing (annotation_, make_, moduleName_, route, values_)

{-| 
@docs moduleName_, route, annotation_, make_, values_
-}


import Elm
import Elm.Annotation as Type


{-| The name of this module. -}
moduleName_ : List String
moduleName_ =
    [ "Route", "PrivacyPolicy" ]


{-| route: RouteBuilder.StatelessRoute Route.PrivacyPolicy.RouteParams Route.PrivacyPolicy.Data Route.PrivacyPolicy.ActionData -}
route : Elm.Expression
route =
    Elm.value
        { importFrom = [ "Route", "PrivacyPolicy" ]
        , name = "route"
        , annotation =
            Just
                (Type.namedWith
                    [ "RouteBuilder" ]
                    "StatelessRoute"
                    [ Type.namedWith
                        [ "Route", "PrivacyPolicy" ]
                        "RouteParams"
                        []
                    , Type.namedWith [ "Route", "PrivacyPolicy" ] "Data" []
                    , Type.namedWith
                        [ "Route", "PrivacyPolicy" ]
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
                    [ "Route", "PrivacyPolicy" ]
                    "ActionData"
                    []
                    (Type.record [])
                )
                (Elm.record [])
    , data =
        \data_args ->
            Elm.withType
                (Type.alias
                    [ "Route", "PrivacyPolicy" ]
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
                    [ "Route", "PrivacyPolicy" ]
                    "RouteParams"
                    []
                    (Type.record [])
                )
                (Elm.record [])
    , model =
        \model_args ->
            Elm.withType
                (Type.alias
                    [ "Route", "PrivacyPolicy" ]
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
            { importFrom = [ "Route", "PrivacyPolicy" ]
            , name = "route"
            , annotation =
                Just
                    (Type.namedWith
                        [ "RouteBuilder" ]
                        "StatelessRoute"
                        [ Type.namedWith
                            [ "Route", "PrivacyPolicy" ]
                            "RouteParams"
                            []
                        , Type.namedWith [ "Route", "PrivacyPolicy" ] "Data" []
                        , Type.namedWith
                            [ "Route", "PrivacyPolicy" ]
                            "ActionData"
                            []
                        ]
                    )
            }
    }