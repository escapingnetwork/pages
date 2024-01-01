module Gen.Content.Services exposing (allServices, annotation_, call_, make_, moduleName_, serviceFromSlug, values_)

{-| 
@docs values_, call_, make_, annotation_, allServices, serviceFromSlug, moduleName_
-}


import Elm
import Elm.Annotation as Type


{-| The name of this module. -}
moduleName_ : List String
moduleName_ =
    [ "Content", "Services" ]


{-| serviceFromSlug: String -> BackendTask FatalError Service -}
serviceFromSlug : String -> Elm.Expression
serviceFromSlug serviceFromSlugArg =
    Elm.apply
        (Elm.value
            { importFrom = [ "Content", "Services" ]
            , name = "serviceFromSlug"
            , annotation =
                Just
                    (Type.function
                        [ Type.string ]
                        (Type.namedWith
                            []
                            "BackendTask"
                            [ Type.namedWith [] "FatalError" []
                            , Type.namedWith [] "Service" []
                            ]
                        )
                    )
            }
        )
        [ Elm.string serviceFromSlugArg ]


{-| allServices: BackendTask FatalError (List Service) -}
allServices : Elm.Expression
allServices =
    Elm.value
        { importFrom = [ "Content", "Services" ]
        , name = "allServices"
        , annotation =
            Just
                (Type.namedWith
                    []
                    "BackendTask"
                    [ Type.namedWith [] "FatalError" []
                    , Type.list (Type.namedWith [] "Service" [])
                    ]
                )
        }


annotation_ : { metadata : Type.Annotation, service : Type.Annotation }
annotation_ =
    { metadata =
        Type.alias
            moduleName_
            "Metadata"
            []
            (Type.record
                [ ( "title", Type.string )
                , ( "slug", Type.string )
                , ( "image", Type.namedWith [] "Maybe" [ Type.string ] )
                , ( "description", Type.namedWith [] "Maybe" [ Type.string ] )
                ]
            )
    , service =
        Type.alias
            moduleName_
            "Service"
            []
            (Type.record
                [ ( "service", Type.namedWith [] "Metadata" [] )
                , ( "body", Type.string )
                , ( "previousService"
                  , Type.namedWith
                        []
                        "Maybe"
                        [ Type.namedWith [] "Metadata" [] ]
                  )
                , ( "nextService"
                  , Type.namedWith
                        []
                        "Maybe"
                        [ Type.namedWith [] "Metadata" [] ]
                  )
                ]
            )
    }


make_ :
    { metadata :
        { title : Elm.Expression
        , slug : Elm.Expression
        , image : Elm.Expression
        , description : Elm.Expression
        }
        -> Elm.Expression
    , service :
        { service : Elm.Expression
        , body : Elm.Expression
        , previousService : Elm.Expression
        , nextService : Elm.Expression
        }
        -> Elm.Expression
    }
make_ =
    { metadata =
        \metadata_args ->
            Elm.withType
                (Type.alias
                    [ "Content", "Services" ]
                    "Metadata"
                    []
                    (Type.record
                        [ ( "title", Type.string )
                        , ( "slug", Type.string )
                        , ( "image", Type.namedWith [] "Maybe" [ Type.string ] )
                        , ( "description"
                          , Type.namedWith [] "Maybe" [ Type.string ]
                          )
                        ]
                    )
                )
                (Elm.record
                    [ Tuple.pair "title" metadata_args.title
                    , Tuple.pair "slug" metadata_args.slug
                    , Tuple.pair "image" metadata_args.image
                    , Tuple.pair "description" metadata_args.description
                    ]
                )
    , service =
        \service_args ->
            Elm.withType
                (Type.alias
                    [ "Content", "Services" ]
                    "Service"
                    []
                    (Type.record
                        [ ( "service", Type.namedWith [] "Metadata" [] )
                        , ( "body", Type.string )
                        , ( "previousService"
                          , Type.namedWith
                                []
                                "Maybe"
                                [ Type.namedWith [] "Metadata" [] ]
                          )
                        , ( "nextService"
                          , Type.namedWith
                                []
                                "Maybe"
                                [ Type.namedWith [] "Metadata" [] ]
                          )
                        ]
                    )
                )
                (Elm.record
                    [ Tuple.pair "service" service_args.service
                    , Tuple.pair "body" service_args.body
                    , Tuple.pair "previousService" service_args.previousService
                    , Tuple.pair "nextService" service_args.nextService
                    ]
                )
    }


call_ : { serviceFromSlug : Elm.Expression -> Elm.Expression }
call_ =
    { serviceFromSlug =
        \serviceFromSlugArg ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Content", "Services" ]
                    , name = "serviceFromSlug"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.string ]
                                (Type.namedWith
                                    []
                                    "BackendTask"
                                    [ Type.namedWith [] "FatalError" []
                                    , Type.namedWith [] "Service" []
                                    ]
                                )
                            )
                    }
                )
                [ serviceFromSlugArg ]
    }


values_ : { serviceFromSlug : Elm.Expression, allServices : Elm.Expression }
values_ =
    { serviceFromSlug =
        Elm.value
            { importFrom = [ "Content", "Services" ]
            , name = "serviceFromSlug"
            , annotation =
                Just
                    (Type.function
                        [ Type.string ]
                        (Type.namedWith
                            []
                            "BackendTask"
                            [ Type.namedWith [] "FatalError" []
                            , Type.namedWith [] "Service" []
                            ]
                        )
                    )
            }
    , allServices =
        Elm.value
            { importFrom = [ "Content", "Services" ]
            , name = "allServices"
            , annotation =
                Just
                    (Type.namedWith
                        []
                        "BackendTask"
                        [ Type.namedWith [] "FatalError" []
                        , Type.list (Type.namedWith [] "Service" [])
                        ]
                    )
            }
    }


