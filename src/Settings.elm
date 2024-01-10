module Settings exposing
    ( author
    , canonicalUrl
    , locale
    , subtitle
    , title
    )

import LanguageTag.Country as Country
import LanguageTag.Language as Language


canonicalUrl : String
canonicalUrl =
    "https://capybara.house"


locale : Maybe ( Language.Language, Country.Country )
locale =
    Just ( Language.en, Country.us )


title : String
title =
    "Capybara House"


subtitle : String
subtitle =
    "Accommodation Solutions for Students in Dublin"


author : String
author =
    "Tranquera LLC"
