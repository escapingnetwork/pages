module Gen.Route exposing (annotation_, baseUrl, baseUrlAsPath, call_, caseOf_, link, make_, moduleName_, redirectTo, routeToPath, segmentsToRoute, toLink, toPath, toString, urlToRoute, values_, withoutBaseUrl)

{-| 
@docs moduleName_, withoutBaseUrl, link, toLink, redirectTo, toString, toPath, baseUrlAsPath, routeToPath, baseUrl, urlToRoute, segmentsToRoute, annotation_, make_, caseOf_, call_, values_
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

link: 
    List (Html.Attribute msg)
    -> List (Html.Html msg)
    -> Route.Route
    -> Html.Html msg
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
                        , Type.namedWith [ "Route" ] "Route" []
                        ]
                        (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ])
                    )
            }
        )
        [ Elm.list linkArg, Elm.list linkArg0, linkArg1 ]


{-| {-| . -}

toLink: (List (Html.Attribute msg) -> abc) -> Route.Route -> abc
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
                            (Type.var "abc")
                        , Type.namedWith [ "Route" ] "Route" []
                        ]
                        (Type.var "abc")
                    )
            }
        )
        [ Elm.functionReduced "toLinkUnpack" toLinkArg, toLinkArg0 ]


{-| {-| . -}

redirectTo: Route.Route -> Server.Response.Response data error
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
                        [ Type.namedWith [ "Route" ] "Route" [] ]
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

toString: Route.Route -> String
-}
toString : Elm.Expression -> Elm.Expression
toString toStringArg =
    Elm.apply
        (Elm.value
            { importFrom = [ "Route" ]
            , name = "toString"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith [ "Route" ] "Route" [] ]
                        Type.string
                    )
            }
        )
        [ toStringArg ]


{-| {-| . -}

toPath: Route.Route -> UrlPath.UrlPath
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
                        [ Type.namedWith [ "Route" ] "Route" [] ]
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

routeToPath: Route.Route -> List String
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
                        [ Type.namedWith [ "Route" ] "Route" [] ]
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

urlToRoute: { url | path : String } -> Maybe Route.Route
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
                        (Type.maybe (Type.namedWith [ "Route" ] "Route" []))
                    )
            }
        )
        [ Elm.record [ Tuple.pair "path" (Elm.string urlToRouteArg.path) ] ]


{-| {-| . -}

segmentsToRoute: List String -> Maybe Route.Route
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
                        (Type.maybe (Type.namedWith [ "Route" ] "Route" []))
                    )
            }
        )
        [ Elm.list (List.map Elm.string segmentsToRouteArg) ]


annotation_ : { route : Type.Annotation }
annotation_ =
    { route = Type.namedWith [ "Route" ] "Route" [] }


make_ :
    { booking__TermsAndConditions : Elm.Expression
    , host__CompleteRegistration : Elm.Expression
    , host__CompleteRegistrationNew : Elm.Expression
    , host__FullRegistration : Elm.Expression
    , host__FullRegistrationNew : Elm.Expression
    , host__SignUp : Elm.Expression
    , host__SignUpOld : Elm.Expression
    , partner__SignUp : Elm.Expression
    , student__SignUp : Elm.Expression
    , student__SignUpOld : Elm.Expression
    , blog__Slug_ : Elm.Expression -> Elm.Expression
    , host__SignUp_ : Elm.Expression -> Elm.Expression
    , services__Slug_ : Elm.Expression -> Elm.Expression
    , student__SignUp_ : Elm.Expression -> Elm.Expression
    , support__Support_ : Elm.Expression -> Elm.Expression
    , tags__Slug_ : Elm.Expression -> Elm.Expression
    , about : Elm.Expression
    , blog : Elm.Expression
    , privacyPolicy : Elm.Expression
    , services : Elm.Expression
    , support : Elm.Expression
    , supportOld : Elm.Expression
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
    , host__CompleteRegistration =
        Elm.value
            { importFrom = [ "Route" ]
            , name = "Host__CompleteRegistration"
            , annotation = Just (Type.namedWith [] "Route" [])
            }
    , host__CompleteRegistrationNew =
        Elm.value
            { importFrom = [ "Route" ]
            , name = "Host__CompleteRegistrationNew"
            , annotation = Just (Type.namedWith [] "Route" [])
            }
    , host__FullRegistration =
        Elm.value
            { importFrom = [ "Route" ]
            , name = "Host__FullRegistration"
            , annotation = Just (Type.namedWith [] "Route" [])
            }
    , host__FullRegistrationNew =
        Elm.value
            { importFrom = [ "Route" ]
            , name = "Host__FullRegistrationNew"
            , annotation = Just (Type.namedWith [] "Route" [])
            }
    , host__SignUp =
        Elm.value
            { importFrom = [ "Route" ]
            , name = "Host__SignUp"
            , annotation = Just (Type.namedWith [] "Route" [])
            }
    , host__SignUpOld =
        Elm.value
            { importFrom = [ "Route" ]
            , name = "Host__SignUpOld"
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
    , student__SignUpOld =
        Elm.value
            { importFrom = [ "Route" ]
            , name = "Student__SignUpOld"
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
    , host__SignUp_ =
        \ar0 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Route" ]
                    , name = "Host__SignUp_"
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
    , student__SignUp_ =
        \ar0 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Route" ]
                    , name = "Student__SignUp_"
                    , annotation = Just (Type.namedWith [] "Route" [])
                    }
                )
                [ ar0 ]
    , support__Support_ =
        \ar0 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Route" ]
                    , name = "Support__Support_"
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
    , services =
        Elm.value
            { importFrom = [ "Route" ]
            , name = "Services"
            , annotation = Just (Type.namedWith [] "Route" [])
            }
    , support =
        Elm.value
            { importFrom = [ "Route" ]
            , name = "Support"
            , annotation = Just (Type.namedWith [] "Route" [])
            }
    , supportOld =
        Elm.value
            { importFrom = [ "Route" ]
            , name = "SupportOld"
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
            , host__CompleteRegistration : Elm.Expression
            , host__CompleteRegistrationNew : Elm.Expression
            , host__FullRegistration : Elm.Expression
            , host__FullRegistrationNew : Elm.Expression
            , host__SignUp : Elm.Expression
            , host__SignUpOld : Elm.Expression
            , partner__SignUp : Elm.Expression
            , student__SignUp : Elm.Expression
            , student__SignUpOld : Elm.Expression
            , blog__Slug_ : Elm.Expression -> Elm.Expression
            , host__SignUp_ : Elm.Expression -> Elm.Expression
            , services__Slug_ : Elm.Expression -> Elm.Expression
            , student__SignUp_ : Elm.Expression -> Elm.Expression
            , support__Support_ : Elm.Expression -> Elm.Expression
            , tags__Slug_ : Elm.Expression -> Elm.Expression
            , about : Elm.Expression
            , blog : Elm.Expression
            , privacyPolicy : Elm.Expression
            , services : Elm.Expression
            , support : Elm.Expression
            , supportOld : Elm.Expression
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
                , Elm.Case.branch0
                    "Host__CompleteRegistration"
                    routeTags.host__CompleteRegistration
                , Elm.Case.branch0
                    "Host__CompleteRegistrationNew"
                    routeTags.host__CompleteRegistrationNew
                , Elm.Case.branch0
                    "Host__FullRegistration"
                    routeTags.host__FullRegistration
                , Elm.Case.branch0
                    "Host__FullRegistrationNew"
                    routeTags.host__FullRegistrationNew
                , Elm.Case.branch0 "Host__SignUp" routeTags.host__SignUp
                , Elm.Case.branch0 "Host__SignUpOld" routeTags.host__SignUpOld
                , Elm.Case.branch0 "Partner__SignUp" routeTags.partner__SignUp
                , Elm.Case.branch0 "Student__SignUp" routeTags.student__SignUp
                , Elm.Case.branch0
                    "Student__SignUpOld"
                    routeTags.student__SignUpOld
                , Elm.Case.branch1
                    "Blog__Slug_"
                    ( "one", Type.record [ ( "slug", Type.string ) ] )
                    routeTags.blog__Slug_
                , Elm.Case.branch1
                    "Host__SignUp_"
                    ( "one", Type.record [ ( "signUp", Type.string ) ] )
                    routeTags.host__SignUp_
                , Elm.Case.branch1
                    "Services__Slug_"
                    ( "one", Type.record [ ( "slug", Type.string ) ] )
                    routeTags.services__Slug_
                , Elm.Case.branch1
                    "Student__SignUp_"
                    ( "one", Type.record [ ( "signUp", Type.string ) ] )
                    routeTags.student__SignUp_
                , Elm.Case.branch1
                    "Support__Support_"
                    ( "one", Type.record [ ( "support", Type.string ) ] )
                    routeTags.support__Support_
                , Elm.Case.branch1
                    "Tags__Slug_"
                    ( "one", Type.record [ ( "slug", Type.string ) ] )
                    routeTags.tags__Slug_
                , Elm.Case.branch0 "About" routeTags.about
                , Elm.Case.branch0 "Blog" routeTags.blog
                , Elm.Case.branch0 "PrivacyPolicy" routeTags.privacyPolicy
                , Elm.Case.branch0 "Services" routeTags.services
                , Elm.Case.branch0 "Support" routeTags.support
                , Elm.Case.branch0 "SupportOld" routeTags.supportOld
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
                                , Type.namedWith [ "Route" ] "Route" []
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
                                    (Type.var "abc")
                                , Type.namedWith [ "Route" ] "Route" []
                                ]
                                (Type.var "abc")
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
                                [ Type.namedWith [ "Route" ] "Route" [] ]
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
                                [ Type.namedWith [ "Route" ] "Route" [] ]
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
                                [ Type.namedWith [ "Route" ] "Route" [] ]
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
                                [ Type.namedWith [ "Route" ] "Route" [] ]
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
                                (Type.maybe
                                    (Type.namedWith [ "Route" ] "Route" [])
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
                                (Type.maybe
                                    (Type.namedWith [ "Route" ] "Route" [])
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
                        , Type.namedWith [ "Route" ] "Route" []
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
                            (Type.var "abc")
                        , Type.namedWith [ "Route" ] "Route" []
                        ]
                        (Type.var "abc")
                    )
            }
    , redirectTo =
        Elm.value
            { importFrom = [ "Route" ]
            , name = "redirectTo"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith [ "Route" ] "Route" [] ]
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
                    (Type.function
                        [ Type.namedWith [ "Route" ] "Route" [] ]
                        Type.string
                    )
            }
    , toPath =
        Elm.value
            { importFrom = [ "Route" ]
            , name = "toPath"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith [ "Route" ] "Route" [] ]
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
                        [ Type.namedWith [ "Route" ] "Route" [] ]
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
                        (Type.maybe (Type.namedWith [ "Route" ] "Route" []))
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
                        (Type.maybe (Type.namedWith [ "Route" ] "Route" []))
                    )
            }
    }