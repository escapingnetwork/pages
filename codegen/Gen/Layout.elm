module Gen.Layout exposing (call_, moduleName_, seoHeaders, values_, view)

{-| 
@docs values_, call_, seoHeaders, view, moduleName_
-}


import Elm
import Elm.Annotation as Type


{-| The name of this module. -}
moduleName_ : List String
moduleName_ =
    [ "Layout" ]


{-| view: Bool -> msg -> List (Html msg) -> List (Html msg) -}
view : Bool -> Elm.Expression -> List Elm.Expression -> Elm.Expression
view viewArg viewArg0 viewArg1 =
    Elm.apply
        (Elm.value
            { importFrom = [ "Layout" ]
            , name = "view"
            , annotation =
                Just
                    (Type.function
                        [ Type.bool
                        , Type.var "msg"
                        , Type.list
                            (Type.namedWith [] "Html" [ Type.var "msg" ])
                        ]
                        (Type.list (Type.namedWith [] "Html" [ Type.var "msg" ])
                        )
                    )
            }
        )
        [ Elm.bool viewArg, viewArg0, Elm.list viewArg1 ]


{-| seoHeaders: List Tag -}
seoHeaders : Elm.Expression
seoHeaders =
    Elm.value
        { importFrom = [ "Layout" ]
        , name = "seoHeaders"
        , annotation = Just (Type.list (Type.namedWith [] "Tag" []))
        }


call_ :
    { view :
        Elm.Expression -> Elm.Expression -> Elm.Expression -> Elm.Expression
    }
call_ =
    { view =
        \viewArg viewArg0 viewArg1 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Layout" ]
                    , name = "view"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.bool
                                , Type.var "msg"
                                , Type.list
                                    (Type.namedWith [] "Html" [ Type.var "msg" ]
                                    )
                                ]
                                (Type.list
                                    (Type.namedWith [] "Html" [ Type.var "msg" ]
                                    )
                                )
                            )
                    }
                )
                [ viewArg, viewArg0, viewArg1 ]
    }


values_ : { view : Elm.Expression, seoHeaders : Elm.Expression }
values_ =
    { view =
        Elm.value
            { importFrom = [ "Layout" ]
            , name = "view"
            , annotation =
                Just
                    (Type.function
                        [ Type.bool
                        , Type.var "msg"
                        , Type.list
                            (Type.namedWith [] "Html" [ Type.var "msg" ])
                        ]
                        (Type.list (Type.namedWith [] "Html" [ Type.var "msg" ])
                        )
                    )
            }
    , seoHeaders =
        Elm.value
            { importFrom = [ "Layout" ]
            , name = "seoHeaders"
            , annotation = Just (Type.list (Type.namedWith [] "Tag" []))
            }
    }


