module Gen.Layout.Blogpost exposing (call_, moduleName_, values_, viewBlogpost, viewListItem, viewPostList)

{-| 
@docs values_, call_, viewBlogpost, viewListItem, viewPostList, moduleName_
-}


import Elm
import Elm.Annotation as Type


{-| The name of this module. -}
moduleName_ : List String
moduleName_ =
    [ "Layout", "Blogpost" ]


{-| viewPostList: List TagWithCount -> List Metadata -> Maybe TagWithCount -> List (Html msg) -}
viewPostList :
    List Elm.Expression
    -> List Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
viewPostList viewPostListArg viewPostListArg0 viewPostListArg1 =
    Elm.apply
        (Elm.value
            { importFrom = [ "Layout", "Blogpost" ]
            , name = "viewPostList"
            , annotation =
                Just
                    (Type.function
                        [ Type.list (Type.namedWith [] "TagWithCount" [])
                        , Type.list (Type.namedWith [] "Metadata" [])
                        , Type.namedWith
                            []
                            "Maybe"
                            [ Type.namedWith [] "TagWithCount" [] ]
                        ]
                        (Type.list (Type.namedWith [] "Html" [ Type.var "msg" ])
                        )
                    )
            }
        )
        [ Elm.list viewPostListArg
        , Elm.list viewPostListArg0
        , viewPostListArg1
        ]


{-| viewListItem: Metadata -> Html.Html msg -}
viewListItem : Elm.Expression -> Elm.Expression
viewListItem viewListItemArg =
    Elm.apply
        (Elm.value
            { importFrom = [ "Layout", "Blogpost" ]
            , name = "viewListItem"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith [] "Metadata" [] ]
                        (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ])
                    )
            }
        )
        [ viewListItemArg ]


{-| viewBlogpost: Blogpost -> Html msg -}
viewBlogpost : Elm.Expression -> Elm.Expression
viewBlogpost viewBlogpostArg =
    Elm.apply
        (Elm.value
            { importFrom = [ "Layout", "Blogpost" ]
            , name = "viewBlogpost"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith [] "Blogpost" [] ]
                        (Type.namedWith [] "Html" [ Type.var "msg" ])
                    )
            }
        )
        [ viewBlogpostArg ]


call_ :
    { viewPostList :
        Elm.Expression -> Elm.Expression -> Elm.Expression -> Elm.Expression
    , viewListItem : Elm.Expression -> Elm.Expression
    , viewBlogpost : Elm.Expression -> Elm.Expression
    }
call_ =
    { viewPostList =
        \viewPostListArg viewPostListArg0 viewPostListArg1 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Layout", "Blogpost" ]
                    , name = "viewPostList"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.list
                                    (Type.namedWith [] "TagWithCount" [])
                                , Type.list (Type.namedWith [] "Metadata" [])
                                , Type.namedWith
                                    []
                                    "Maybe"
                                    [ Type.namedWith [] "TagWithCount" [] ]
                                ]
                                (Type.list
                                    (Type.namedWith [] "Html" [ Type.var "msg" ]
                                    )
                                )
                            )
                    }
                )
                [ viewPostListArg, viewPostListArg0, viewPostListArg1 ]
    , viewListItem =
        \viewListItemArg ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Layout", "Blogpost" ]
                    , name = "viewListItem"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.namedWith [] "Metadata" [] ]
                                (Type.namedWith
                                    [ "Html" ]
                                    "Html"
                                    [ Type.var "msg" ]
                                )
                            )
                    }
                )
                [ viewListItemArg ]
    , viewBlogpost =
        \viewBlogpostArg ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Layout", "Blogpost" ]
                    , name = "viewBlogpost"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.namedWith [] "Blogpost" [] ]
                                (Type.namedWith [] "Html" [ Type.var "msg" ])
                            )
                    }
                )
                [ viewBlogpostArg ]
    }


values_ :
    { viewPostList : Elm.Expression
    , viewListItem : Elm.Expression
    , viewBlogpost : Elm.Expression
    }
values_ =
    { viewPostList =
        Elm.value
            { importFrom = [ "Layout", "Blogpost" ]
            , name = "viewPostList"
            , annotation =
                Just
                    (Type.function
                        [ Type.list (Type.namedWith [] "TagWithCount" [])
                        , Type.list (Type.namedWith [] "Metadata" [])
                        , Type.namedWith
                            []
                            "Maybe"
                            [ Type.namedWith [] "TagWithCount" [] ]
                        ]
                        (Type.list (Type.namedWith [] "Html" [ Type.var "msg" ])
                        )
                    )
            }
    , viewListItem =
        Elm.value
            { importFrom = [ "Layout", "Blogpost" ]
            , name = "viewListItem"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith [] "Metadata" [] ]
                        (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ])
                    )
            }
    , viewBlogpost =
        Elm.value
            { importFrom = [ "Layout", "Blogpost" ]
            , name = "viewBlogpost"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith [] "Blogpost" [] ]
                        (Type.namedWith [] "Html" [ Type.var "msg" ])
                    )
            }
    }


