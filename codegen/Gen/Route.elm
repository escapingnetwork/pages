module Gen.Route exposing (annotation_, baseUrl, baseUrlAsPath, call_, caseOf_, link, make_, moduleName_, redirectTo, routeToPath, segmentsToRoute, toLink, toPath, toString, urlToRoute, values_, withoutBaseUrl)

{-| 
@docs values_, call_, caseOf_, make_, annotation_, segmentsToRoute, urlToRoute, baseUrl, routeToPath, baseUrlAsPath, toPath, toString, redirectTo, toLink, link, withoutBaseUrl, moduleName_
-}


import Elm
import Elm.Annotation as Type
import Elm.Case


{-| The name of this module. -}
moduleName_ : List String
moduleName_ =
    [ "Route" ]


{-| {-| . -}

withoutBaseUrl: String -> String
-}
withoutBaseUrl : String -> Elm.Expression
withoutBaseUrl withoutBaseUrlArg =
    Elm.apply
        (Elm.value
            { importFrom = [ "Route" ]
            , name = "withoutBaseUrl"
            , annotation = Just (Type.function [ Type.string ] Type.string)
            }
        )
        [ Elm.string withoutBaseUrlArg ]


{-| {-| . -}

link: List (Html.Attribute msg) -> List (Html.Html msg) -> Route -> Html.Html msg
-}
link :
    List Elm.Expression
    -> List Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
link linkArg linkArg0 linkArg1 =
    Elm.apply
        (Elm.value
            { importFrom = [ "Route" ]
            , name = "link"
            , annotation =
                Just
                    (Type.function
                        [ Type.list
                            (Type.namedWith
                                [ "Html" ]
                                "Attribute"
                                [ Type.var "msg" ]
                            )
                        , Type.list
                            (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ]
                            )
                        , Type.namedWith [] "Route" []
                        ]
                        (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ])
                    )
            }
        )
        [ Elm.list linkArg, Elm.list linkArg0, linkArg1 ]


{-| {-| . -}

toLink: (List (Html.Attribute msg) -> a) -> Route -> a
-}
toLink : (Elm.Expression -> Elm.Expression) -> Elm.Expression -> Elm.Expression
toLink toLinkArg toLinkArg0 =
    Elm.apply
        (Elm.value
            { importFrom = [ "Route" ]
            , name = "toLink"
            , annotation =
                Just
                    (Type.function
                        [ Type.function
                            [ Type.list
                                (Type.namedWith
                                    [ "Html" ]
                                    "Attribute"
                                    [ Type.var "msg" ]
                                )
                            ]
                            (Type.var "a")
                        , Type.namedWith [] "Route" []
                        ]
                        (Type.var "a")
                    )
            }
        )
        [ Elm.functionReduced "toLinkUnpack" toLinkArg, toLinkArg0 ]


{-| {-| . -}

redirectTo: Route -> Server.Response.Response data error
-}
redirectTo : Elm.Expression -> Elm.Expression
redirectTo redirectToArg =
    Elm.apply
        (Elm.value
            { importFrom = [ "Route" ]
            , name = "redirectTo"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith [] "Route" [] ]
                        (Type.namedWith
                            [ "Server", "Response" ]
                            "Response"
                            [ Type.var "data", Type.var "error" ]
                        )
                    )
            }
        )
        [ redirectToArg ]


{-| {-| . -}

toString: Route -> String
-}
toString : Elm.Expression -> Elm.Expression
toString toStringArg =
    Elm.apply
        (Elm.value
            { importFrom = [ "Route" ]
            , name = "toString"
            , annotation =
                Just
                    (Type.function [ Type.namedWith [] "Route" [] ] Type.string)
            }
        )
        [ toStringArg ]


{-| {-| . -}

toPath: Route -> UrlPath.UrlPath
-}
toPath : Elm.Expression -> Elm.Expression
toPath toPathArg =
    Elm.apply
        (Elm.value
            { importFrom = [ "Route" ]
            , name = "toPath"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith [] "Route" [] ]
                        (Type.namedWith [ "UrlPath" ] "UrlPath" [])
                    )
            }
        )
        [ toPathArg ]


{-| {-| . -}

baseUrlAsPath: List String
-}
baseUrlAsPath : Elm.Expression
baseUrlAsPath =
    Elm.value
        { importFrom = [ "Route" ]
        , name = "baseUrlAsPath"
        , annotation = Just (Type.list Type.string)
        }


{-| {-| . -}

routeToPath: Route -> List String
-}
routeToPath : Elm.Expression -> Elm.Expression
routeToPath routeToPathArg =
    Elm.apply
        (Elm.value
            { importFrom = [ "Route" ]
            , name = "routeToPath"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith [] "Route" [] ]
                        (Type.list Type.string)
                    )
            }
        )
        [ routeToPathArg ]


{-| {-| . -}

baseUrl: String
-}
baseUrl : Elm.Expression
baseUrl =
    Elm.value
        { importFrom = [ "Route" ]
        , name = "baseUrl"
        , annotation = Just Type.string
        }


{-| {-| . -}

urlToRoute: { url | path : String } -> Maybe Route
-}
urlToRoute : { url | path : String } -> Elm.Expression
urlToRoute urlToRouteArg =
    Elm.apply
        (Elm.value
            { importFrom = [ "Route" ]
            , name = "urlToRoute"
            , annotation =
                Just
                    (Type.function
                        [ Type.extensible "url" [ ( "path", Type.string ) ] ]
                        (Type.namedWith
                            []
                            "Maybe"
                            [ Type.namedWith [] "Route" [] ]
                        )
                    )
            }
        )
        [ Elm.record [ Tuple.pair "path" (Elm.string urlToRouteArg.path) ] ]


{-| {-| . -}

segmentsToRoute: List String -> Maybe Route
-}
segmentsToRoute : List String -> Elm.Expression
segmentsToRoute segmentsToRouteArg =
    Elm.apply
        (Elm.value
            { importFrom = [ "Route" ]
            , name = "segmentsToRoute"
            , annotation =
                Just
                    (Type.function
                        [ Type.list Type.string ]
                        (Type.namedWith
                            []
                            "Maybe"
                            [ Type.namedWith [] "Route" [] ]
                        )
                    )
            }
        )
        [ Elm.list (List.map Elm.string segmentsToRouteArg) ]


annotation_ : { route : Type.Annotation }
annotation_ =
    { route = Type.namedWith [ "Route" ] "Route" [] }


make_ :
    { booking__TermsAndConditions : Elm.Expression
    , host__SignUp : Elm.Expression
    , partner__SignUp : Elm.Expression
    , student__SignUp : Elm.Expression
    , blog__Slug_ : Elm.Expression -> Elm.Expression
    , services__Slug_ : Elm.Expression -> Elm.Expression
    , tags__Slug_ : Elm.Expression -> Elm.Expression
    , about : Elm.Expression
    , blog : Elm.Expression
    , privacyPolicy : Elm.Expression
    , support : Elm.Expression
    , tags : Elm.Expression
    , index : Elm.Expression
    }
make_ =
    { booking__TermsAndConditions =
        Elm.value
            { importFrom = [ "Route" ]
            , name = "Booking__TermsAndConditions"
            , annotation = Just (Type.namedWith [] "Route" [])
            }
    , host__SignUp =
        Elm.value
            { importFrom = [ "Route" ]
            , name = "Host__SignUp"
            , annotation = Just (Type.namedWith [] "Route" [])
            }
    , partner__SignUp =
        Elm.value
            { importFrom = [ "Route" ]
            , name = "Partner__SignUp"
            , annotation = Just (Type.namedWith [] "Route" [])
            }
    , student__SignUp =
        Elm.value
            { importFrom = [ "Route" ]
            , name = "Student__SignUp"
            , annotation = Just (Type.namedWith [] "Route" [])
            }
    , blog__Slug_ =
        \ar0 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Route" ]
                    , name = "Blog__Slug_"
                    , annotation = Just (Type.namedWith [] "Route" [])
                    }
                )
                [ ar0 ]
    , services__Slug_ =
        \ar0 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Route" ]
                    , name = "Services__Slug_"
                    , annotation = Just (Type.namedWith [] "Route" [])
                    }
                )
                [ ar0 ]
    , tags__Slug_ =
        \ar0 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Route" ]
                    , name = "Tags__Slug_"
                    , annotation = Just (Type.namedWith [] "Route" [])
                    }
                )
                [ ar0 ]
    , about =
        Elm.value
            { importFrom = [ "Route" ]
            , name = "About"
            , annotation = Just (Type.namedWith [] "Route" [])
            }
    , blog =
        Elm.value
            { importFrom = [ "Route" ]
            , name = "Blog"
            , annotation = Just (Type.namedWith [] "Route" [])
            }
    , privacyPolicy =
        Elm.value
            { importFrom = [ "Route" ]
            , name = "PrivacyPolicy"
            , annotation = Just (Type.namedWith [] "Route" [])
            }
    , support =
        Elm.value
            { importFrom = [ "Route" ]
            , name = "Support"
            , annotation = Just (Type.namedWith [] "Route" [])
            }
    , tags =
        Elm.value
            { importFrom = [ "Route" ]
            , name = "Tags"
            , annotation = Just (Type.namedWith [] "Route" [])
            }
    , index =
        Elm.value
            { importFrom = [ "Route" ]
            , name = "Index"
            , annotation = Just (Type.namedWith [] "Route" [])
            }
    }


caseOf_ :
    { route :
        Elm.Expression
        -> { routeTags_0_0
            | booking__TermsAndConditions : Elm.Expression
            , host__SignUp : Elm.Expression
            , partner__SignUp : Elm.Expression
            , student__SignUp : Elm.Expression
            , blog__Slug_ : Elm.Expression -> Elm.Expression
            , services__Slug_ : Elm.Expression -> Elm.Expression
            , tags__Slug_ : Elm.Expression -> Elm.Expression
            , about : Elm.Expression
            , blog : Elm.Expression
            , privacyPolicy : Elm.Expression
            , support : Elm.Expression
            , tags : Elm.Expression
            , index : Elm.Expression
        }
        -> Elm.Expression
    }
caseOf_ =
    { route =
        \routeExpression routeTags ->
            Elm.Case.custom
                routeExpression
                (Type.namedWith [ "Route" ] "Route" [])
                [ Elm.Case.branch0
                    "Booking__TermsAndConditions"
                    routeTags.booking__TermsAndConditions
                , Elm.Case.branch0 "Host__SignUp" routeTags.host__SignUp
                , Elm.Case.branch0 "Partner__SignUp" routeTags.partner__SignUp
                , Elm.Case.branch0 "Student__SignUp" routeTags.student__SignUp
                , Elm.Case.branch1
                    "Blog__Slug_"
                    ( "one", Type.record [ ( "slug", Type.string ) ] )
                    routeTags.blog__Slug_
                , Elm.Case.branch1
                    "Services__Slug_"
                    ( "one", Type.record [ ( "slug", Type.string ) ] )
                    routeTags.services__Slug_
                , Elm.Case.branch1
                    "Tags__Slug_"
                    ( "one", Type.record [ ( "slug", Type.string ) ] )
                    routeTags.tags__Slug_
                , Elm.Case.branch0 "About" routeTags.about
                , Elm.Case.branch0 "Blog" routeTags.blog
                , Elm.Case.branch0 "PrivacyPolicy" routeTags.privacyPolicy
                , Elm.Case.branch0 "Support" routeTags.support
                , Elm.Case.branch0 "Tags" routeTags.tags
                , Elm.Case.branch0 "Index" routeTags.index
                ]
    }


call_ :
    { withoutBaseUrl : Elm.Expression -> Elm.Expression
    , link :
        Elm.Expression -> Elm.Expression -> Elm.Expression -> Elm.Expression
    , toLink : Elm.Expression -> Elm.Expression -> Elm.Expression
    , redirectTo : Elm.Expression -> Elm.Expression
    , toString : Elm.Expression -> Elm.Expression
    , toPath : Elm.Expression -> Elm.Expression
    , routeToPath : Elm.Expression -> Elm.Expression
    , urlToRoute : Elm.Expression -> Elm.Expression
    , segmentsToRoute : Elm.Expression -> Elm.Expression
    }
call_ =
    { withoutBaseUrl =
        \withoutBaseUrlArg ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Route" ]
                    , name = "withoutBaseUrl"
                    , annotation =
                        Just (Type.function [ Type.string ] Type.string)
                    }
                )
                [ withoutBaseUrlArg ]
    , link =
        \linkArg linkArg0 linkArg1 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Route" ]
                    , name = "link"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.list
                                    (Type.namedWith
                                        [ "Html" ]
                                        "Attribute"
                                        [ Type.var "msg" ]
                                    )
                                , Type.list
                                    (Type.namedWith
                                        [ "Html" ]
                                        "Html"
                                        [ Type.var "msg" ]
                                    )
                                , Type.namedWith [] "Route" []
                                ]
                                (Type.namedWith
                                    [ "Html" ]
                                    "Html"
                                    [ Type.var "msg" ]
                                )
                            )
                    }
                )
                [ linkArg, linkArg0, linkArg1 ]
    , toLink =
        \toLinkArg toLinkArg0 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Route" ]
                    , name = "toLink"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.function
                                    [ Type.list
                                        (Type.namedWith
                                            [ "Html" ]
                                            "Attribute"
                                            [ Type.var "msg" ]
                                        )
                                    ]
                                    (Type.var "a")
                                , Type.namedWith [] "Route" []
                                ]
                                (Type.var "a")
                            )
                    }
                )
                [ toLinkArg, toLinkArg0 ]
    , redirectTo =
        \redirectToArg ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Route" ]
                    , name = "redirectTo"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.namedWith [] "Route" [] ]
                                (Type.namedWith
                                    [ "Server", "Response" ]
                                    "Response"
                                    [ Type.var "data", Type.var "error" ]
                                )
                            )
                    }
                )
                [ redirectToArg ]
    , toString =
        \toStringArg ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Route" ]
                    , name = "toString"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.namedWith [] "Route" [] ]
                                Type.string
                            )
                    }
                )
                [ toStringArg ]
    , toPath =
        \toPathArg ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Route" ]
                    , name = "toPath"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.namedWith [] "Route" [] ]
                                (Type.namedWith [ "UrlPath" ] "UrlPath" [])
                            )
                    }
                )
                [ toPathArg ]
    , routeToPath =
        \routeToPathArg ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Route" ]
                    , name = "routeToPath"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.namedWith [] "Route" [] ]
                                (Type.list Type.string)
                            )
                    }
                )
                [ routeToPathArg ]
    , urlToRoute =
        \urlToRouteArg ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Route" ]
                    , name = "urlToRoute"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.extensible
                                    "url"
                                    [ ( "path", Type.string ) ]
                                ]
                                (Type.namedWith
                                    []
                                    "Maybe"
                                    [ Type.namedWith [] "Route" [] ]
                                )
                            )
                    }
                )
                [ urlToRouteArg ]
    , segmentsToRoute =
        \segmentsToRouteArg ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Route" ]
                    , name = "segmentsToRoute"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.list Type.string ]
                                (Type.namedWith
                                    []
                                    "Maybe"
                                    [ Type.namedWith [] "Route" [] ]
                                )
                            )
                    }
                )
                [ segmentsToRouteArg ]
    }


values_ :
    { withoutBaseUrl : Elm.Expression
    , link : Elm.Expression
    , toLink : Elm.Expression
    , redirectTo : Elm.Expression
    , toString : Elm.Expression
    , toPath : Elm.Expression
    , baseUrlAsPath : Elm.Expression
    , routeToPath : Elm.Expression
    , baseUrl : Elm.Expression
    , urlToRoute : Elm.Expression
    , segmentsToRoute : Elm.Expression
    }
values_ =
    { withoutBaseUrl =
        Elm.value
            { importFrom = [ "Route" ]
            , name = "withoutBaseUrl"
            , annotation = Just (Type.function [ Type.string ] Type.string)
            }
    , link =
        Elm.value
            { importFrom = [ "Route" ]
            , name = "link"
            , annotation =
                Just
                    (Type.function
                        [ Type.list
                            (Type.namedWith
                                [ "Html" ]
                                "Attribute"
                                [ Type.var "msg" ]
                            )
                        , Type.list
                            (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ]
                            )
                        , Type.namedWith [] "Route" []
                        ]
                        (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ])
                    )
            }
    , toLink =
        Elm.value
            { importFrom = [ "Route" ]
            , name = "toLink"
            , annotation =
                Just
                    (Type.function
                        [ Type.function
                            [ Type.list
                                (Type.namedWith
                                    [ "Html" ]
                                    "Attribute"
                                    [ Type.var "msg" ]
                                )
                            ]
                            (Type.var "a")
                        , Type.namedWith [] "Route" []
                        ]
                        (Type.var "a")
                    )
            }
    , redirectTo =
        Elm.value
            { importFrom = [ "Route" ]
            , name = "redirectTo"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith [] "Route" [] ]
                        (Type.namedWith
                            [ "Server", "Response" ]
                            "Response"
                            [ Type.var "data", Type.var "error" ]
                        )
                    )
            }
    , toString =
        Elm.value
            { importFrom = [ "Route" ]
            , name = "toString"
            , annotation =
                Just
                    (Type.function [ Type.namedWith [] "Route" [] ] Type.string)
            }
    , toPath =
        Elm.value
            { importFrom = [ "Route" ]
            , name = "toPath"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith [] "Route" [] ]
                        (Type.namedWith [ "UrlPath" ] "UrlPath" [])
                    )
            }
    , baseUrlAsPath =
        Elm.value
            { importFrom = [ "Route" ]
            , name = "baseUrlAsPath"
            , annotation = Just (Type.list Type.string)
            }
    , routeToPath =
        Elm.value
            { importFrom = [ "Route" ]
            , name = "routeToPath"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith [] "Route" [] ]
                        (Type.list Type.string)
                    )
            }
    , baseUrl =
        Elm.value
            { importFrom = [ "Route" ]
            , name = "baseUrl"
            , annotation = Just Type.string
            }
    , urlToRoute =
        Elm.value
            { importFrom = [ "Route" ]
            , name = "urlToRoute"
            , annotation =
                Just
                    (Type.function
                        [ Type.extensible "url" [ ( "path", Type.string ) ] ]
                        (Type.namedWith
                            []
                            "Maybe"
                            [ Type.namedWith [] "Route" [] ]
                        )
                    )
            }
    , segmentsToRoute =
        Elm.value
            { importFrom = [ "Route" ]
            , name = "segmentsToRoute"
            , annotation =
                Just
                    (Type.function
                        [ Type.list Type.string ]
                        (Type.namedWith
                            []
                            "Maybe"
                            [ Type.namedWith [] "Route" [] ]
                        )
                    )
            }
    }


