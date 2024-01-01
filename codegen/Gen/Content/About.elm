module Gen.Content.About exposing (allAuthors, annotation_, defaultAuthor, make_, moduleName_, values_)

{-| 
@docs values_, make_, annotation_, allAuthors, defaultAuthor, moduleName_
-}


import Elm
import Elm.Annotation as Type


{-| The name of this module. -}
moduleName_ : List String
moduleName_ =
    [ "Content", "About" ]


{-| defaultAuthor: 
    BackendTask { fatal : FatalError
    , recoverable : File.FileReadError Decode.Error
    } Author
-}
defaultAuthor : Elm.Expression
defaultAuthor =
    Elm.value
        { importFrom = [ "Content", "About" ]
        , name = "defaultAuthor"
        , annotation =
            Just
                (Type.namedWith
                    []
                    "BackendTask"
                    [ Type.record
                        [ ( "fatal", Type.namedWith [] "FatalError" [] )
                        , ( "recoverable"
                          , Type.namedWith
                                [ "File" ]
                                "FileReadError"
                                [ Type.namedWith [ "Decode" ] "Error" [] ]
                          )
                        ]
                    , Type.namedWith [] "Author" []
                    ]
                )
        }


{-| allAuthors: BackendTask FatalError (Dict String Author) -}
allAuthors : Elm.Expression
allAuthors =
    Elm.value
        { importFrom = [ "Content", "About" ]
        , name = "allAuthors"
        , annotation =
            Just
                (Type.namedWith
                    []
                    "BackendTask"
                    [ Type.namedWith [] "FatalError" []
                    , Type.namedWith
                        []
                        "Dict"
                        [ Type.string, Type.namedWith [] "Author" [] ]
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
                , ( "avatar", Type.namedWith [] "Maybe" [ Type.string ] )
                , ( "socials", Type.list (Type.tuple Type.string Type.string) )
                , ( "occupation", Type.namedWith [] "Maybe" [ Type.string ] )
                , ( "company", Type.namedWith [] "Maybe" [ Type.string ] )
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
                        , ( "avatar"
                          , Type.namedWith [] "Maybe" [ Type.string ]
                          )
                        , ( "socials"
                          , Type.list (Type.tuple Type.string Type.string)
                          )
                        , ( "occupation"
                          , Type.namedWith [] "Maybe" [ Type.string ]
                          )
                        , ( "company"
                          , Type.namedWith [] "Maybe" [ Type.string ]
                          )
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
                        []
                        "BackendTask"
                        [ Type.record
                            [ ( "fatal", Type.namedWith [] "FatalError" [] )
                            , ( "recoverable"
                              , Type.namedWith
                                    [ "File" ]
                                    "FileReadError"
                                    [ Type.namedWith [ "Decode" ] "Error" [] ]
                              )
                            ]
                        , Type.namedWith [] "Author" []
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
                        []
                        "BackendTask"
                        [ Type.namedWith [] "FatalError" []
                        , Type.namedWith
                            []
                            "Dict"
                            [ Type.string, Type.namedWith [] "Author" [] ]
                        ]
                    )
            }
    }


