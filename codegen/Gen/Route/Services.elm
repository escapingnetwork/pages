module Gen.Route.Services exposing (annotation_, make_, moduleName_, route, values_)

{-| 
@docs moduleName_, route, annotation_, make_, values_
-}


import Elm
import Elm.Annotation as Type


{-| The name of this module. -}
moduleName_ : List String
moduleName_ =
    [ "Route", "Services" ]


{-| route: RouteBuilder.StatelessRoute Route.Services.RouteParams Route.Services.Data Route.Services.ActionData -}
route : Elm.Expression
route =
    Elm.value
        { importFrom = [ "Route", "Services" ]
        , name = "route"
        , annotation =
            Just
                (Type.namedWith
                    [ "RouteBuilder" ]
                    "StatelessRoute"
                    [ Type.namedWith [ "Route", "Services" ] "RouteParams" []
                    , Type.namedWith [ "Route", "Services" ] "Data" []
                    , Type.namedWith [ "Route", "Services" ] "ActionData" []
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
                [ ( "serviceMetadata"
                  , Type.list
                        (Type.namedWith [ "Content", "Services" ] "Metadata" [])
                  )
                ]
            )
    , routeParams = Type.alias moduleName_ "RouteParams" [] (Type.record [])
    , msg = Type.alias moduleName_ "Msg" [] Type.unit
    , model = Type.alias moduleName_ "Model" [] (Type.record [])
    }


make_ :
    { actionData : actionData -> Elm.Expression
    , data : { serviceMetadata : Elm.Expression } -> Elm.Expression
    , routeParams : routeParams -> Elm.Expression
    , model : model -> Elm.Expression
    }
make_ =
    { actionData =
        \actionData_args ->
            Elm.withType
                (Type.alias
                    [ "Route", "Services" ]
                    "ActionData"
                    []
                    (Type.record [])
                )
                (Elm.record [])
    , data =
        \data_args ->
            Elm.withType
                (Type.alias
                    [ "Route", "Services" ]
                    "Data"
                    []
                    (Type.record
                        [ ( "serviceMetadata"
                          , Type.list
                                (Type.namedWith
                                    [ "Content", "Services" ]
                                    "Metadata"
                                    []
                                )
                          )
                        ]
                    )
                )
                (Elm.record
                    [ Tuple.pair "serviceMetadata" data_args.serviceMetadata ]
                )
    , routeParams =
        \routeParams_args ->
            Elm.withType
                (Type.alias
                    [ "Route", "Services" ]
                    "RouteParams"
                    []
                    (Type.record [])
                )
                (Elm.record [])
    , model =
        \model_args ->
            Elm.withType
                (Type.alias [ "Route", "Services" ] "Model" [] (Type.record []))
                (Elm.record [])
    }


values_ : { route : Elm.Expression }
values_ =
    { route =
        Elm.value
            { importFrom = [ "Route", "Services" ]
            , name = "route"
            , annotation =
                Just
                    (Type.namedWith
                        [ "RouteBuilder" ]
                        "StatelessRoute"
                        [ Type.namedWith
                            [ "Route", "Services" ]
                            "RouteParams"
                            []
                        , Type.namedWith [ "Route", "Services" ] "Data" []
                        , Type.namedWith [ "Route", "Services" ] "ActionData" []
                        ]
                    )
            }
    }