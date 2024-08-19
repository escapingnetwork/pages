module Gen.Layout.Minimal exposing (call_, moduleName_, seoHeaders, values_, view)

{-| 
@docs moduleName_, view, seoHeaders, call_, values_
-}


import Elm
import Elm.Annotation as Type


{-| The name of this module. -}
moduleName_ : List String
moduleName_ =
    [ "Layout", "Minimal" ]


{-| view: Content.Minimal.Minimal -> Html.Html msg -}
view : Elm.Expression -> Elm.Expression
view viewArg =
    Elm.apply
        (Elm.value
            { importFrom = [ "Layout", "Minimal" ]
            , name = "view"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith [ "Content", "Minimal" ] "Minimal" [] ]
                        (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ])
                    )
            }
        )
        [ viewArg ]


{-| seoHeaders: Content.Minimal.Minimal -> List Head.Tag -}
seoHeaders : Elm.Expression -> Elm.Expression
seoHeaders seoHeadersArg =
    Elm.apply
        (Elm.value
            { importFrom = [ "Layout", "Minimal" ]
            , name = "seoHeaders"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith [ "Content", "Minimal" ] "Minimal" [] ]
                        (Type.list (Type.namedWith [ "Head" ] "Tag" []))
                    )
            }
        )
        [ seoHeadersArg ]


call_ :
    { view : Elm.Expression -> Elm.Expression
    , seoHeaders : Elm.Expression -> Elm.Expression
    }
call_ =
    { view =
        \viewArg ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Layout", "Minimal" ]
                    , name = "view"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.namedWith
                                    [ "Content", "Minimal" ]
                                    "Minimal"
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
                [ viewArg ]
    , seoHeaders =
        \seoHeadersArg ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Layout", "Minimal" ]
                    , name = "seoHeaders"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.namedWith
                                    [ "Content", "Minimal" ]
                                    "Minimal"
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
            { importFrom = [ "Layout", "Minimal" ]
            , name = "view"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith [ "Content", "Minimal" ] "Minimal" [] ]
                        (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ])
                    )
            }
    , seoHeaders =
        Elm.value
            { importFrom = [ "Layout", "Minimal" ]
            , name = "seoHeaders"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith [ "Content", "Minimal" ] "Minimal" [] ]
                        (Type.list (Type.namedWith [ "Head" ] "Tag" []))
                    )
            }
    }