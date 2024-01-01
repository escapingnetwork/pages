module Gen.Route.Services.Slug_ exposing (annotation_, make_, moduleName_, route, values_)

{-| 
@docs values_, make_, annotation_, route, moduleName_
-}


import Elm
import Elm.Annotation as Type


{-| The name of this module. -}
moduleName_ : List String
moduleName_ =
    [ "Route", "Services", "Slug_" ]


{-| route: StatelessRoute RouteParams Data ActionData -}
route : Elm.Expression
route =
    Elm.value
        { importFrom = [ "Route", "Services", "Slug_" ]
        , name = "route"
        , annotation =
            Just
                (Type.namedWith
                    []
                    "StatelessRoute"
                    [ Type.namedWith [] "RouteParams" []
                    , Type.namedWith [] "Data" []
                    , Type.namedWith [] "ActionData" []
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
            (Type.record [ ( "service", Type.namedWith [] "Service" [] ) ])
    , routeParams =
        Type.alias
            moduleName_
            "RouteParams"
            []
            (Type.record [ ( "slug", Type.string ) ])
    , msg = Type.alias moduleName_ "Msg" [] Type.unit
    , model = Type.alias moduleName_ "Model" [] (Type.record [])
    }


make_ :
    { actionData : actionData -> Elm.Expression
    , data : { service : Elm.Expression } -> Elm.Expression
    , routeParams : { slug : Elm.Expression } -> Elm.Expression
    , model : model -> Elm.Expression
    }
make_ =
    { actionData =
        \actionData_args ->
            Elm.withType
                (Type.alias
                    [ "Route", "Services", "Slug_" ]
                    "ActionData"
                    []
                    (Type.record [])
                )
                (Elm.record [])
    , data =
        \data_args ->
            Elm.withType
                (Type.alias
                    [ "Route", "Services", "Slug_" ]
                    "Data"
                    []
                    (Type.record
                        [ ( "service", Type.namedWith [] "Service" [] ) ]
                    )
                )
                (Elm.record [ Tuple.pair "service" data_args.service ])
    , routeParams =
        \routeParams_args ->
            Elm.withType
                (Type.alias
                    [ "Route", "Services", "Slug_" ]
                    "RouteParams"
                    []
                    (Type.record [ ( "slug", Type.string ) ])
                )
                (Elm.record [ Tuple.pair "slug" routeParams_args.slug ])
    , model =
        \model_args ->
            Elm.withType
                (Type.alias
                    [ "Route", "Services", "Slug_" ]
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
            { importFrom = [ "Route", "Services", "Slug_" ]
            , name = "route"
            , annotation =
                Just
                    (Type.namedWith
                        []
                        "StatelessRoute"
                        [ Type.namedWith [] "RouteParams" []
                        , Type.namedWith [] "Data" []
                        , Type.namedWith [] "ActionData" []
                        ]
                    )
            }
    }


