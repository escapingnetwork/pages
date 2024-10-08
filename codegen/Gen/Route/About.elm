module Gen.Route.About exposing (annotation_, make_, moduleName_, route, values_)

{-| 
@docs moduleName_, route, annotation_, make_, values_
-}


import Elm
import Elm.Annotation as Type


{-| The name of this module. -}
moduleName_ : List String
moduleName_ =
    [ "Route", "About" ]


{-| route: RouteBuilder.StatelessRoute Route.About.RouteParams Route.About.Data Route.About.ActionData -}
route : Elm.Expression
route =
    Elm.value
        { importFrom = [ "Route", "About" ]
        , name = "route"
        , annotation =
            Just
                (Type.namedWith
                    [ "RouteBuilder" ]
                    "StatelessRoute"
                    [ Type.namedWith [ "Route", "About" ] "RouteParams" []
                    , Type.namedWith [ "Route", "About" ] "Data" []
                    , Type.namedWith [ "Route", "About" ] "ActionData" []
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
                [ ( "author"
                  , Type.namedWith [ "Content", "About" ] "Author" []
                  )
                ]
            )
    , routeParams = Type.alias moduleName_ "RouteParams" [] (Type.record [])
    , msg = Type.alias moduleName_ "Msg" [] Type.unit
    , model = Type.alias moduleName_ "Model" [] (Type.record [])
    }


make_ :
    { actionData : actionData -> Elm.Expression
    , data : { author : Elm.Expression } -> Elm.Expression
    , routeParams : routeParams -> Elm.Expression
    , model : model -> Elm.Expression
    }
make_ =
    { actionData =
        \actionData_args ->
            Elm.withType
                (Type.alias
                    [ "Route", "About" ]
                    "ActionData"
                    []
                    (Type.record [])
                )
                (Elm.record [])
    , data =
        \data_args ->
            Elm.withType
                (Type.alias
                    [ "Route", "About" ]
                    "Data"
                    []
                    (Type.record
                        [ ( "author"
                          , Type.namedWith [ "Content", "About" ] "Author" []
                          )
                        ]
                    )
                )
                (Elm.record [ Tuple.pair "author" data_args.author ])
    , routeParams =
        \routeParams_args ->
            Elm.withType
                (Type.alias
                    [ "Route", "About" ]
                    "RouteParams"
                    []
                    (Type.record [])
                )
                (Elm.record [])
    , model =
        \model_args ->
            Elm.withType
                (Type.alias [ "Route", "About" ] "Model" [] (Type.record []))
                (Elm.record [])
    }


values_ : { route : Elm.Expression }
values_ =
    { route =
        Elm.value
            { importFrom = [ "Route", "About" ]
            , name = "route"
            , annotation =
                Just
                    (Type.namedWith
                        [ "RouteBuilder" ]
                        "StatelessRoute"
                        [ Type.namedWith [ "Route", "About" ] "RouteParams" []
                        , Type.namedWith [ "Route", "About" ] "Data" []
                        , Type.namedWith [ "Route", "About" ] "ActionData" []
                        ]
                    )
            }
    }