module Gen.Effect exposing (annotation_, batch, call_, caseOf_, fromCmd, make_, map, moduleName_, none, perform, values_)

{-| 
@docs moduleName_, perform, map, fromCmd, batch, none, annotation_, make_, caseOf_, call_, values_
-}


import Elm
import Elm.Annotation as Type
import Elm.Case


{-| The name of this module. -}
moduleName_ : List String
moduleName_ =
    [ "Effect" ]


{-| {-| -}

perform: 
    { fetchRouteData :
        { data : Maybe Effect.FormData
        , toMsg : Result.Result Http.Error Url.Url -> pageMsg
        }
        -> Effect.Cmd msg
    , submit :
        { values : Effect.FormData
        , toMsg : Result.Result Http.Error Url.Url -> pageMsg
        }
        -> Effect.Cmd msg
    , runFetcher : Pages.Fetcher.Fetcher pageMsg -> Effect.Cmd msg
    , fromPageMsg : pageMsg -> msg
    , key : Browser.Navigation.Key
    , setField :
        { formId : String, name : String, value : String } -> Effect.Cmd msg
    }
    -> Effect.Effect pageMsg
    -> Effect.Cmd msg
-}
perform :
    { fetchRouteData : Elm.Expression -> Elm.Expression
    , submit : Elm.Expression -> Elm.Expression
    , runFetcher : Elm.Expression -> Elm.Expression
    , fromPageMsg : Elm.Expression -> Elm.Expression
    , key : Elm.Expression
    , setField : Elm.Expression -> Elm.Expression
    }
    -> Elm.Expression
    -> Elm.Expression
perform performArg performArg0 =
    Elm.apply
        (Elm.value
            { importFrom = [ "Effect" ]
            , name = "perform"
            , annotation =
                Just
                    (Type.function
                        [ Type.record
                            [ ( "fetchRouteData"
                              , Type.function
                                    [ Type.record
                                        [ ( "data"
                                          , Type.maybe
                                                (Type.namedWith
                                                    [ "Effect" ]
                                                    "FormData"
                                                    []
                                                )
                                          )
                                        , ( "toMsg"
                                          , Type.function
                                                [ Type.namedWith
                                                    [ "Result" ]
                                                    "Result"
                                                    [ Type.namedWith
                                                        [ "Http" ]
                                                        "Error"
                                                        []
                                                    , Type.namedWith
                                                        [ "Url" ]
                                                        "Url"
                                                        []
                                                    ]
                                                ]
                                                (Type.var "pageMsg")
                                          )
                                        ]
                                    ]
                                    (Type.namedWith
                                        [ "Effect" ]
                                        "Cmd"
                                        [ Type.var "msg" ]
                                    )
                              )
                            , ( "submit"
                              , Type.function
                                    [ Type.record
                                        [ ( "values"
                                          , Type.namedWith
                                                [ "Effect" ]
                                                "FormData"
                                                []
                                          )
                                        , ( "toMsg"
                                          , Type.function
                                                [ Type.namedWith
                                                    [ "Result" ]
                                                    "Result"
                                                    [ Type.namedWith
                                                        [ "Http" ]
                                                        "Error"
                                                        []
                                                    , Type.namedWith
                                                        [ "Url" ]
                                                        "Url"
                                                        []
                                                    ]
                                                ]
                                                (Type.var "pageMsg")
                                          )
                                        ]
                                    ]
                                    (Type.namedWith
                                        [ "Effect" ]
                                        "Cmd"
                                        [ Type.var "msg" ]
                                    )
                              )
                            , ( "runFetcher"
                              , Type.function
                                    [ Type.namedWith
                                        [ "Pages", "Fetcher" ]
                                        "Fetcher"
                                        [ Type.var "pageMsg" ]
                                    ]
                                    (Type.namedWith
                                        [ "Effect" ]
                                        "Cmd"
                                        [ Type.var "msg" ]
                                    )
                              )
                            , ( "fromPageMsg"
                              , Type.function
                                    [ Type.var "pageMsg" ]
                                    (Type.var "msg")
                              )
                            , ( "key"
                              , Type.namedWith
                                    [ "Browser", "Navigation" ]
                                    "Key"
                                    []
                              )
                            , ( "setField"
                              , Type.function
                                    [ Type.record
                                        [ ( "formId", Type.string )
                                        , ( "name", Type.string )
                                        , ( "value", Type.string )
                                        ]
                                    ]
                                    (Type.namedWith
                                        [ "Effect" ]
                                        "Cmd"
                                        [ Type.var "msg" ]
                                    )
                              )
                            ]
                        , Type.namedWith
                            [ "Effect" ]
                            "Effect"
                            [ Type.var "pageMsg" ]
                        ]
                        (Type.namedWith [ "Effect" ] "Cmd" [ Type.var "msg" ])
                    )
            }
        )
        [ Elm.record
            [ Tuple.pair
                "fetchRouteData"
                (Elm.functionReduced "performUnpack" performArg.fetchRouteData)
            , Tuple.pair
                "submit"
                (Elm.functionReduced "performUnpack" performArg.submit)
            , Tuple.pair
                "runFetcher"
                (Elm.functionReduced "performUnpack" performArg.runFetcher)
            , Tuple.pair
                "fromPageMsg"
                (Elm.functionReduced "performUnpack" performArg.fromPageMsg)
            , Tuple.pair "key" performArg.key
            , Tuple.pair
                "setField"
                (Elm.functionReduced "performUnpack" performArg.setField)
            ]
        , performArg0
        ]


{-| {-| -}

map: (a -> b) -> Effect.Effect a -> Effect.Effect b
-}
map : (Elm.Expression -> Elm.Expression) -> Elm.Expression -> Elm.Expression
map mapArg mapArg0 =
    Elm.apply
        (Elm.value
            { importFrom = [ "Effect" ]
            , name = "map"
            , annotation =
                Just
                    (Type.function
                        [ Type.function [ Type.var "a" ] (Type.var "b")
                        , Type.namedWith [ "Effect" ] "Effect" [ Type.var "a" ]
                        ]
                        (Type.namedWith [ "Effect" ] "Effect" [ Type.var "b" ])
                    )
            }
        )
        [ Elm.functionReduced "mapUnpack" mapArg, mapArg0 ]


{-| {-| -}

fromCmd: Effect.Cmd msg -> Effect.Effect msg
-}
fromCmd : Elm.Expression -> Elm.Expression
fromCmd fromCmdArg =
    Elm.apply
        (Elm.value
            { importFrom = [ "Effect" ]
            , name = "fromCmd"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith [ "Effect" ] "Cmd" [ Type.var "msg" ] ]
                        (Type.namedWith [ "Effect" ] "Effect" [ Type.var "msg" ]
                        )
                    )
            }
        )
        [ fromCmdArg ]


{-| {-| -}

batch: List (Effect.Effect msg) -> Effect.Effect msg
-}
batch : List Elm.Expression -> Elm.Expression
batch batchArg =
    Elm.apply
        (Elm.value
            { importFrom = [ "Effect" ]
            , name = "batch"
            , annotation =
                Just
                    (Type.function
                        [ Type.list
                            (Type.namedWith
                                [ "Effect" ]
                                "Effect"
                                [ Type.var "msg" ]
                            )
                        ]
                        (Type.namedWith [ "Effect" ] "Effect" [ Type.var "msg" ]
                        )
                    )
            }
        )
        [ Elm.list batchArg ]


{-| {-| -}

none: Effect.Effect msg
-}
none : Elm.Expression
none =
    Elm.value
        { importFrom = [ "Effect" ]
        , name = "none"
        , annotation =
            Just (Type.namedWith [ "Effect" ] "Effect" [ Type.var "msg" ])
        }


annotation_ :
    { formData : Type.Annotation, effect : Type.Annotation -> Type.Annotation }
annotation_ =
    { formData =
        Type.alias
            moduleName_
            "FormData"
            []
            (Type.record
                [ ( "fields", Type.list (Type.tuple Type.string Type.string) )
                , ( "method", Type.namedWith [ "Form" ] "Method" [] )
                , ( "action", Type.string )
                , ( "id", Type.maybe Type.string )
                ]
            )
    , effect =
        \effectArg0 -> Type.namedWith [ "Effect" ] "Effect" [ effectArg0 ]
    }


make_ :
    { formData :
        { fields : Elm.Expression
        , method : Elm.Expression
        , action : Elm.Expression
        , id : Elm.Expression
        }
        -> Elm.Expression
    , none : Elm.Expression
    , cmd : Elm.Expression -> Elm.Expression
    , batch : Elm.Expression -> Elm.Expression
    }
make_ =
    { formData =
        \formData_args ->
            Elm.withType
                (Type.alias
                    [ "Effect" ]
                    "FormData"
                    []
                    (Type.record
                        [ ( "fields"
                          , Type.list (Type.tuple Type.string Type.string)
                          )
                        , ( "method", Type.namedWith [ "Form" ] "Method" [] )
                        , ( "action", Type.string )
                        , ( "id", Type.maybe Type.string )
                        ]
                    )
                )
                (Elm.record
                    [ Tuple.pair "fields" formData_args.fields
                    , Tuple.pair "method" formData_args.method
                    , Tuple.pair "action" formData_args.action
                    , Tuple.pair "id" formData_args.id
                    ]
                )
    , none =
        Elm.value
            { importFrom = [ "Effect" ]
            , name = "None"
            , annotation = Just (Type.namedWith [] "Effect" [ Type.var "msg" ])
            }
    , cmd =
        \ar0 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Effect" ]
                    , name = "Cmd"
                    , annotation =
                        Just (Type.namedWith [] "Effect" [ Type.var "msg" ])
                    }
                )
                [ ar0 ]
    , batch =
        \ar0 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Effect" ]
                    , name = "Batch"
                    , annotation =
                        Just (Type.namedWith [] "Effect" [ Type.var "msg" ])
                    }
                )
                [ ar0 ]
    }


caseOf_ :
    { effect :
        Elm.Expression
        -> { effectTags_0_0
            | none : Elm.Expression
            , cmd : Elm.Expression -> Elm.Expression
            , batch : Elm.Expression -> Elm.Expression
        }
        -> Elm.Expression
    }
caseOf_ =
    { effect =
        \effectExpression effectTags ->
            Elm.Case.custom
                effectExpression
                (Type.namedWith [ "Effect" ] "Effect" [ Type.var "msg" ])
                [ Elm.Case.branch0 "None" effectTags.none
                , Elm.Case.branch1
                    "Cmd"
                    ( "effectCmd"
                    , Type.namedWith [ "Effect" ] "Cmd" [ Type.var "msg" ]
                    )
                    effectTags.cmd
                , Elm.Case.branch1
                    "Batch"
                    ( "listList"
                    , Type.list
                        (Type.namedWith [ "Effect" ] "Effect" [ Type.var "msg" ]
                        )
                    )
                    effectTags.batch
                ]
    }


call_ :
    { perform : Elm.Expression -> Elm.Expression -> Elm.Expression
    , map : Elm.Expression -> Elm.Expression -> Elm.Expression
    , fromCmd : Elm.Expression -> Elm.Expression
    , batch : Elm.Expression -> Elm.Expression
    }
call_ =
    { perform =
        \performArg performArg0 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Effect" ]
                    , name = "perform"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.record
                                    [ ( "fetchRouteData"
                                      , Type.function
                                            [ Type.record
                                                [ ( "data"
                                                  , Type.maybe
                                                        (Type.namedWith
                                                            [ "Effect" ]
                                                            "FormData"
                                                            []
                                                        )
                                                  )
                                                , ( "toMsg"
                                                  , Type.function
                                                        [ Type.namedWith
                                                            [ "Result" ]
                                                            "Result"
                                                            [ Type.namedWith
                                                                [ "Http" ]
                                                                "Error"
                                                                []
                                                            , Type.namedWith
                                                                [ "Url" ]
                                                                "Url"
                                                                []
                                                            ]
                                                        ]
                                                        (Type.var "pageMsg")
                                                  )
                                                ]
                                            ]
                                            (Type.namedWith
                                                [ "Effect" ]
                                                "Cmd"
                                                [ Type.var "msg" ]
                                            )
                                      )
                                    , ( "submit"
                                      , Type.function
                                            [ Type.record
                                                [ ( "values"
                                                  , Type.namedWith
                                                        [ "Effect" ]
                                                        "FormData"
                                                        []
                                                  )
                                                , ( "toMsg"
                                                  , Type.function
                                                        [ Type.namedWith
                                                            [ "Result" ]
                                                            "Result"
                                                            [ Type.namedWith
                                                                [ "Http" ]
                                                                "Error"
                                                                []
                                                            , Type.namedWith
                                                                [ "Url" ]
                                                                "Url"
                                                                []
                                                            ]
                                                        ]
                                                        (Type.var "pageMsg")
                                                  )
                                                ]
                                            ]
                                            (Type.namedWith
                                                [ "Effect" ]
                                                "Cmd"
                                                [ Type.var "msg" ]
                                            )
                                      )
                                    , ( "runFetcher"
                                      , Type.function
                                            [ Type.namedWith
                                                [ "Pages", "Fetcher" ]
                                                "Fetcher"
                                                [ Type.var "pageMsg" ]
                                            ]
                                            (Type.namedWith
                                                [ "Effect" ]
                                                "Cmd"
                                                [ Type.var "msg" ]
                                            )
                                      )
                                    , ( "fromPageMsg"
                                      , Type.function
                                            [ Type.var "pageMsg" ]
                                            (Type.var "msg")
                                      )
                                    , ( "key"
                                      , Type.namedWith
                                            [ "Browser", "Navigation" ]
                                            "Key"
                                            []
                                      )
                                    , ( "setField"
                                      , Type.function
                                            [ Type.record
                                                [ ( "formId", Type.string )
                                                , ( "name", Type.string )
                                                , ( "value", Type.string )
                                                ]
                                            ]
                                            (Type.namedWith
                                                [ "Effect" ]
                                                "Cmd"
                                                [ Type.var "msg" ]
                                            )
                                      )
                                    ]
                                , Type.namedWith
                                    [ "Effect" ]
                                    "Effect"
                                    [ Type.var "pageMsg" ]
                                ]
                                (Type.namedWith
                                    [ "Effect" ]
                                    "Cmd"
                                    [ Type.var "msg" ]
                                )
                            )
                    }
                )
                [ performArg, performArg0 ]
    , map =
        \mapArg mapArg0 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Effect" ]
                    , name = "map"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.function [ Type.var "a" ] (Type.var "b")
                                , Type.namedWith
                                    [ "Effect" ]
                                    "Effect"
                                    [ Type.var "a" ]
                                ]
                                (Type.namedWith
                                    [ "Effect" ]
                                    "Effect"
                                    [ Type.var "b" ]
                                )
                            )
                    }
                )
                [ mapArg, mapArg0 ]
    , fromCmd =
        \fromCmdArg ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Effect" ]
                    , name = "fromCmd"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.namedWith
                                    [ "Effect" ]
                                    "Cmd"
                                    [ Type.var "msg" ]
                                ]
                                (Type.namedWith
                                    [ "Effect" ]
                                    "Effect"
                                    [ Type.var "msg" ]
                                )
                            )
                    }
                )
                [ fromCmdArg ]
    , batch =
        \batchArg ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Effect" ]
                    , name = "batch"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.list
                                    (Type.namedWith
                                        [ "Effect" ]
                                        "Effect"
                                        [ Type.var "msg" ]
                                    )
                                ]
                                (Type.namedWith
                                    [ "Effect" ]
                                    "Effect"
                                    [ Type.var "msg" ]
                                )
                            )
                    }
                )
                [ batchArg ]
    }


values_ :
    { perform : Elm.Expression
    , map : Elm.Expression
    , fromCmd : Elm.Expression
    , batch : Elm.Expression
    , none : Elm.Expression
    }
values_ =
    { perform =
        Elm.value
            { importFrom = [ "Effect" ]
            , name = "perform"
            , annotation =
                Just
                    (Type.function
                        [ Type.record
                            [ ( "fetchRouteData"
                              , Type.function
                                    [ Type.record
                                        [ ( "data"
                                          , Type.maybe
                                                (Type.namedWith
                                                    [ "Effect" ]
                                                    "FormData"
                                                    []
                                                )
                                          )
                                        , ( "toMsg"
                                          , Type.function
                                                [ Type.namedWith
                                                    [ "Result" ]
                                                    "Result"
                                                    [ Type.namedWith
                                                        [ "Http" ]
                                                        "Error"
                                                        []
                                                    , Type.namedWith
                                                        [ "Url" ]
                                                        "Url"
                                                        []
                                                    ]
                                                ]
                                                (Type.var "pageMsg")
                                          )
                                        ]
                                    ]
                                    (Type.namedWith
                                        [ "Effect" ]
                                        "Cmd"
                                        [ Type.var "msg" ]
                                    )
                              )
                            , ( "submit"
                              , Type.function
                                    [ Type.record
                                        [ ( "values"
                                          , Type.namedWith
                                                [ "Effect" ]
                                                "FormData"
                                                []
                                          )
                                        , ( "toMsg"
                                          , Type.function
                                                [ Type.namedWith
                                                    [ "Result" ]
                                                    "Result"
                                                    [ Type.namedWith
                                                        [ "Http" ]
                                                        "Error"
                                                        []
                                                    , Type.namedWith
                                                        [ "Url" ]
                                                        "Url"
                                                        []
                                                    ]
                                                ]
                                                (Type.var "pageMsg")
                                          )
                                        ]
                                    ]
                                    (Type.namedWith
                                        [ "Effect" ]
                                        "Cmd"
                                        [ Type.var "msg" ]
                                    )
                              )
                            , ( "runFetcher"
                              , Type.function
                                    [ Type.namedWith
                                        [ "Pages", "Fetcher" ]
                                        "Fetcher"
                                        [ Type.var "pageMsg" ]
                                    ]
                                    (Type.namedWith
                                        [ "Effect" ]
                                        "Cmd"
                                        [ Type.var "msg" ]
                                    )
                              )
                            , ( "fromPageMsg"
                              , Type.function
                                    [ Type.var "pageMsg" ]
                                    (Type.var "msg")
                              )
                            , ( "key"
                              , Type.namedWith
                                    [ "Browser", "Navigation" ]
                                    "Key"
                                    []
                              )
                            , ( "setField"
                              , Type.function
                                    [ Type.record
                                        [ ( "formId", Type.string )
                                        , ( "name", Type.string )
                                        , ( "value", Type.string )
                                        ]
                                    ]
                                    (Type.namedWith
                                        [ "Effect" ]
                                        "Cmd"
                                        [ Type.var "msg" ]
                                    )
                              )
                            ]
                        , Type.namedWith
                            [ "Effect" ]
                            "Effect"
                            [ Type.var "pageMsg" ]
                        ]
                        (Type.namedWith [ "Effect" ] "Cmd" [ Type.var "msg" ])
                    )
            }
    , map =
        Elm.value
            { importFrom = [ "Effect" ]
            , name = "map"
            , annotation =
                Just
                    (Type.function
                        [ Type.function [ Type.var "a" ] (Type.var "b")
                        , Type.namedWith [ "Effect" ] "Effect" [ Type.var "a" ]
                        ]
                        (Type.namedWith [ "Effect" ] "Effect" [ Type.var "b" ])
                    )
            }
    , fromCmd =
        Elm.value
            { importFrom = [ "Effect" ]
            , name = "fromCmd"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith [ "Effect" ] "Cmd" [ Type.var "msg" ] ]
                        (Type.namedWith [ "Effect" ] "Effect" [ Type.var "msg" ]
                        )
                    )
            }
    , batch =
        Elm.value
            { importFrom = [ "Effect" ]
            , name = "batch"
            , annotation =
                Just
                    (Type.function
                        [ Type.list
                            (Type.namedWith
                                [ "Effect" ]
                                "Effect"
                                [ Type.var "msg" ]
                            )
                        ]
                        (Type.namedWith [ "Effect" ] "Effect" [ Type.var "msg" ]
                        )
                    )
            }
    , none =
        Elm.value
            { importFrom = [ "Effect" ]
            , name = "none"
            , annotation =
                Just (Type.namedWith [ "Effect" ] "Effect" [ Type.var "msg" ])
            }
    }