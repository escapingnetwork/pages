module Gen.Shared exposing (annotation_, caseOf_, make_, moduleName_, template, values_)

{-| 
@docs moduleName_, template, annotation_, make_, caseOf_, values_
-}


import Elm
import Elm.Annotation as Type
import Elm.Case


{-| The name of this module. -}
moduleName_ : List String
moduleName_ =
    [ "Shared" ]


{-| template: SharedTemplate.SharedTemplate Shared.Msg Shared.Model Shared.Data msg -}
template : Elm.Expression
template =
    Elm.value
        { importFrom = [ "Shared" ]
        , name = "template"
        , annotation =
            Just
                (Type.namedWith
                    [ "SharedTemplate" ]
                    "SharedTemplate"
                    [ Type.namedWith [ "Shared" ] "Msg" []
                    , Type.namedWith [ "Shared" ] "Model" []
                    , Type.namedWith [ "Shared" ] "Data" []
                    , Type.var "msg"
                    ]
                )
        }


annotation_ :
    { model : Type.Annotation
    , data : Type.Annotation
    , sharedMsg : Type.Annotation
    , msg : Type.Annotation
    }
annotation_ =
    { model =
        Type.alias
            moduleName_
            "Model"
            []
            (Type.record
                [ ( "showMenu", Type.bool )
                , ( "i18n", Type.namedWith [ "Shared" ] "I18n" [] )
                , ( "language", Type.namedWith [ "Shared" ] "Language" [] )
                ]
            )
    , data = Type.alias moduleName_ "Data" [] Type.unit
    , sharedMsg = Type.namedWith [ "Shared" ] "SharedMsg" []
    , msg = Type.namedWith [ "Shared" ] "Msg" []
    }


make_ :
    { model :
        { showMenu : Elm.Expression
        , i18n : Elm.Expression
        , language : Elm.Expression
        }
        -> Elm.Expression
    , noOp : Elm.Expression
    , menuClicked : Elm.Expression
    , changeLanguage : Elm.Expression -> Elm.Expression
    , loadedTranslations : Elm.Expression -> Elm.Expression
    }
make_ =
    { model =
        \model_args ->
            Elm.withType
                (Type.alias
                    [ "Shared" ]
                    "Model"
                    []
                    (Type.record
                        [ ( "showMenu", Type.bool )
                        , ( "i18n", Type.namedWith [ "Shared" ] "I18n" [] )
                        , ( "language"
                          , Type.namedWith [ "Shared" ] "Language" []
                          )
                        ]
                    )
                )
                (Elm.record
                    [ Tuple.pair "showMenu" model_args.showMenu
                    , Tuple.pair "i18n" model_args.i18n
                    , Tuple.pair "language" model_args.language
                    ]
                )
    , noOp =
        Elm.value
            { importFrom = [ "Shared" ]
            , name = "NoOp"
            , annotation = Just (Type.namedWith [] "SharedMsg" [])
            }
    , menuClicked =
        Elm.value
            { importFrom = [ "Shared" ]
            , name = "MenuClicked"
            , annotation = Just (Type.namedWith [] "Msg" [])
            }
    , changeLanguage =
        \ar0 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Shared" ]
                    , name = "ChangeLanguage"
                    , annotation = Just (Type.namedWith [] "Msg" [])
                    }
                )
                [ ar0 ]
    , loadedTranslations =
        \ar0 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Shared" ]
                    , name = "LoadedTranslations"
                    , annotation = Just (Type.namedWith [] "Msg" [])
                    }
                )
                [ ar0 ]
    }


caseOf_ :
    { sharedMsg :
        Elm.Expression
        -> { sharedMsgTags_0_0 | noOp : Elm.Expression }
        -> Elm.Expression
    , msg :
        Elm.Expression
        -> { msgTags_1_0
            | menuClicked : Elm.Expression
            , changeLanguage : Elm.Expression -> Elm.Expression
            , loadedTranslations : Elm.Expression -> Elm.Expression
        }
        -> Elm.Expression
    }
caseOf_ =
    { sharedMsg =
        \sharedMsgExpression sharedMsgTags ->
            Elm.Case.custom
                sharedMsgExpression
                (Type.namedWith [ "Shared" ] "SharedMsg" [])
                [ Elm.Case.branch0 "NoOp" sharedMsgTags.noOp ]
    , msg =
        \msgExpression msgTags ->
            Elm.Case.custom
                msgExpression
                (Type.namedWith [ "Shared" ] "Msg" [])
                [ Elm.Case.branch0 "MenuClicked" msgTags.menuClicked
                , Elm.Case.branch1
                    "ChangeLanguage"
                    ( "sharedLanguage"
                    , Type.namedWith [ "Shared" ] "Language" []
                    )
                    msgTags.changeLanguage
                , Elm.Case.branch1
                    "LoadedTranslations"
                    ( "resultResult"
                    , Type.namedWith
                        [ "Result" ]
                        "Result"
                        [ Type.namedWith [ "Http" ] "Error" []
                        , Type.function
                            [ Type.namedWith [ "Shared" ] "I18n" [] ]
                            (Type.namedWith [ "Shared" ] "I18n" [])
                        ]
                    )
                    msgTags.loadedTranslations
                ]
    }


values_ : { template : Elm.Expression }
values_ =
    { template =
        Elm.value
            { importFrom = [ "Shared" ]
            , name = "template"
            , annotation =
                Just
                    (Type.namedWith
                        [ "SharedTemplate" ]
                        "SharedTemplate"
                        [ Type.namedWith [ "Shared" ] "Msg" []
                        , Type.namedWith [ "Shared" ] "Model" []
                        , Type.namedWith [ "Shared" ] "Data" []
                        , Type.var "msg"
                        ]
                    )
            }
    }