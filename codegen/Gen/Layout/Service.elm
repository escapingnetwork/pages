module Gen.Layout.Service exposing (call_, moduleName_, values_, viewListItem, viewService, viewServiceList)

{-| 
@docs values_, call_, viewService, viewListItem, viewServiceList, moduleName_
-}


import Elm
import Elm.Annotation as Type


{-| The name of this module. -}
moduleName_ : List String
moduleName_ =
    [ "Layout", "Service" ]


{-| viewServiceList: List Metadata -> List (Html msg) -}
viewServiceList : List Elm.Expression -> Elm.Expression
viewServiceList viewServiceListArg =
    Elm.apply
        (Elm.value
            { importFrom = [ "Layout", "Service" ]
            , name = "viewServiceList"
            , annotation =
                Just
                    (Type.function
                        [ Type.list (Type.namedWith [] "Metadata" []) ]
                        (Type.list (Type.namedWith [] "Html" [ Type.var "msg" ])
                        )
                    )
            }
        )
        [ Elm.list viewServiceListArg ]


{-| viewListItem: Metadata -> Html.Html msg -}
viewListItem : Elm.Expression -> Elm.Expression
viewListItem viewListItemArg =
    Elm.apply
        (Elm.value
            { importFrom = [ "Layout", "Service" ]
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


{-| viewService: Service -> Html msg -}
viewService : Elm.Expression -> Elm.Expression
viewService viewServiceArg =
    Elm.apply
        (Elm.value
            { importFrom = [ "Layout", "Service" ]
            , name = "viewService"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith [] "Service" [] ]
                        (Type.namedWith [] "Html" [ Type.var "msg" ])
                    )
            }
        )
        [ viewServiceArg ]


call_ :
    { viewServiceList : Elm.Expression -> Elm.Expression
    , viewListItem : Elm.Expression -> Elm.Expression
    , viewService : Elm.Expression -> Elm.Expression
    }
call_ =
    { viewServiceList =
        \viewServiceListArg ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Layout", "Service" ]
                    , name = "viewServiceList"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.list (Type.namedWith [] "Metadata" []) ]
                                (Type.list
                                    (Type.namedWith [] "Html" [ Type.var "msg" ]
                                    )
                                )
                            )
                    }
                )
                [ viewServiceListArg ]
    , viewListItem =
        \viewListItemArg ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Layout", "Service" ]
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
    , viewService =
        \viewServiceArg ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Layout", "Service" ]
                    , name = "viewService"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.namedWith [] "Service" [] ]
                                (Type.namedWith [] "Html" [ Type.var "msg" ])
                            )
                    }
                )
                [ viewServiceArg ]
    }


values_ :
    { viewServiceList : Elm.Expression
    , viewListItem : Elm.Expression
    , viewService : Elm.Expression
    }
values_ =
    { viewServiceList =
        Elm.value
            { importFrom = [ "Layout", "Service" ]
            , name = "viewServiceList"
            , annotation =
                Just
                    (Type.function
                        [ Type.list (Type.namedWith [] "Metadata" []) ]
                        (Type.list (Type.namedWith [] "Html" [ Type.var "msg" ])
                        )
                    )
            }
    , viewListItem =
        Elm.value
            { importFrom = [ "Layout", "Service" ]
            , name = "viewListItem"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith [] "Metadata" [] ]
                        (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ])
                    )
            }
    , viewService =
        Elm.value
            { importFrom = [ "Layout", "Service" ]
            , name = "viewService"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith [] "Service" [] ]
                        (Type.namedWith [] "Html" [ Type.var "msg" ])
                    )
            }
    }


