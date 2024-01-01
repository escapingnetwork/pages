module Gen.Layout.Home exposing (call_, moduleName_, seoHeaders, socialsView, values_, view)

{-| 
@docs values_, call_, seoHeaders, socialsView, view, moduleName_
-}


import Elm
import Elm.Annotation as Type


{-| The name of this module. -}
moduleName_ : List String
moduleName_ =
    [ "Layout", "Home" ]


{-| view: Html msg -}
view : Elm.Expression
view =
    Elm.value
        { importFrom = [ "Layout", "Home" ]
        , name = "view"
        , annotation = Just (Type.namedWith [] "Html" [ Type.var "msg" ])
        }


{-| socialsView: List ( String, String ) -> Html msg -}
socialsView : List Elm.Expression -> Elm.Expression
socialsView socialsViewArg =
    Elm.apply
        (Elm.value
            { importFrom = [ "Layout", "Home" ]
            , name = "socialsView"
            , annotation =
                Just
                    (Type.function
                        [ Type.list (Type.tuple Type.string Type.string) ]
                        (Type.namedWith [] "Html" [ Type.var "msg" ])
                    )
            }
        )
        [ Elm.list socialsViewArg ]


{-| seoHeaders: Author -> List Head.Tag -}
seoHeaders : Elm.Expression -> Elm.Expression
seoHeaders seoHeadersArg =
    Elm.apply
        (Elm.value
            { importFrom = [ "Layout", "Home" ]
            , name = "seoHeaders"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith [] "Author" [] ]
                        (Type.list (Type.namedWith [ "Head" ] "Tag" []))
                    )
            }
        )
        [ seoHeadersArg ]


call_ :
    { socialsView : Elm.Expression -> Elm.Expression
    , seoHeaders : Elm.Expression -> Elm.Expression
    }
call_ =
    { socialsView =
        \socialsViewArg ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Layout", "Home" ]
                    , name = "socialsView"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.list (Type.tuple Type.string Type.string)
                                ]
                                (Type.namedWith [] "Html" [ Type.var "msg" ])
                            )
                    }
                )
                [ socialsViewArg ]
    , seoHeaders =
        \seoHeadersArg ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Layout", "Home" ]
                    , name = "seoHeaders"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.namedWith [] "Author" [] ]
                                (Type.list (Type.namedWith [ "Head" ] "Tag" []))
                            )
                    }
                )
                [ seoHeadersArg ]
    }


values_ :
    { view : Elm.Expression
    , socialsView : Elm.Expression
    , seoHeaders : Elm.Expression
    }
values_ =
    { view =
        Elm.value
            { importFrom = [ "Layout", "Home" ]
            , name = "view"
            , annotation = Just (Type.namedWith [] "Html" [ Type.var "msg" ])
            }
    , socialsView =
        Elm.value
            { importFrom = [ "Layout", "Home" ]
            , name = "socialsView"
            , annotation =
                Just
                    (Type.function
                        [ Type.list (Type.tuple Type.string Type.string) ]
                        (Type.namedWith [] "Html" [ Type.var "msg" ])
                    )
            }
    , seoHeaders =
        Elm.value
            { importFrom = [ "Layout", "Home" ]
            , name = "seoHeaders"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith [] "Author" [] ]
                        (Type.list (Type.namedWith [ "Head" ] "Tag" []))
                    )
            }
    }


