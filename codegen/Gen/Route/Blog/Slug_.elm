module Gen.Route.Blog.Slug_ exposing (annotation_, make_, moduleName_, route, values_)

{-| 
@docs moduleName_, route, annotation_, make_, values_
-}


import Elm
import Elm.Annotation as Type


{-| The name of this module. -}
moduleName_ : List String
moduleName_ =
    [ "Route", "Blog", "Slug_" ]


{-| route: RouteBuilder.StatelessRoute Route.Blog.Slug_.RouteParams Route.Blog.Slug_.Data Route.Blog.Slug_.ActionData -}
route : Elm.Expression
route =
    Elm.value
        { importFrom = [ "Route", "Blog", "Slug_" ]
        , name = "route"
        , annotation =
            Just
                (Type.namedWith
                    [ "RouteBuilder" ]
                    "StatelessRoute"
                    [ Type.namedWith
                        [ "Route", "Blog", "Slug_" ]
                        "RouteParams"
                        []
                    , Type.namedWith [ "Route", "Blog", "Slug_" ] "Data" []
                    , Type.namedWith
                        [ "Route", "Blog", "Slug_" ]
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
                [ ( "blogpost"
                  , Type.namedWith [ "Content", "Blogpost" ] "Blogpost" []
                  )
                ]
            )
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
    , data : { blogpost : Elm.Expression } -> Elm.Expression
    , routeParams : { slug : Elm.Expression } -> Elm.Expression
    , model : model -> Elm.Expression
    }
make_ =
    { actionData =
        \actionData_args ->
            Elm.withType
                (Type.alias
                    [ "Route", "Blog", "Slug_" ]
                    "ActionData"
                    []
                    (Type.record [])
                )
                (Elm.record [])
    , data =
        \data_args ->
            Elm.withType
                (Type.alias
                    [ "Route", "Blog", "Slug_" ]
                    "Data"
                    []
                    (Type.record
                        [ ( "blogpost"
                          , Type.namedWith
                                [ "Content", "Blogpost" ]
                                "Blogpost"
                                []
                          )
                        ]
                    )
                )
                (Elm.record [ Tuple.pair "blogpost" data_args.blogpost ])
    , routeParams =
        \routeParams_args ->
            Elm.withType
                (Type.alias
                    [ "Route", "Blog", "Slug_" ]
                    "RouteParams"
                    []
                    (Type.record [ ( "slug", Type.string ) ])
                )
                (Elm.record [ Tuple.pair "slug" routeParams_args.slug ])
    , model =
        \model_args ->
            Elm.withType
                (Type.alias
                    [ "Route", "Blog", "Slug_" ]
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
            { importFrom = [ "Route", "Blog", "Slug_" ]
            , name = "route"
            , annotation =
                Just
                    (Type.namedWith
                        [ "RouteBuilder" ]
                        "StatelessRoute"
                        [ Type.namedWith
                            [ "Route", "Blog", "Slug_" ]
                            "RouteParams"
                            []
                        , Type.namedWith [ "Route", "Blog", "Slug_" ] "Data" []
                        , Type.namedWith
                            [ "Route", "Blog", "Slug_" ]
                            "ActionData"
                            []
                        ]
                    )
            }
    }