module Gen.Route.Blog exposing (annotation_, make_, moduleName_, route, values_)

{-| 
@docs moduleName_, route, annotation_, make_, values_
-}


import Elm
import Elm.Annotation as Type


{-| The name of this module. -}
moduleName_ : List String
moduleName_ =
    [ "Route", "Blog" ]


{-| route: RouteBuilder.StatelessRoute Route.Blog.RouteParams Route.Blog.Data Route.Blog.ActionData -}
route : Elm.Expression
route =
    Elm.value
        { importFrom = [ "Route", "Blog" ]
        , name = "route"
        , annotation =
            Just
                (Type.namedWith
                    [ "RouteBuilder" ]
                    "StatelessRoute"
                    [ Type.namedWith [ "Route", "Blog" ] "RouteParams" []
                    , Type.namedWith [ "Route", "Blog" ] "Data" []
                    , Type.namedWith [ "Route", "Blog" ] "ActionData" []
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
                [ ( "blogposts"
                  , Type.list
                        (Type.namedWith [ "Content", "Blogpost" ] "Metadata" [])
                  )
                , ( "tags"
                  , Type.list
                        (Type.namedWith
                            [ "Content", "Blogpost" ]
                            "TagWithCount"
                            []
                        )
                  )
                ]
            )
    , routeParams = Type.alias moduleName_ "RouteParams" [] (Type.record [])
    , msg = Type.alias moduleName_ "Msg" [] Type.unit
    , model = Type.alias moduleName_ "Model" [] (Type.record [])
    }


make_ :
    { actionData : actionData -> Elm.Expression
    , data :
        { blogposts : Elm.Expression, tags : Elm.Expression } -> Elm.Expression
    , routeParams : routeParams -> Elm.Expression
    , model : model -> Elm.Expression
    }
make_ =
    { actionData =
        \actionData_args ->
            Elm.withType
                (Type.alias [ "Route", "Blog" ] "ActionData" [] (Type.record [])
                )
                (Elm.record [])
    , data =
        \data_args ->
            Elm.withType
                (Type.alias
                    [ "Route", "Blog" ]
                    "Data"
                    []
                    (Type.record
                        [ ( "blogposts"
                          , Type.list
                                (Type.namedWith
                                    [ "Content", "Blogpost" ]
                                    "Metadata"
                                    []
                                )
                          )
                        , ( "tags"
                          , Type.list
                                (Type.namedWith
                                    [ "Content", "Blogpost" ]
                                    "TagWithCount"
                                    []
                                )
                          )
                        ]
                    )
                )
                (Elm.record
                    [ Tuple.pair "blogposts" data_args.blogposts
                    , Tuple.pair "tags" data_args.tags
                    ]
                )
    , routeParams =
        \routeParams_args ->
            Elm.withType
                (Type.alias
                    [ "Route", "Blog" ]
                    "RouteParams"
                    []
                    (Type.record [])
                )
                (Elm.record [])
    , model =
        \model_args ->
            Elm.withType
                (Type.alias [ "Route", "Blog" ] "Model" [] (Type.record []))
                (Elm.record [])
    }


values_ : { route : Elm.Expression }
values_ =
    { route =
        Elm.value
            { importFrom = [ "Route", "Blog" ]
            , name = "route"
            , annotation =
                Just
                    (Type.namedWith
                        [ "RouteBuilder" ]
                        "StatelessRoute"
                        [ Type.namedWith [ "Route", "Blog" ] "RouteParams" []
                        , Type.namedWith [ "Route", "Blog" ] "Data" []
                        , Type.namedWith [ "Route", "Blog" ] "ActionData" []
                        ]
                    )
            }
    }