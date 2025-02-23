module Layout exposing (seoHeaders, view)

-- import Pages.PageUrl
-- import Pages.Url as Url
-- import Phosphor

import Head exposing (Tag)
import Head.Seo as Seo
import Html exposing (Html)
import Html.Attributes as Attrs
import Html.Events as Events
import I18n as Translations exposing (..)
import LanguageTag.Language as Language
import LanguageTag.Region as Region
import List
import Pages.Url exposing (fromPath, toString)
import Route exposing (Route)
import Settings
import Svg
import Svg.Attributes as SvgAttr
import UrlPath


seoHeaders : List Tag
seoHeaders =
    let
        imageUrl =
            [ "media", "banner.png" ] |> UrlPath.join |> fromPath
    in
    Seo.summaryLarge
        { canonicalUrlOverride = Nothing
        , siteName = Settings.title
        , image =
            { url = imageUrl
            , alt = "logo"
            , dimensions = Just { width = 500, height = 333 }
            , mimeType = Nothing
            }
        , description = Settings.subtitle
        , locale = Just ( Language.en, Region.us )
        , title = Settings.title
        }
        |> Seo.website


menu : I18n -> List { label : String, route : Route }
menu translation =
    [ { label = navbarServices translation, route = Route.Lang___Services { lang = Translations.languageToString <| Translations.currentLanguage translation } }
    , { label = navbarHost translation, route = Route.Lang___Host__SignUp { lang = Translations.languageToString <| Translations.currentLanguage translation } }
    , { label = navbarPartner translation, route = Route.Lang___Partner__SignUp { lang = Translations.languageToString <| Translations.currentLanguage translation } }
    , { label = navbarAbout translation, route = Route.Lang___About { lang = Translations.languageToString <| Translations.currentLanguage translation } }
    ]


logo : Html msg
logo =
    Html.div
        [ Attrs.class "p-5 text-primary-600 dark:text-primary-500"
        ]
        [ Svg.svg
            [ SvgAttr.width "80"
            , SvgAttr.height "80"
            , SvgAttr.viewBox "0 0 620 576"
            , SvgAttr.version "1.1"
            , SvgAttr.xmlSpace "preserve"
            , SvgAttr.style "fill-rule:evenodd;clip-rule:evenodd;stroke-linecap:round;stroke-linejoin:round;stroke-miterlimit:1.5;"
            ]
            [ Svg.g
                [ SvgAttr.id "Artboard1"
                , SvgAttr.transform "matrix(0.999191,0,0,0.970697,-200.67,-164.863)"
                ]
                [ Svg.rect
                    [ SvgAttr.x "200.833"
                    , SvgAttr.y "169.84"
                    , SvgAttr.width "619.855"
                    , SvgAttr.height "592.581"
                    , SvgAttr.style "fill:none;"
                    ]
                    []
                , Svg.g
                    [ SvgAttr.id "Layer9"
                    , SvgAttr.transform "matrix(1.00081,0,0,1.03019,-0.7944,-22.1498)"
                    ]
                    [ Svg.path
                        [ SvgAttr.d "M260.288,230.091L271.078,326.57L321.221,355.132L240.611,490.964L236.168,546.185L252.036,708.04L273.617,704.866L274.886,614.735L304.084,532.856L308.527,622.352L341.533,627.43L357.401,525.239L562.417,586.173L657.626,598.867L716.021,606.484L754.739,568.4L789.014,568.4L797.266,510.006L806.787,452.245L758.547,405.276L652.548,353.863L615.734,315.779L545.28,303.085L540.202,277.061L537.663,223.109L517.986,214.223L484.346,236.439L469.113,263.732L434.203,273.888L387.233,265.001L339.628,221.84L290.755,219.301L260.288,230.091Z"
                        , SvgAttr.style "fill:rgb(247,149,88);stroke:rgb(247,149,88);stroke-width:1.36px;"
                        ]
                        []
                    , Svg.path
                        [ SvgAttr.d "M595.45,616.309L589.102,719.452L751.751,712.311L658.922,620.276L631.946,606.788L595.45,616.309Z"
                        , SvgAttr.style "fill:rgb(179,50,70);stroke:rgb(89,28,72);stroke-width:1.36px;"
                        ]
                        []
                    , Svg.path
                        [ SvgAttr.d "M639.715,583.578C639.715,583.578 499.316,577.794 351.354,502.135C343.539,524.782 321.666,595.81 321.666,595.81C321.666,595.81 302.509,521.227 325.127,477.03C286.65,536.306 251.991,621.18 266.208,705.974C312.924,722.115 383.607,711.147 383.607,711.147L432.761,719.272L479.476,616.497L609.468,602.685C609.468,602.685 639.633,583.561 639.715,583.578Z"
                        , SvgAttr.style "fill:rgb(179,50,70);"
                        ]
                        []
                    , Svg.g
                        [ SvgAttr.transform "matrix(1.05848,0,0,0.981423,-44.6039,9.22411)"
                        ]
                        [ Svg.path
                            [ SvgAttr.d "M731.24,501.344C731.24,512.74 743.298,557.104 702.596,596.949C714.621,604.748 750.414,585.189 750.414,585.189L784.562,557.235L789.709,504.239L746.034,503.379C746.034,503.379 738.45,501.344 731.24,501.344Z"
                            , SvgAttr.style "fill:rgb(179,50,70);stroke:rgb(247,149,88);stroke-width:1.33px;"
                            ]
                            []
                        ]
                    , Svg.path
                        [ SvgAttr.d "M791.017,468.944C791.017,468.944 635.433,372.518 513.566,329.203C532.658,329.759 561.5,332.197 574.905,338.696C561.5,331.79 454.138,293.102 377.177,297.069C367.192,283.771 358.393,261.556 332.796,246.665C315.319,239.36 292.108,230.649 271.491,232.128C231.184,228.94 321.573,224.96 321.573,224.96L378.188,248.692L392.406,268.496L604.658,303.533L646.296,339.077L756.992,408.643L807.262,440.633L791.017,468.944Z"
                        , SvgAttr.style "fill:rgb(254,253,241);stroke:rgb(254,253,241);stroke-width:1.36px;"
                        ]
                        []
                    , Svg.path
                        [ SvgAttr.d "M596.421,586.893C596.421,586.893 462.667,607.389 384.595,568.036C379.112,586.711 366.487,664.481 382.593,706.665C396.1,719.276 437.718,715.274 437.718,715.274L572.829,713.081L596.421,586.893Z"
                        , SvgAttr.style "fill:rgb(89,28,72);stroke:rgb(89,28,72);stroke-width:1.36px;"
                        ]
                        []
                    , Svg.path
                        [ SvgAttr.d "M544.129,705.139L539.767,715.04L570.693,714.996L591.68,714.032L593.157,703.949L583.438,703.395L547.156,704.67L544.129,705.139Z"
                        , SvgAttr.style "fill:rgb(26,26,26);stroke:rgb(26,26,26);stroke-opacity:0;stroke-width:1.36px;"
                        ]
                        []
                    , Svg.path
                        [ SvgAttr.d "M730.448,459.358C730.448,459.358 769.125,467.317 796.656,458.371C803.028,456.301 791.781,483.557 791.781,483.557L760.096,492.9L730.441,494.931L730.448,459.358Z"
                        , SvgAttr.style "fill:rgb(89,28,72);stroke:rgb(89,28,72);stroke-width:1.36px;"
                        ]
                        []
                    , Svg.path
                        [ SvgAttr.d "M384.161,331.478C384.161,331.478 359.903,280.143 342.224,264.284C324.545,248.425 298.547,244.266 286.068,240.366C285.548,259.085 285.795,290.214 285.795,290.214C285.795,290.214 287.309,322.664 313.798,336.508C325.645,340.9 345.612,337.972 345.612,337.972L362.118,329.453L384.161,331.478Z"
                        , SvgAttr.style "fill:rgb(89,28,72);stroke:rgb(89,28,72);stroke-width:1.36px;"
                        ]
                        []
                    , Svg.path
                        [ SvgAttr.d "M532.981,232.006C532.981,232.006 496.928,260.949 490.835,273.644C484.741,286.338 524.856,286.338 524.856,286.338L540.089,250.794L548.722,237.592L532.981,232.006Z"
                        , SvgAttr.style "fill:rgb(179,50,70);stroke:rgb(179,50,70);stroke-width:1.36px;"
                        ]
                        []
                    , Svg.ellipse
                        [ SvgAttr.cx "492.813"
                        , SvgAttr.cy "378.583"
                        , SvgAttr.rx "16.265"
                        , SvgAttr.ry "16.662"
                        , SvgAttr.style "fill:white;stroke:rgb(254,253,241);stroke-width:1.36px;"
                        ]
                        []
                    , Svg.path
                        [ SvgAttr.d "M597.36,672.752C597.36,672.752 590.497,709.566 628.35,709.15C666.204,708.734 620.863,724.957 620.863,724.957L575.521,714.35L589.873,676.704L597.36,672.752Z"
                        , SvgAttr.style "fill:rgb(26,26,26);stroke:rgb(26,26,26);stroke-opacity:0;stroke-width:1.36px;"
                        ]
                        []
                    , Svg.path
                        [ SvgAttr.d "M711.104,699.221C711.104,699.221 717.101,707.454 718.137,710.344C719.173,713.234 722.499,708.381 722.499,708.381L712.14,695.896L711.104,699.221Z"
                        , SvgAttr.style "fill:rgb(26,26,26);stroke:rgb(26,26,26);stroke-opacity:0;stroke-width:1.36px;"
                        ]
                        []
                    ]
                , Svg.g
                    [ SvgAttr.id "Layer11"
                    , SvgAttr.transform "matrix(1.00081,0,0,1.03019,-0.7944,-22.1498)"
                    ]
                    [ Svg.path
                        [ SvgAttr.d "M264.729,703.068C264.729,703.068 627.821,714.849 718.484,705.912C750.246,704.961 757.043,704.051 759.206,706.38C761.369,708.71 764.697,714.866 767.692,717.362C770.687,719.858 767.193,719.692 735.912,724.85C704.63,730.008 296.299,814.019 234.857,703.83C227.377,682.541 240.361,673.445 244.423,679.538C248.485,685.632 264.729,703.068 264.729,703.068Z"
                        , SvgAttr.style "fill:rgb(26,26,26);stroke:rgb(26,26,26);stroke-opacity:0;stroke-width:1.36px;"
                        ]
                        []
                    , Svg.path
                        [ SvgAttr.d "M252.85,664.945C252.85,664.945 266.479,700.637 307.556,704.277C348.634,707.916 269.37,710.287 269.37,710.287L250.131,686.369L252.85,664.945Z"
                        , SvgAttr.style "fill:rgb(26,26,26);stroke:rgb(26,26,26);stroke-opacity:0;stroke-width:1.36px;"
                        ]
                        []
                    , Svg.path
                        [ SvgAttr.d "M357.781,687.028C357.781,687.028 374.286,706.196 392.283,706.516C410.28,706.835 386.426,711.414 386.426,711.414L355.225,707.474L352.137,687.134C352.137,687.134 348.196,670.415 357.781,687.028Z"
                        , SvgAttr.style "fill:rgb(26,26,26);stroke:rgb(26,26,26);stroke-opacity:0;stroke-width:1.36px;"
                        ]
                        []
                    , Svg.path
                        [ SvgAttr.d "M472.321,708.207C472.321,708.207 485.632,708.101 490.424,699.155C495.216,690.21 535.097,698.616 535.097,698.616C535.097,698.616 527.076,708.114 524.946,710.111C522.816,712.108 484.238,714.992 484.238,714.992L472.321,708.207Z"
                        , SvgAttr.style "fill:rgb(26,26,26);stroke:rgb(26,26,26);stroke-opacity:0;stroke-width:1.36px;"
                        ]
                        []
                    ]
                , Svg.g
                    [ SvgAttr.id "V2"
                    , SvgAttr.transform "matrix(1.00081,0,0,1.03019,-0.7944,-22.1498)"
                    ]
                    [ Svg.g
                        [ SvgAttr.id "Layer1"
                        ]
                        [ Svg.path
                            [ SvgAttr.d "M245.813,208.61C245.813,208.61 319.591,191.792 344.932,207.798C360.369,217.547 380.274,230.14 392.867,256.545C398.391,257.185 437.552,259.795 452.583,263.451C453.131,263.699 454.045,249.339 454.045,249.339L521.321,187.653C521.321,187.653 545.043,201.035 558.78,221.087C569.103,236.154 569.201,246.421 569.297,249.363C569.687,261.333 569.274,270.837 562.308,286.903C565.844,289.19 626.064,304.374 626.064,304.374L606.93,328.085C606.93,328.085 467.238,283.106 382.171,283.106C381.329,281.608 360.363,248.609 346.22,239.457C332.076,230.306 325.421,221.986 273.174,232.136L245.886,232.136L245.813,208.61ZM521.31,276.498C515.32,274.169 479.047,266.848 479.047,266.848C479.047,266.848 509.974,232.409 521.809,224.751C525.803,226.914 535.952,235.233 536.951,241.057C537.949,246.881 524.804,271.34 521.31,276.498Z"
                            , SvgAttr.style "fill:rgb(26,26,26);stroke:rgb(26,26,26);stroke-width:1px;"
                            ]
                            []
                        ]
                    , Svg.g
                        [ SvgAttr.id "Layer2"
                        ]
                        [ Svg.path
                            [ SvgAttr.d "M626.238,304.481L641.712,325.613C641.712,325.613 785.608,408.654 790.628,411.913C795.648,415.173 819.557,431.705 819.557,463.163C819.557,477.722 808.596,492.094 808.596,492.094L771.418,501.194L733.512,504.106C733.512,504.106 681.444,495.035 692.942,451.335C693.97,447.429 712.933,447.028 724.574,451.662C736.214,456.297 745.36,470.156 743.863,480.838C744.688,480.914 773.933,483.522 780.137,482.294C786.341,481.066 791.515,463.781 790.683,458.123C789.851,452.466 782.3,437.598 767.949,430.11C753.597,422.622 624.394,347.544 623.978,347.544C623.562,347.544 607.339,328.617 607.339,328.617L626.238,304.481Z"
                            , SvgAttr.style "fill:rgb(26,26,26);stroke:rgb(26,26,26);stroke-width:1px;"
                            ]
                            []
                        ]
                    , Svg.g
                        [ SvgAttr.id "Layer3"
                        ]
                        [ Svg.path
                            [ SvgAttr.d "M808.354,491.678C808.354,491.678 818.032,551.717 783.576,586.173C776.158,583.606 765.481,580.001 765.481,580.001C765.481,580.001 741.7,625.995 687.753,623.72C633.806,621.445 639.656,584.072 639.656,584.072C639.656,584.072 676.843,595.657 695.962,593.497C715.082,591.337 755.281,584.932 755.281,501.086C755.281,480.938 771.107,501.085 771.107,501.085C771.107,501.085 772.762,529.31 770.322,546.389C773.216,547.031 776.312,547.987 776.312,547.987C776.312,547.987 783.9,538.563 781.903,498.069C785.364,492.184 808.354,491.678 808.354,491.678Z"
                            , SvgAttr.style "fill:rgb(26,26,26);stroke:rgb(26,26,26);stroke-width:1px;"
                            ]
                            []
                        ]
                    , Svg.g
                        [ SvgAttr.id "Layer4"
                        ]
                        [ Svg.path
                            [ SvgAttr.d "M686.882,622.941C679.395,618.574 639.604,584.079 639.604,584.079C639.604,584.079 482.542,589.287 465.277,620.77C448.012,652.252 431.763,707.601 431.763,707.601L454.198,709.383C454.198,709.383 508.067,644.283 520.755,639.083C518.675,645.323 491.22,700.44 487.06,705.224C482.901,710.007 527.826,706.264 527.826,706.264L557.361,672.153L544.049,706.472L592.303,706.264C592.303,706.264 602.91,632.22 603.118,618.076C609.358,617.868 626.413,616.828 626.413,616.828C626.413,616.828 668.995,638.124 715.169,704.265C719.121,708.009 758.43,706.137 758.43,706.137C758.43,706.137 694.37,627.309 686.882,622.941Z"
                            , SvgAttr.style "fill:rgb(26,26,26);stroke:rgb(26,26,26);stroke-width:1px;"
                            ]
                            []
                        , Svg.path
                            [ SvgAttr.d "M368.434,705.243C368.434,705.243 324.155,633.747 322.124,603.28C313.999,623.998 305.875,660.152 307.093,706.868C308.312,753.585 266.064,704.431 266.064,704.431C266.064,704.431 214.067,601.235 277.845,483.037C264.846,488.332 253.877,493.207 253.877,493.207C253.877,493.207 311.155,392.056 333.092,373.37C355.028,354.683 384.683,331.934 384.683,331.934L300.594,362.808C300.594,362.808 212.176,491.967 202.02,538.684C214.207,530.559 231.801,516.656 231.801,516.656C231.801,516.656 195.33,605.18 234.734,703.42C255.045,728.945 281.856,733.414 281.856,733.414L315.979,731.383L348.071,717.571L368.434,705.243Z"
                            , SvgAttr.style "fill:rgb(26,26,26);"
                            ]
                            []
                        ]
                    , Svg.g
                        [ SvgAttr.id "Layer5"
                        ]
                        [ Svg.path
                            [ SvgAttr.d "M384.382,331.535C384.382,331.535 355.516,294.682 304.706,302.562C310.868,315.767 325.351,329.717 338.555,335.68C333.55,337.065 312.039,343.028 294.255,326.203C276.472,309.377 273.08,291.12 273.08,280.87C273.08,270.62 272.814,231.485 272.814,231.485L245.931,231.485C245.931,231.485 245.171,294.03 245.931,294.03C246.691,294.03 251.35,343.923 299.67,363.249C321.101,356.884 384.382,331.535 384.382,331.535Z"
                            , SvgAttr.style "fill:rgb(26,26,26);stroke:rgb(26,26,26);stroke-width:1px;"
                            ]
                            []
                        ]
                    , Svg.path
                        [ SvgAttr.d "M430.577,373.045C453.732,359.234 481.385,346.819 499.259,355.35C517.133,363.881 524.039,379.318 528.101,387.442C532.163,395.567 536.226,403.691 541.913,408.16C537.164,408.795 513.841,413.907 505.522,416.195C497.202,418.483 468.292,418.483 455.396,402.883C442.501,387.284 442.501,384.372 435.845,377.925C432.843,375.076 432.589,374.586 430.577,373.045ZM492.652,368.422C498.456,368.422 503.168,373.134 503.168,378.938C503.168,384.742 498.456,389.454 492.652,389.454C486.849,389.454 482.137,384.742 482.137,378.938C482.137,373.134 486.849,368.422 492.652,368.422Z"
                        , SvgAttr.style "fill:rgb(26,26,26);stroke:rgb(26,26,26);stroke-width:1px;"
                        ]
                        []
                    , Svg.g
                        [ SvgAttr.transform "matrix(0.990251,0,0,1,7.13285,0)"
                        ]
                        [ Svg.g
                            [ SvgAttr.id "Layer7"
                            ]
                            [ Svg.path
                                [ SvgAttr.d "M733.633,504.101C733.633,504.101 760.414,508.287 782.888,506.08C794.688,504.922 801.418,499.131 808.521,492.853C802.551,488.926 777.003,493.015 777.003,493.015L743.991,495.943L733.633,504.101Z"
                                , SvgAttr.style "fill:rgb(26,26,26);stroke:rgb(26,26,26);stroke-width:1px;"
                                ]
                                []
                            ]
                        ]
                    ]
                ]
            ]
        ]


viewMainMenuItem : I18n -> { label : String, route : Route } -> Html msg
viewMainMenuItem translation { label, route } =
    Route.link
        (if label == Translations.buttonRequestAccommodation translation then
            [ Attrs.class "hidden sm:block font-bold tracking-widest text-primary-500 dark:text-gray-100 hover:text-primary-600" ]

         else
            [ Attrs.class "hidden sm:block font-medium text-gray-900 dark:text-gray-100  hover:text-primary-600 decoration-primary-500" ]
        )
        [ Html.text label ]
        route


viewSideMainMenuItem : msg -> I18n -> { label : String, route : Route } -> Html msg
viewSideMainMenuItem onMenuToggle translation { label, route } =
    Html.div
        [ Attrs.class "px-12 py-4"
        ]
        [ Route.link
            (if label == Translations.buttonRequestAccommodation translation then
                [ Attrs.class "text-2xl font-bold tracking-widest text-primary-500 dark:text-gray-100"
                , Events.onClick onMenuToggle
                ]

             else
                [ Attrs.class "text-2xl font-bold tracking-widest text-gray-900 dark:text-gray-100"
                , Events.onClick onMenuToggle
                ]
            )
            [ Html.text label ]
            route
        ]


viewMenu : UrlPath.UrlPath -> I18n -> Bool -> msg -> (Language -> msg) -> Html msg
viewMenu path translation showMenu onMenuToggle onLanguageChange =
    let
        mainMenuItems =
            { label = Translations.buttonRequestAccommodation translation, route = Route.Lang___Student__SignUp { lang = Translations.languageToString <| Translations.currentLanguage translation } }
                :: menu translation
                |> List.map (viewMainMenuItem translation)

        sideMenuItems =
            { label = Translations.navbarHome translation
            , route =
                Route.Lang_
                    { lang = Translations.languageToString <| Translations.currentLanguage translation }
            }
                :: { label = Translations.buttonRequestAccommodation translation, route = Route.Lang___Student__SignUp { lang = Translations.languageToString <| Translations.currentLanguage translation } }
                :: menu translation
                |> List.map (viewSideMainMenuItem onMenuToggle translation)

        sidebarLanguages =
            Html.div [ Attrs.class "px-12 py-4 bottom-2 fixed" ]
                [ Html.h2
                    [ Attrs.class "text-2xl font-bold tracking-widest text-gray-900 dark:text-gray-100 mb-2"
                    ]
                    [ Html.text <| Translations.footerLanguage translation ]
                , Html.div [ Attrs.class "grid grid-flow-col gap-2 text-lg font-bold tracking-widest text-gray-900 dark:text-gray-100" ] <|
                    List.map
                        (\lang ->
                            Html.div []
                                [ Html.button
                                    [ Attrs.class "hover:text-primary-600"
                                    , Events.onClick (onLanguageChange lang)
                                    ]
                                    [ Html.a
                                        [ Attrs.href <| changeLanguageUrlPath path lang
                                        , Attrs.hreflang <| Translations.languageToString lang
                                        , if Translations.currentLanguage translation == lang then
                                            Attrs.class "text-primary-500"

                                          else
                                            Attrs.class "text-gray-500"
                                        ]
                                        [ Html.text <| String.toUpper <| Translations.languageToString lang ]
                                    ]
                                ]
                        )
                        Translations.languages
                ]
    in
    Html.nav
        [ Attrs.class "flex items-center leading-5 space-x-4 sm:space-x-6"
        ]
        (mainMenuItems
            ++ [ Html.button
                    [ Attrs.attribute "aria-label" "Toggle Menu"
                    , Attrs.class "sm:hidden"
                    , Events.onClick onMenuToggle
                    ]
                    [ Svg.svg
                        [ SvgAttr.viewBox "0 0 20 20"
                        , SvgAttr.fill "currentColor"
                        , SvgAttr.class "text-gray-900 dark:text-gray-100 h-8 w-8"
                        ]
                        [ Svg.path
                            [ SvgAttr.fillRule "evenodd"
                            , SvgAttr.d "M3 5a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zM3 10a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zM3 15a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1z"
                            , SvgAttr.clipRule "evenodd"
                            ]
                            []
                        ]
                    ]
               , Html.div
                    [ Attrs.class "fixed left-0 top-0 z-40 h-full w-full transform opacity-95 dark:opacity-[0.98] bg-white duration-300 ease-in-out dark:bg-gray-950"
                    , Attrs.classList
                        [ ( "translate-x-0", showMenu )
                        , ( "translate-x-full", not showMenu )
                        ]
                    ]
                    [ Html.div
                        [ Attrs.class "flex justify-end"
                        ]
                        [ Html.button
                            [ Attrs.class "mr-8 mt-11 h-8 w-8"
                            , Attrs.attribute "aria-label" "Toggle Menu"
                            , Events.onClick onMenuToggle
                            ]
                            [ Svg.svg
                                [ SvgAttr.viewBox "0 0 20 20"
                                , SvgAttr.fill "currentColor"
                                , SvgAttr.class "text-gray-900 dark:text-gray-100"
                                ]
                                [ Svg.path
                                    [ SvgAttr.fillRule "evenodd"
                                    , SvgAttr.d "M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z"
                                    , SvgAttr.clipRule "evenodd"
                                    ]
                                    []
                                ]
                            ]
                        ]
                    , Html.div
                        [ Attrs.class "fixed mt-8 h-full"
                        ]
                        (List.reverse <| sidebarLanguages :: List.reverse sideMenuItems)
                    ]
               ]
        )


view : UrlPath.UrlPath -> I18n -> Bool -> msg -> (Language -> msg) -> List (Html msg) -> List (Html msg)
view path translation showMenu onMenuToggle onLanguageChange body =
    [ Html.div [ Attrs.class "mx-auto  px-4 sm:px-6 xl:px-10" ]
        -- Attrs.class "mx-auto max-w-3xl px-4 sm:px-6 xl:max-w-5xl xl:px-0"
        [ Html.div [ Attrs.class "flex h-screen flex-col justify-between font-sans" ]
            [ Html.header
                [ Attrs.class "flex items-center justify-between py-2"
                ]
                [ Html.div [ Attrs.class "text-black" ]
                    [ Route.link
                        [ Attrs.attribute "aria-label" Settings.title
                        ]
                        [ Html.div
                            [ Attrs.class "flex items-center justify-between"
                            ]
                            [ logo
                            , Html.div
                                [ Attrs.class "w-2 h-12 text-2xl font-semibold  hover:text-primary-500"
                                ]
                                [ Html.text Settings.title ]
                            ]
                        ]
                        (Route.Lang_
                            { lang = Translations.languageToString <| Translations.currentLanguage translation }
                        )
                    ]
                , viewMenu path translation showMenu onMenuToggle onLanguageChange
                ]
            , Html.main_ [ Attrs.class "w-full mb-auto" ] body
            , footer path translation onLanguageChange
            ]
        ]
    ]


footer : UrlPath.UrlPath -> I18n -> (Language -> msg) -> Html msg
footer path translation onLanguageChange =
    Html.footer
        [ Attrs.class "bg-white dark:bg-gray-900"
        ]
        [ Html.div
            [ Attrs.class "mx-auto w-full max-w-screen-xl p-4 py-6 lg:py-8"
            ]
            [ Html.div
                [ Attrs.class "md:flex md:justify-between"
                ]
                [ Html.div
                    [ Attrs.class "mb-6 md:mb-0"
                    ]
                    [ Route.link
                        [ Attrs.class "flex items-center"
                        ]
                        [ Html.span
                            [ Attrs.class "self-center text-2xl font-semibold whitespace-nowrap text-primary-500 hover:text-primary-600 dark:text-white"
                            ]
                            [ Html.text "Capybara House" ]
                        ]
                        (Route.Lang_
                            { lang = Translations.languageToString <| Translations.currentLanguage translation }
                        )
                    ]
                , Html.div
                    [ Attrs.class "grid grid-cols-2 gap-8 sm:gap-6 sm:grid-cols-2"
                    ]
                    [ Html.div []
                        [ Html.h2
                            [ Attrs.class "mb-6 text-sm font-semibold text-gray-900 uppercase dark:text-white"
                            ]
                            [ Html.text <| Translations.footerContact translation ]
                        , Html.ul
                            [ Attrs.class "text-gray-500 dark:text-gray-400 font-medium"
                            ]
                            [ Html.li
                                [ Attrs.class "mb-4"
                                ]
                                [ Route.link
                                    [ Attrs.class "hover:text-primary-600 "
                                    ]
                                    [ Html.text <| Translations.footerSupport translation ]
                                    (Route.Lang___Support
                                        { lang = Translations.languageToString <| Translations.currentLanguage translation }
                                    )
                                ]
                            , Html.li
                                [ Attrs.class "mb-4"
                                ]
                                [ Html.a
                                    [ Attrs.href "mailto:info@capybara.house"
                                    , Attrs.class "hover:text-primary-600 "
                                    ]
                                    [ Html.text "info@capybara.house" ]
                                ]
                            , Html.li
                                [ Attrs.class "mb-4"
                                ]
                                [ Html.a
                                    [ Attrs.href "https://calendly.com/capybarahouse"
                                    , Attrs.class "hover:text-primary-600 flex align-middle"
                                    ]
                                    [ Html.text "📅"
                                    , Html.text <| Translations.footerMeeting translation
                                    ]
                                ]
                            , Html.li [ Attrs.class "mb-4" ]
                                [ Html.a
                                    [ Attrs.href "tel:+35314434958"
                                    , Attrs.class "hover:text-primary-600"
                                    ]
                                    [ Html.text "🇮🇪 +353 1 443 4958" ]
                                ]
                            , Html.li [ Attrs.class "mb-4" ]
                                [ Html.a
                                    [ Attrs.href "tel:+17207380798"
                                    , Attrs.class "hover:text-primary-600"
                                    ]
                                    [ Html.text "🇺🇸 +1 720 738 0798" ]
                                ]
                            ]
                        ]
                    , Html.div []
                        [ Html.h2
                            [ Attrs.class "mb-6 text-sm font-semibold text-gray-900 uppercase dark:text-white"
                            ]
                            [ Html.text <| Translations.footerLegal translation ]
                        , Html.ul
                            [ Attrs.class "text-gray-500 dark:text-gray-400 font-medium"
                            ]
                            [ Html.li
                                [ Attrs.class "mb-4"
                                ]
                                [ Route.link
                                    [ Attrs.class "hover:text-primary-600"
                                    ]
                                    [ Html.text <| Translations.footerPrivacyPolicy translation ]
                                    (Route.Lang___PrivacyPolicy
                                        { lang = Translations.languageToString <| Translations.currentLanguage translation }
                                    )
                                ]
                            , Html.li []
                                [ Route.link
                                    [ Attrs.class "hover:text-primary-600"
                                    ]
                                    [ Html.text <| Translations.footerTermsConditions translation ]
                                    (Route.Lang___Booking__TermsAndConditions
                                        { lang = Translations.languageToString <| Translations.currentLanguage translation }
                                    )
                                ]
                            ]
                        , footerLanguages path translation onLanguageChange
                        ]
                    ]
                ]
            , Html.hr
                [ Attrs.class "my-6 border-gray-200 sm:mx-auto dark:border-gray-700 lg:my-8"
                ]
                []
            , Html.div
                [ Attrs.class "sm:flex sm:items-center sm:justify-between"
                ]
                [ Html.span
                    [ Attrs.class "text-sm text-gray-500 sm:text-center dark:text-gray-400"
                    ]
                    [ Html.text "© 2024"
                    , Html.a
                        [ Attrs.href "https://tranquera.co/"
                        , Attrs.class "hover:text-primary-600"
                        ]
                        [ Html.text "Tranquera LLC" ]
                    , Html.text <| ". " ++ Translations.footerCopyright translation
                    ]
                , Html.div
                    [ Attrs.class "flex mt-4 sm:justify-center sm:mt-0"
                    ]
                    []
                ]
            ]
        ]


footerLanguages : UrlPath.UrlPath -> I18n -> (Language -> msg) -> Html msg
footerLanguages path translation onLanguageChange =
    Html.div [ Attrs.class "mt-6" ]
        [ Html.h2
            [ Attrs.class "mb-6 text-sm font-semibold text-gray-900 uppercase dark:text-white"
            ]
            [ Html.text <| Translations.footerLanguage translation ]
        , Html.div [ Attrs.class "grid grid-flow-col align-baseline font-normal" ] <|
            List.map
                (\lang ->
                    Html.div []
                        [ Html.button
                            [ Attrs.class "hover:text-primary-600"
                            , Events.onClick (onLanguageChange lang)
                            ]
                            [ Html.a
                                [ Attrs.href <| changeLanguageUrlPath path lang
                                , Attrs.hreflang <| Translations.languageToString lang
                                , if Translations.currentLanguage translation == lang then
                                    Attrs.class "text-primary-500 hover:text-primary-600 font-bold"

                                  else
                                    Attrs.class "text-gray-500 hover:text-primary-600"
                                ]
                                [ Html.text <| String.toUpper <| Translations.languageToString lang ]
                            ]
                        ]
                )
                Translations.languages
        ]


changeLanguageUrlPath : UrlPath.UrlPath -> Language -> String
changeLanguageUrlPath path lang =
    let
        segments =
            UrlPath.toSegments <| toString <| Pages.Url.fromPath path
    in
    case List.head segments of
        Just h ->
            if String.length h == 2 then
                toString <| Pages.Url.fromPath <| Translations.languageToString lang :: List.drop 1 segments

            else
                toString <| Pages.Url.fromPath <| Translations.languageToString lang :: segments

        _ ->
            toString <| Pages.Url.fromPath <| Translations.languageToString lang :: segments
