module Gen.Layout.Service exposing (call_, moduleName_, values_, viewListItem, viewService, viewServiceList)

{-| 
@docs moduleName_, viewServiceList, viewListItem, viewService, call_, values_
-}


import Elm
import Elm.Annotation as Type


{-| The name of this module. -}
moduleName_ : List String
moduleName_ =
    [ "Layout", "Service" ]


{-| viewServiceList: List Content.Services.Metadata -> List (Html.Html msg) -}
viewServiceList : List Elm.Expression -> Elm.Expression
viewServiceList viewServiceListArg =
    Elm.apply
        (Elm.value
            { importFrom = [ "Layout", "Service" ]
            , name = "viewServiceList"
            , annotation =
                Just
                    (Type.function
                        [ Type.list
                            (Type.namedWith
                                [ "Content", "Services" ]
                                "Metadata"
                                []
                            )
                        ]
                        (Type.list
                            (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ]
                            )
                        )
                    )
            }
        )
        [ Elm.list viewServiceListArg ]


{-| viewListItem: Content.Services.Metadata -> Html.Html msg -}
viewListItem : Elm.Expression -> Elm.Expression
viewListItem viewListItemArg =
    Elm.apply
        (Elm.value
            { importFrom = [ "Layout", "Service" ]
            , name = "viewListItem"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith [ "Content", "Services" ] "Metadata" []
                        ]
                        (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ])
                    )
            }
        )
        [ viewListItemArg ]


{-| viewService: Content.Services.Service -> Html.Html msg -}
viewService : Elm.Expression -> Elm.Expression
viewService viewServiceArg =
    Elm.apply
        (Elm.value
            { importFrom = [ "Layout", "Service" ]
            , name = "viewService"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith [ "Content", "Services" ] "Service" []
                        ]
                        (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ])
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
                                [ Type.list
                                    (Type.namedWith
                                        [ "Content", "Services" ]
                                        "Metadata"
                                        []
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
                                [ Type.namedWith
                                    [ "Content", "Services" ]
                                    "Metadata"
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
                                [ Type.namedWith
                                    [ "Content", "Services" ]
                                    "Service"
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
                        [ Type.list
                            (Type.namedWith
                                [ "Content", "Services" ]
                                "Metadata"
                                []
                            )
                        ]
                        (Type.list
                            (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ]
                            )
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
                        [ Type.namedWith [ "Content", "Services" ] "Metadata" []
                        ]
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
                        [ Type.namedWith [ "Content", "Services" ] "Service" []
                        ]
                        (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ])
                    )
            }
    }