module Gen.Layout exposing (call_, moduleName_, seoHeaders, values_, view)

{-| 
@docs moduleName_, view, seoHeaders, call_, values_
-}


import Elm
import Elm.Annotation as Type


{-| The name of this module. -}
moduleName_ : List String
moduleName_ =
    [ "Layout" ]


{-| view: 
    Layout.I18n
    -> Bool
    -> msg
    -> (Layout.Language -> msg)
    -> List (Html.Html msg)
    -> List (Html.Html msg)
-}
view :
    Elm.Expression
    -> Bool
    -> Elm.Expression
    -> (Elm.Expression -> Elm.Expression)
    -> List Elm.Expression
    -> Elm.Expression
view viewArg viewArg0 viewArg1 viewArg2 viewArg3 =
    Elm.apply
        (Elm.value
            { importFrom = [ "Layout" ]
            , name = "view"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith [ "Layout" ] "I18n" []
                        , Type.bool
                        , Type.var "msg"
                        , Type.function
                            [ Type.namedWith [ "Layout" ] "Language" [] ]
                            (Type.var "msg")
                        , Type.list
                            (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ]
                            )
                        ]
                        (Type.list
                            (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ]
                            )
                        )
                    )
            }
        )
        [ viewArg
        , Elm.bool viewArg0
        , viewArg1
        , Elm.functionReduced "viewUnpack" viewArg2
        , Elm.list viewArg3
        ]


{-| seoHeaders: List Head.Tag -}
seoHeaders : Elm.Expression
seoHeaders =
    Elm.value
        { importFrom = [ "Layout" ]
        , name = "seoHeaders"
        , annotation = Just (Type.list (Type.namedWith [ "Head" ] "Tag" []))
        }


call_ :
    { view :
        Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
    }
call_ =
    { view =
        \viewArg viewArg0 viewArg1 viewArg2 viewArg3 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Layout" ]
                    , name = "view"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.namedWith [ "Layout" ] "I18n" []
                                , Type.bool
                                , Type.var "msg"
                                , Type.function
                                    [ Type.namedWith [ "Layout" ] "Language" []
                                    ]
                                    (Type.var "msg")
                                , Type.list
                                    (Type.namedWith
                                        [ "Html" ]
                                        "Html"
                                        [ Type.var "msg" ]
                                    )
                                ]
                                (Type.list
                                    (Type.namedWith
                                        [ "Html" ]
                                        "Html"
                                        [ Type.var "msg" ]
                                    )
                                )
                            )
                    }
                )
                [ viewArg, viewArg0, viewArg1, viewArg2, viewArg3 ]
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
                        [ Type.namedWith [ "Layout" ] "I18n" []
                        , Type.bool
                        , Type.var "msg"
                        , Type.function
                            [ Type.namedWith [ "Layout" ] "Language" [] ]
                            (Type.var "msg")
                        , Type.list
                            (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ]
                            )
                        ]
                        (Type.list
                            (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ]
                            )
                        )
                    )
            }
    , seoHeaders =
        Elm.value
            { importFrom = [ "Layout" ]
            , name = "seoHeaders"
            , annotation = Just (Type.list (Type.namedWith [ "Head" ] "Tag" []))
            }
    }