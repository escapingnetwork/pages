module Gen.Layout.About exposing (call_, moduleName_, seoHeaders, values_, view)

{-| 
@docs moduleName_, view, seoHeaders, call_, values_
-}


import Elm
import Elm.Annotation as Type


{-| The name of this module. -}
moduleName_ : List String
moduleName_ =
    [ "Layout", "About" ]


{-| view: Layout.About.I18n -> Content.About.Author -> Html.Html msg -}
view : Elm.Expression -> Elm.Expression -> Elm.Expression
view viewArg viewArg0 =
    Elm.apply
        (Elm.value
            { importFrom = [ "Layout", "About" ]
            , name = "view"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith [ "Layout", "About" ] "I18n" []
                        , Type.namedWith [ "Content", "About" ] "Author" []
                        ]
                        (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ])
                    )
            }
        )
        [ viewArg, viewArg0 ]


{-| seoHeaders: Content.About.Author -> List Head.Tag -}
seoHeaders : Elm.Expression -> Elm.Expression
seoHeaders seoHeadersArg =
    Elm.apply
        (Elm.value
            { importFrom = [ "Layout", "About" ]
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
    { view : Elm.Expression -> Elm.Expression -> Elm.Expression
    , seoHeaders : Elm.Expression -> Elm.Expression
    }
call_ =
    { view =
        \viewArg viewArg0 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Layout", "About" ]
                    , name = "view"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.namedWith [ "Layout", "About" ] "I18n" []
                                , Type.namedWith
                                    [ "Content", "About" ]
                                    "Author"
                                    []
                                ]
                                (Type.namedWith
                                    [ "Html" ]
                                    "Html"
                                    [ Type.var "msg" ]
                                )
                            )
                    }
                )
                [ viewArg, viewArg0 ]
    , seoHeaders =
        \seoHeadersArg ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Layout", "About" ]
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


values_ : { view : Elm.Expression, seoHeaders : Elm.Expression }
values_ =
    { view =
        Elm.value
            { importFrom = [ "Layout", "About" ]
            , name = "view"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith [ "Layout", "About" ] "I18n" []
                        , Type.namedWith [ "Content", "About" ] "Author" []
                        ]
                        (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ])
                    )
            }
    , seoHeaders =
        Elm.value
            { importFrom = [ "Layout", "About" ]
            , name = "seoHeaders"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith [ "Content", "About" ] "Author" [] ]
                        (Type.list (Type.namedWith [ "Head" ] "Tag" []))
                    )
            }
    }