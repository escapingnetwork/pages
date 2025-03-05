module Captcha exposing (Captcha, decoder, default, toSvg)

import Json.Decode as Decode exposing (Decoder)
import Svg exposing (Svg)
import SvgParser


type alias Captcha =
    { data : String
    , text : String
    }


decoder : Decoder Captcha
decoder =
    Decode.map2 Captcha
        (Decode.field "data" Decode.string)
        (Decode.field "text" Decode.string)


toSvg : Captcha -> Svg msg
toSvg { data } =
    case SvgParser.parse data of
        Ok svg ->
            svg

        Err error ->
            "Failed to parse SVG: "
                |> String.append error
                |> Svg.text


default : Captcha
default =
    { data = ""
    , text = ""
    }
