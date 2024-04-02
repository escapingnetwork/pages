module Layout.Minimal exposing (seoHeaders, view)

import Content.Minimal exposing (Minimal)
import Head
import Head.Seo as Seo
import Html exposing (Html)
import Html.Attributes as Attrs
import Layout.Markdown as Markdown
import Pages.Url
import Settings
import UrlPath


seoHeaders : Minimal -> List Head.Tag
seoHeaders minimal =
    let
        imageUrl =
            [ "media", "banner.png" ] |> UrlPath.join |> Pages.Url.fromPath
    in
    Seo.summary
        { canonicalUrlOverride = Nothing
        , siteName = Settings.title
        , image =
            { url = imageUrl
            , alt = minimal.title
            , dimensions = Just { width = 300, height = 300 }
            , mimeType = Nothing
            }
        , description = minimal.company ++ " - " ++ minimal.title
        , locale = Settings.locale
        , title = minimal.title
        }
        |> Seo.website


view : Minimal -> Html msg
view minimal =
    Html.div
        [ Attrs.class "divide-y divide-gray-200 dark:divide-gray-700"
        ]
        [ Html.div
            [ Attrs.class "mx-auto prose max-w-none pb-8 pt-8 dark:prose-invert xl:col-span-2 xl:max-w-5xl xl:px-0"
            ]
          <|
            Markdown.toHtml minimal.body
        ]
