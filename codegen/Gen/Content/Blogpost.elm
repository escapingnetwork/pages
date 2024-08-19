module Gen.Content.Blogpost exposing (allBlogposts, allTags, annotation_, blogpostFromSlug, call_, caseOf_, make_, moduleName_, values_)

{-| 
@docs moduleName_, blogpostFromSlug, allBlogposts, allTags, annotation_, make_, caseOf_, call_, values_
-}


import Elm
import Elm.Annotation as Type
import Elm.Case


{-| The name of this module. -}
moduleName_ : List String
moduleName_ =
    [ "Content", "Blogpost" ]


{-| blogpostFromSlug: 
    String
    -> BackendTask.BackendTask FatalError.FatalError Content.Blogpost.Blogpost
-}
blogpostFromSlug : String -> Elm.Expression
blogpostFromSlug blogpostFromSlugArg =
    Elm.apply
        (Elm.value
            { importFrom = [ "Content", "Blogpost" ]
            , name = "blogpostFromSlug"
            , annotation =
                Just
                    (Type.function
                        [ Type.string ]
                        (Type.namedWith
                            [ "BackendTask" ]
                            "BackendTask"
                            [ Type.namedWith [ "FatalError" ] "FatalError" []
                            , Type.namedWith
                                [ "Content", "Blogpost" ]
                                "Blogpost"
                                []
                            ]
                        )
                    )
            }
        )
        [ Elm.string blogpostFromSlugArg ]


{-| allBlogposts: BackendTask.BackendTask FatalError.FatalError (List Content.Blogpost.Blogpost) -}
allBlogposts : Elm.Expression
allBlogposts =
    Elm.value
        { importFrom = [ "Content", "Blogpost" ]
        , name = "allBlogposts"
        , annotation =
            Just
                (Type.namedWith
                    [ "BackendTask" ]
                    "BackendTask"
                    [ Type.namedWith [ "FatalError" ] "FatalError" []
                    , Type.list
                        (Type.namedWith [ "Content", "Blogpost" ] "Blogpost" [])
                    ]
                )
        }


{-| allTags: BackendTask.BackendTask FatalError.FatalError (List Content.Blogpost.TagWithCount) -}
allTags : Elm.Expression
allTags =
    Elm.value
        { importFrom = [ "Content", "Blogpost" ]
        , name = "allTags"
        , annotation =
            Just
                (Type.namedWith
                    [ "BackendTask" ]
                    "BackendTask"
                    [ Type.namedWith [ "FatalError" ] "FatalError" []
                    , Type.list
                        (Type.namedWith
                            [ "Content", "Blogpost" ]
                            "TagWithCount"
                            []
                        )
                    ]
                )
        }


annotation_ :
    { tagWithCount : Type.Annotation
    , metadata : Type.Annotation
    , blogpost : Type.Annotation
    , status : Type.Annotation
    }
annotation_ =
    { tagWithCount =
        Type.alias
            moduleName_
            "TagWithCount"
            []
            (Type.record
                [ ( "slug", Type.string )
                , ( "title", Type.string )
                , ( "count", Type.int )
                ]
            )
    , metadata =
        Type.alias
            moduleName_
            "Metadata"
            []
            (Type.record
                [ ( "title", Type.string )
                , ( "slug", Type.string )
                , ( "image", Type.maybe Type.string )
                , ( "description", Type.maybe Type.string )
                , ( "tags", Type.list Type.string )
                , ( "authors"
                  , Type.list
                        (Type.namedWith [ "Content", "About" ] "Author" [])
                  )
                , ( "status"
                  , Type.namedWith [ "Content", "Blogpost" ] "Status" []
                  )
                , ( "readingTimeInMin", Type.int )
                ]
            )
    , blogpost =
        Type.alias
            moduleName_
            "Blogpost"
            []
            (Type.record
                [ ( "metadata"
                  , Type.namedWith [ "Content", "Blogpost" ] "Metadata" []
                  )
                , ( "body", Type.string )
                , ( "previousPost"
                  , Type.maybe
                        (Type.namedWith [ "Content", "Blogpost" ] "Metadata" [])
                  )
                , ( "nextPost"
                  , Type.maybe
                        (Type.namedWith [ "Content", "Blogpost" ] "Metadata" [])
                  )
                ]
            )
    , status = Type.namedWith [ "Content", "Blogpost" ] "Status" []
    }


make_ :
    { tagWithCount :
        { slug : Elm.Expression
        , title : Elm.Expression
        , count : Elm.Expression
        }
        -> Elm.Expression
    , metadata :
        { title : Elm.Expression
        , slug : Elm.Expression
        , image : Elm.Expression
        , description : Elm.Expression
        , tags : Elm.Expression
        , authors : Elm.Expression
        , status : Elm.Expression
        , readingTimeInMin : Elm.Expression
        }
        -> Elm.Expression
    , blogpost :
        { metadata : Elm.Expression
        , body : Elm.Expression
        , previousPost : Elm.Expression
        , nextPost : Elm.Expression
        }
        -> Elm.Expression
    , draft : Elm.Expression
    , published : Elm.Expression
    , publishedWithDate : Elm.Expression -> Elm.Expression
    }
make_ =
    { tagWithCount =
        \tagWithCount_args ->
            Elm.withType
                (Type.alias
                    [ "Content", "Blogpost" ]
                    "TagWithCount"
                    []
                    (Type.record
                        [ ( "slug", Type.string )
                        , ( "title", Type.string )
                        , ( "count", Type.int )
                        ]
                    )
                )
                (Elm.record
                    [ Tuple.pair "slug" tagWithCount_args.slug
                    , Tuple.pair "title" tagWithCount_args.title
                    , Tuple.pair "count" tagWithCount_args.count
                    ]
                )
    , metadata =
        \metadata_args ->
            Elm.withType
                (Type.alias
                    [ "Content", "Blogpost" ]
                    "Metadata"
                    []
                    (Type.record
                        [ ( "title", Type.string )
                        , ( "slug", Type.string )
                        , ( "image", Type.maybe Type.string )
                        , ( "description", Type.maybe Type.string )
                        , ( "tags", Type.list Type.string )
                        , ( "authors"
                          , Type.list
                                (Type.namedWith
                                    [ "Content", "About" ]
                                    "Author"
                                    []
                                )
                          )
                        , ( "status"
                          , Type.namedWith [ "Content", "Blogpost" ] "Status" []
                          )
                        , ( "readingTimeInMin", Type.int )
                        ]
                    )
                )
                (Elm.record
                    [ Tuple.pair "title" metadata_args.title
                    , Tuple.pair "slug" metadata_args.slug
                    , Tuple.pair "image" metadata_args.image
                    , Tuple.pair "description" metadata_args.description
                    , Tuple.pair "tags" metadata_args.tags
                    , Tuple.pair "authors" metadata_args.authors
                    , Tuple.pair "status" metadata_args.status
                    , Tuple.pair
                        "readingTimeInMin"
                        metadata_args.readingTimeInMin
                    ]
                )
    , blogpost =
        \blogpost_args ->
            Elm.withType
                (Type.alias
                    [ "Content", "Blogpost" ]
                    "Blogpost"
                    []
                    (Type.record
                        [ ( "metadata"
                          , Type.namedWith
                                [ "Content", "Blogpost" ]
                                "Metadata"
                                []
                          )
                        , ( "body", Type.string )
                        , ( "previousPost"
                          , Type.maybe
                                (Type.namedWith
                                    [ "Content", "Blogpost" ]
                                    "Metadata"
                                    []
                                )
                          )
                        , ( "nextPost"
                          , Type.maybe
                                (Type.namedWith
                                    [ "Content", "Blogpost" ]
                                    "Metadata"
                                    []
                                )
                          )
                        ]
                    )
                )
                (Elm.record
                    [ Tuple.pair "metadata" blogpost_args.metadata
                    , Tuple.pair "body" blogpost_args.body
                    , Tuple.pair "previousPost" blogpost_args.previousPost
                    , Tuple.pair "nextPost" blogpost_args.nextPost
                    ]
                )
    , draft =
        Elm.value
            { importFrom = [ "Content", "Blogpost" ]
            , name = "Draft"
            , annotation = Just (Type.namedWith [] "Status" [])
            }
    , published =
        Elm.value
            { importFrom = [ "Content", "Blogpost" ]
            , name = "Published"
            , annotation = Just (Type.namedWith [] "Status" [])
            }
    , publishedWithDate =
        \ar0 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Content", "Blogpost" ]
                    , name = "PublishedWithDate"
                    , annotation = Just (Type.namedWith [] "Status" [])
                    }
                )
                [ ar0 ]
    }


caseOf_ :
    { status :
        Elm.Expression
        -> { statusTags_0_0
            | draft : Elm.Expression
            , published : Elm.Expression
            , publishedWithDate : Elm.Expression -> Elm.Expression
        }
        -> Elm.Expression
    }
caseOf_ =
    { status =
        \statusExpression statusTags ->
            Elm.Case.custom
                statusExpression
                (Type.namedWith [ "Content", "Blogpost" ] "Status" [])
                [ Elm.Case.branch0 "Draft" statusTags.draft
                , Elm.Case.branch0 "Published" statusTags.published
                , Elm.Case.branch1
                    "PublishedWithDate"
                    ( "dateDate", Type.namedWith [ "Date" ] "Date" [] )
                    statusTags.publishedWithDate
                ]
    }


call_ : { blogpostFromSlug : Elm.Expression -> Elm.Expression }
call_ =
    { blogpostFromSlug =
        \blogpostFromSlugArg ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Content", "Blogpost" ]
                    , name = "blogpostFromSlug"
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
                                        [ "Content", "Blogpost" ]
                                        "Blogpost"
                                        []
                                    ]
                                )
                            )
                    }
                )
                [ blogpostFromSlugArg ]
    }


values_ :
    { blogpostFromSlug : Elm.Expression
    , allBlogposts : Elm.Expression
    , allTags : Elm.Expression
    }
values_ =
    { blogpostFromSlug =
        Elm.value
            { importFrom = [ "Content", "Blogpost" ]
            , name = "blogpostFromSlug"
            , annotation =
                Just
                    (Type.function
                        [ Type.string ]
                        (Type.namedWith
                            [ "BackendTask" ]
                            "BackendTask"
                            [ Type.namedWith [ "FatalError" ] "FatalError" []
                            , Type.namedWith
                                [ "Content", "Blogpost" ]
                                "Blogpost"
                                []
                            ]
                        )
                    )
            }
    , allBlogposts =
        Elm.value
            { importFrom = [ "Content", "Blogpost" ]
            , name = "allBlogposts"
            , annotation =
                Just
                    (Type.namedWith
                        [ "BackendTask" ]
                        "BackendTask"
                        [ Type.namedWith [ "FatalError" ] "FatalError" []
                        , Type.list
                            (Type.namedWith
                                [ "Content", "Blogpost" ]
                                "Blogpost"
                                []
                            )
                        ]
                    )
            }
    , allTags =
        Elm.value
            { importFrom = [ "Content", "Blogpost" ]
            , name = "allTags"
            , annotation =
                Just
                    (Type.namedWith
                        [ "BackendTask" ]
                        "BackendTask"
                        [ Type.namedWith [ "FatalError" ] "FatalError" []
                        , Type.list
                            (Type.namedWith
                                [ "Content", "Blogpost" ]
                                "TagWithCount"
                                []
                            )
                        ]
                    )
            }
    }