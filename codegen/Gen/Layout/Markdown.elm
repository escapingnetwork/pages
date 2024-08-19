module Gen.Layout.Markdown exposing (blogpostToHtml, call_, moduleName_, toHtml, values_)

{-| 
@docs moduleName_, toHtml, blogpostToHtml, call_, values_
-}


import Elm
import Elm.Annotation as Type


{-| The name of this module. -}
moduleName_ : List String
moduleName_ =
    [ "Layout", "Markdown" ]


{-| toHtml: String -> List (Html.Html msg) -}
toHtml : String -> Elm.Expression
toHtml toHtmlArg =
    Elm.apply
        (Elm.value
            { importFrom = [ "Layout", "Markdown" ]
            , name = "toHtml"
            , annotation =
                Just
                    (Type.function
                        [ Type.string ]
                        (Type.list
                            (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ]
                            )
                        )
                    )
            }
        )
        [ Elm.string toHtmlArg ]


{-| blogpostToHtml: String -> List (Html.Html msg) -}
blogpostToHtml : String -> Elm.Expression
blogpostToHtml blogpostToHtmlArg =
    Elm.apply
        (Elm.value
            { importFrom = [ "Layout", "Markdown" ]
            , name = "blogpostToHtml"
            , annotation =
                Just
                    (Type.function
                        [ Type.string ]
                        (Type.list
                            (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ]
                            )
                        )
                    )
            }
        )
        [ Elm.string blogpostToHtmlArg ]


call_ :
    { toHtml : Elm.Expression -> Elm.Expression
    , blogpostToHtml : Elm.Expression -> Elm.Expression
    }
call_ =
    { toHtml =
        \toHtmlArg ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Layout", "Markdown" ]
                    , name = "toHtml"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.string ]
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
                [ toHtmlArg ]
    , blogpostToHtml =
        \blogpostToHtmlArg ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Layout", "Markdown" ]
                    , name = "blogpostToHtml"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.string ]
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
                [ blogpostToHtmlArg ]
    }


values_ : { toHtml : Elm.Expression, blogpostToHtml : Elm.Expression }
values_ =
    { toHtml =
        Elm.value
            { importFrom = [ "Layout", "Markdown" ]
            , name = "toHtml"
            , annotation =
                Just
                    (Type.function
                        [ Type.string ]
                        (Type.list
                            (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ]
                            )
                        )
                    )
            }
    , blogpostToHtml =
        Elm.value
            { importFrom = [ "Layout", "Markdown" ]
            , name = "blogpostToHtml"
            , annotation =
                Just
                    (Type.function
                        [ Type.string ]
                        (Type.list
                            (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ]
                            )
                        )
                    )
            }
    }