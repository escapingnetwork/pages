module Gen.Content.Services exposing (allServices, annotation_, call_, make_, moduleName_, serviceFromSlug, values_)

{-| 
@docs moduleName_, serviceFromSlug, allServices, annotation_, make_, call_, values_
-}


import Elm
import Elm.Annotation as Type


{-| The name of this module. -}
moduleName_ : List String
moduleName_ =
    [ "Content", "Services" ]


{-| serviceFromSlug: String -> BackendTask.BackendTask FatalError.FatalError Content.Services.Service -}
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
                            [ "BackendTask" ]
                            "BackendTask"
                            [ Type.namedWith [ "FatalError" ] "FatalError" []
                            , Type.namedWith
                                [ "Content", "Services" ]
                                "Service"
                                []
                            ]
                        )
                    )
            }
        )
        [ Elm.string serviceFromSlugArg ]


{-| allServices: BackendTask.BackendTask FatalError.FatalError (List Content.Services.Service) -}
allServices : Elm.Expression
allServices =
    Elm.value
        { importFrom = [ "Content", "Services" ]
        , name = "allServices"
        , annotation =
            Just
                (Type.namedWith
                    [ "BackendTask" ]
                    "BackendTask"
                    [ Type.namedWith [ "FatalError" ] "FatalError" []
                    , Type.list
                        (Type.namedWith [ "Content", "Services" ] "Service" [])
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
                , ( "image", Type.maybe Type.string )
                , ( "description", Type.maybe Type.string )
                ]
            )
    , service =
        Type.alias
            moduleName_
            "Service"
            []
            (Type.record
                [ ( "service"
                  , Type.namedWith [ "Content", "Services" ] "Metadata" []
                  )
                , ( "body", Type.string )
                , ( "previousService"
                  , Type.maybe
                        (Type.namedWith [ "Content", "Services" ] "Metadata" [])
                  )
                , ( "nextService"
                  , Type.maybe
                        (Type.namedWith [ "Content", "Services" ] "Metadata" [])
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
                        , ( "image", Type.maybe Type.string )
                        , ( "description", Type.maybe Type.string )
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
                        [ ( "service"
                          , Type.namedWith
                                [ "Content", "Services" ]
                                "Metadata"
                                []
                          )
                        , ( "body", Type.string )
                        , ( "previousService"
                          , Type.maybe
                                (Type.namedWith
                                    [ "Content", "Services" ]
                                    "Metadata"
                                    []
                                )
                          )
                        , ( "nextService"
                          , Type.maybe
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
                                    [ "BackendTask" ]
                                    "BackendTask"
                                    [ Type.namedWith
                                        [ "FatalError" ]
                                        "FatalError"
                                        []
                                    , Type.namedWith
                                        [ "Content", "Services" ]
                                        "Service"
                                        []
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
                            [ "BackendTask" ]
                            "BackendTask"
                            [ Type.namedWith [ "FatalError" ] "FatalError" []
                            , Type.namedWith
                                [ "Content", "Services" ]
                                "Service"
                                []
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
                        [ "BackendTask" ]
                        "BackendTask"
                        [ Type.namedWith [ "FatalError" ] "FatalError" []
                        , Type.list
                            (Type.namedWith
                                [ "Content", "Services" ]
                                "Service"
                                []
                            )
                        ]
                    )
            }
    }