module Gen.Layout.Home exposing (call_, moduleName_, seoHeaders, socialsView, values_, view)

{-| 
@docs moduleName_, view, socialsView, seoHeaders, call_, values_
-}


import Elm
import Elm.Annotation as Type


{-| The name of this module. -}
moduleName_ : List String
moduleName_ =
    [ "Layout", "Home" ]


{-| view: Layout.Home.I18n -> Html.Html msg -}
view : Elm.Expression -> Elm.Expression
view viewArg =
    Elm.apply
        (Elm.value
            { importFrom = [ "Layout", "Home" ]
            , name = "view"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith [ "Layout", "Home" ] "I18n" [] ]
                        (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ])
                    )
            }
        )
        [ viewArg ]


{-| socialsView: List ( String, String ) -> Html.Html msg -}
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
                        (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ])
                    )
            }
        )
        [ Elm.list socialsViewArg ]


{-| seoHeaders: Content.About.Author -> List Head.Tag -}
seoHeaders : Elm.Expression -> Elm.Expression
seoHeaders seoHeadersArg =
    Elm.apply
        (Elm.value
            { importFrom = [ "Layout", "Home" ]
            , name = "seoHeaders"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith [ "Content", "About" ] "Author" [] ]
                        (Type.list (Type.namedWith [ "Head" ] "Tag" []))
                    )
            }
        )
        [ seoHeadersArg ]


call_ :
    { view : Elm.Expression -> Elm.Expression
    , socialsView : Elm.Expression -> Elm.Expression
    , seoHeaders : Elm.Expression -> Elm.Expression
    }
call_ =
    { view =
        \viewArg ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Layout", "Home" ]
                    , name = "view"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.namedWith [ "Layout", "Home" ] "I18n" []
                                ]
                                (Type.namedWith
                                    [ "Html" ]
                                    "Html"
                                    [ Type.var "msg" ]
                                )
                            )
                    }
                )
                [ viewArg ]
    , socialsView =
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
                                (Type.namedWith
                                    [ "Html" ]
                                    "Html"
                                    [ Type.var "msg" ]
                                )
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
                                [ Type.namedWith
                                    [ "Content", "About" ]
                                    "Author"
                                    []
                                ]
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
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith [ "Layout", "Home" ] "I18n" [] ]
                        (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ])
                    )
            }
    , socialsView =
        Elm.value
            { importFrom = [ "Layout", "Home" ]
            , name = "socialsView"
            , annotation =
                Just
                    (Type.function
                        [ Type.list (Type.tuple Type.string Type.string) ]
                        (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ])
                    )
            }
    , seoHeaders =
        Elm.value
            { importFrom = [ "Layout", "Home" ]
            , name = "seoHeaders"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith [ "Content", "About" ] "Author" [] ]
                        (Type.list (Type.namedWith [ "Head" ] "Tag" []))
                    )
            }
    }