module Gen.Settings exposing (author, canonicalUrl, locale, moduleName_, subtitle, title, values_)

{-| 
@docs values_, canonicalUrl, locale, title, subtitle, author, moduleName_
-}


import Elm
import Elm.Annotation as Type


{-| The name of this module. -}
moduleName_ : List String
moduleName_ =
    [ "Settings" ]


{-| author: String -}
author : Elm.Expression
author =
    Elm.value
        { importFrom = [ "Settings" ]
        , name = "author"
        , annotation = Just Type.string
        }


{-| subtitle: String -}
subtitle : Elm.Expression
subtitle =
    Elm.value
        { importFrom = [ "Settings" ]
        , name = "subtitle"
        , annotation = Just Type.string
        }


{-| title: String -}
title : Elm.Expression
title =
    Elm.value
        { importFrom = [ "Settings" ]
        , name = "title"
        , annotation = Just Type.string
        }


{-| locale: Maybe ( Language.Language, Country.Country ) -}
locale : Elm.Expression
locale =
    Elm.value
        { importFrom = [ "Settings" ]
        , name = "locale"
        , annotation =
            Just
                (Type.namedWith
                    []
                    "Maybe"
                    [ Type.tuple
                        (Type.namedWith [ "Language" ] "Language" [])
                        (Type.namedWith [ "Country" ] "Country" [])
                    ]
                )
        }


{-| canonicalUrl: String -}
canonicalUrl : Elm.Expression
canonicalUrl =
    Elm.value
        { importFrom = [ "Settings" ]
        , name = "canonicalUrl"
        , annotation = Just Type.string
        }


values_ :
    { author : Elm.Expression
    , subtitle : Elm.Expression
    , title : Elm.Expression
    , locale : Elm.Expression
    , canonicalUrl : Elm.Expression
    }
values_ =
    { author =
        Elm.value
            { importFrom = [ "Settings" ]
            , name = "author"
            , annotation = Just Type.string
            }
    , subtitle =
        Elm.value
            { importFrom = [ "Settings" ]
            , name = "subtitle"
            , annotation = Just Type.string
            }
    , title =
        Elm.value
            { importFrom = [ "Settings" ]
            , name = "title"
            , annotation = Just Type.string
            }
    , locale =
        Elm.value
            { importFrom = [ "Settings" ]
            , name = "locale"
            , annotation =
                Just
                    (Type.namedWith
                        []
                        "Maybe"
                        [ Type.tuple
                            (Type.namedWith [ "Language" ] "Language" [])
                            (Type.namedWith [ "Country" ] "Country" [])
                        ]
                    )
            }
    , canonicalUrl =
        Elm.value
            { importFrom = [ "Settings" ]
            , name = "canonicalUrl"
            , annotation = Just Type.string
            }
    }


