module Gen.Layout.Tags exposing (call_, moduleName_, values_, view, viewTag)

{-| 
@docs values_, call_, viewTag, view, moduleName_
-}


import Elm
import Elm.Annotation as Type


{-| The name of this module. -}
moduleName_ : List String
moduleName_ =
    [ "Layout", "Tags" ]


{-| view: List TagWithCount -> Html msg -}
view : List Elm.Expression -> Elm.Expression
view viewArg =
    Elm.apply
        (Elm.value
            { importFrom = [ "Layout", "Tags" ]
            , name = "view"
            , annotation =
                Just
                    (Type.function
                        [ Type.list (Type.namedWith [] "TagWithCount" []) ]
                        (Type.namedWith [] "Html" [ Type.var "msg" ])
                    )
            }
        )
        [ Elm.list viewArg ]


{-| viewTag: String -> Html msg -}
viewTag : String -> Elm.Expression
viewTag viewTagArg =
    Elm.apply
        (Elm.value
            { importFrom = [ "Layout", "Tags" ]
            , name = "viewTag"
            , annotation =
                Just
                    (Type.function
                        [ Type.string ]
                        (Type.namedWith [] "Html" [ Type.var "msg" ])
                    )
            }
        )
        [ Elm.string viewTagArg ]


call_ :
    { view : Elm.Expression -> Elm.Expression
    , viewTag : Elm.Expression -> Elm.Expression
    }
call_ =
    { view =
        \viewArg ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Layout", "Tags" ]
                    , name = "view"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.list
                                    (Type.namedWith [] "TagWithCount" [])
                                ]
                                (Type.namedWith [] "Html" [ Type.var "msg" ])
                            )
                    }
                )
                [ viewArg ]
    , viewTag =
        \viewTagArg ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Layout", "Tags" ]
                    , name = "viewTag"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.string ]
                                (Type.namedWith [] "Html" [ Type.var "msg" ])
                            )
                    }
                )
                [ viewTagArg ]
    }


values_ : { view : Elm.Expression, viewTag : Elm.Expression }
values_ =
    { view =
        Elm.value
            { importFrom = [ "Layout", "Tags" ]
            , name = "view"
            , annotation =
                Just
                    (Type.function
                        [ Type.list (Type.namedWith [] "TagWithCount" []) ]
                        (Type.namedWith [] "Html" [ Type.var "msg" ])
                    )
            }
    , viewTag =
        Elm.value
            { importFrom = [ "Layout", "Tags" ]
            , name = "viewTag"
            , annotation =
                Just
                    (Type.function
                        [ Type.string ]
                        (Type.namedWith [] "Html" [ Type.var "msg" ])
                    )
            }
    }


