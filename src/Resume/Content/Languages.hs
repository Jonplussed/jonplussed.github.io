{-# LANGUAGE OverloadedStrings #-}

module Resume.Content.Languages
( Language
, languages
) where


import Data.Text (Text)
import Resume.Template.Tags (progressBar)

import qualified Text.Blaze.Html5 as Tag

data Language = Language
  { name :: Text
  , percent :: Int
  }

instance Tag.ToMarkup Language where
  toMarkup lang = do
      Tag.td . Tag.text $ name lang
      Tag.td . progressBar "confidence" $ percent lang

languages :: [Language]
languages =
    [ Language "Haskell"    80
    , Language "Ruby"       70
    , Language "PureScript" 70
    , Language "JavaScript" 60
    , Language "Bash"       40
    , Language "C"          30
    , Language "PHP"        10
    ]
