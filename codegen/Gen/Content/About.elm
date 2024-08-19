module Gen.Content.About exposing (allAuthors, annotation_, defaultAuthor, make_, moduleName_, values_)

{-| 
@docs moduleName_, defaultAuthor, allAuthors, annotation_, make_, values_
-}


import Elm
import Elm.Annotation as Type


{-| The name of this module. -}
moduleName_ : List String
moduleName_ =
    [ "Content", "About" ]


{-| defaultAuthor: 
    BackendTask.BackendTask { fatal : FatalError.FatalError
    , recoverable : BackendTask.File.FileReadError Json.Decode.Error
    } Content.About.Author
-}
defaultAuthor : Elm.Expression
defaultAuthor =
    Elm.value
        { importFrom = [ "Content", "About" ]
        , name = "defaultAuthor"
        , annotation =
            Just
                (Type.namedWith
                    [ "BackendTask" ]
                    "BackendTask"
                    [ Type.record
                        [ ( "fatal"
                          , Type.namedWith [ "FatalError" ] "FatalError" []
                          )
                        , ( "recoverable"
                          , Type.namedWith
                                [ "BackendTask", "File" ]
                                "FileReadError"
                                [ Type.namedWith [ "Json", "Decode" ] "Error" []
                                ]
                          )
                        ]
                    , Type.namedWith [ "Content", "About" ] "Author" []
                    ]
                )
        }


{-| allAuthors: BackendTask.BackendTask FatalError.FatalError (Dict.Dict String Content.About.Author) -}
allAuthors : Elm.Expression
allAuthors =
    Elm.value
        { importFrom = [ "Content", "About" ]
        , name = "allAuthors"
        , annotation =
            Just
                (Type.namedWith
                    [ "BackendTask" ]
                    "BackendTask"
                    [ Type.namedWith [ "FatalError" ] "FatalError" []
                    , Type.namedWith
                        [ "Dict" ]
                        "Dict"
                        [ Type.string
                        , Type.namedWith [ "Content", "About" ] "Author" []
                        ]
                    ]
                )
        }


annotation_ : { author : Type.Annotation }
annotation_ =
    { author =
        Type.alias
            moduleName_
            "Author"
            []
            (Type.record
                [ ( "body", Type.string )
                , ( "name", Type.string )
                , ( "avatar", Type.maybe Type.string )
                , ( "socials", Type.list (Type.tuple Type.string Type.string) )
                , ( "occupation", Type.maybe Type.string )
                , ( "company", Type.maybe Type.string )
                , ( "slug", Type.string )
                ]
            )
    }


make_ :
    { author :
        { body : Elm.Expression
        , name : Elm.Expression
        , avatar : Elm.Expression
        , socials : Elm.Expression
        , occupation : Elm.Expression
        , company : Elm.Expression
        , slug : Elm.Expression
        }
        -> Elm.Expression
    }
make_ =
    { author =
        \author_args ->
            Elm.withType
                (Type.alias
                    [ "Content", "About" ]
                    "Author"
                    []
                    (Type.record
                        [ ( "body", Type.string )
                        , ( "name", Type.string )
                        , ( "avatar", Type.maybe Type.string )
                        , ( "socials"
                          , Type.list (Type.tuple Type.string Type.string)
                          )
                        , ( "occupation", Type.maybe Type.string )
                        , ( "company", Type.maybe Type.string )
                        , ( "slug", Type.string )
                        ]
                    )
                )
                (Elm.record
                    [ Tuple.pair "body" author_args.body
                    , Tuple.pair "name" author_args.name
                    , Tuple.pair "avatar" author_args.avatar
                    , Tuple.pair "socials" author_args.socials
                    , Tuple.pair "occupation" author_args.occupation
                    , Tuple.pair "company" author_args.company
                    , Tuple.pair "slug" author_args.slug
                    ]
                )
    }


values_ : { defaultAuthor : Elm.Expression, allAuthors : Elm.Expression }
values_ =
    { defaultAuthor =
        Elm.value
            { importFrom = [ "Content", "About" ]
            , name = "defaultAuthor"
            , annotation =
                Just
                    (Type.namedWith
                        [ "BackendTask" ]
                        "BackendTask"
                        [ Type.record
                            [ ( "fatal"
                              , Type.namedWith [ "FatalError" ] "FatalError" []
                              )
                            , ( "recoverable"
                              , Type.namedWith
                                    [ "BackendTask", "File" ]
                                    "FileReadError"
                                    [ Type.namedWith
                                        [ "Json", "Decode" ]
                                        "Error"
                                        []
                                    ]
                              )
                            ]
                        , Type.namedWith [ "Content", "About" ] "Author" []
                        ]
                    )
            }
    , allAuthors =
        Elm.value
            { importFrom = [ "Content", "About" ]
            , name = "allAuthors"
            , annotation =
                Just
                    (Type.namedWith
                        [ "BackendTask" ]
                        "BackendTask"
                        [ Type.namedWith [ "FatalError" ] "FatalError" []
                        , Type.namedWith
                            [ "Dict" ]
                            "Dict"
                            [ Type.string
                            , Type.namedWith [ "Content", "About" ] "Author" []
                            ]
                        ]
                    )
            }
    }