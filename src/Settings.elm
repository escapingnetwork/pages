module Settings exposing
    ( canonicalUrl
    , locale
    , subtitle
    , title
    )

import LanguageTag.Language as Language
import LanguageTag.Region as Region


canonicalUrl : String
canonicalUrl =
    "https://capybara.house"


locale : Maybe ( Language.Language, Region.Region )
locale =
    Just ( Language.en, Region.us )


title : String
title =
    "Capybara House"


subtitle : String
subtitle =
    "Accommodation Solutions for Students in Dublin"
