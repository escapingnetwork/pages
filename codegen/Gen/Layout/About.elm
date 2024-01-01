module Gen.Layout.About exposing (call_, moduleName_, seoHeaders, values_, view)

{-| 
@docs values_, call_, seoHeaders, view, moduleName_
-}


import Elm
import Elm.Annotation as Type


{-| The name of this module. -}
moduleName_ : List String
moduleName_ =
    [ "Layout", "About" ]


{-| view: Author -> Html msg -}
view : Elm.Expression -> Elm.Expression
view viewArg =
    Elm.apply
        (Elm.value
            { importFrom = [ "Layout", "About" ]
            , name = "view"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith [] "Author" [] ]
                        (Type.namedWith [] "Html" [ Type.var "msg" ])
                    )
            }
        )
        [ viewArg ]


{-| seoHeaders: Author -> List Head.Tag -}
seoHeaders : Elm.Expression -> Elm.Expression
seoHeaders seoHeadersArg =
    Elm.apply
        (Elm.value
            { importFrom = [ "Layout", "About" ]
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
    { view : Elm.Expression -> Elm.Expression
    , seoHeaders : Elm.Expression -> Elm.Expression
    }
call_ =
    { view =
        \viewArg ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Layout", "About" ]
                    , name = "view"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.namedWith [] "Author" [] ]
                                (Type.namedWith [] "Html" [ Type.var "msg" ])
                            )
                    }
                )
                [ viewArg ]
    , seoHeaders =
        \seoHeadersArg ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Layout", "About" ]
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


values_ : { view : Elm.Expression, seoHeaders : Elm.Expression }
values_ =
    { view =
        Elm.value
            { importFrom = [ "Layout", "About" ]
            , name = "view"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith [] "Author" [] ]
                        (Type.namedWith [] "Html" [ Type.var "msg" ])
                    )
            }
    , seoHeaders =
        Elm.value
            { importFrom = [ "Layout", "About" ]
            , name = "seoHeaders"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith [] "Author" [] ]
                        (Type.list (Type.namedWith [ "Head" ] "Tag" []))
                    )
            }
    }


