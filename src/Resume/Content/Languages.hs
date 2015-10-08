{-# LANGUAGE OverloadedStrings #-}

module Resume.Content.Languages
( Language
, languages
) where

import Data.Monoid ((<>))
import Data.Text (Text)
import Text.Blaze.Html5 ((!))

import qualified Data.Text as Text
import qualified Text.Blaze.Html5 as Tag
import qualified Text.Blaze.Html5.Attributes as Attr

data Language = Language
  { name :: Text
  , percent :: Int
  }

instance Tag.ToMarkup Language where
  toMarkup lang = do
    Tag.td $
      Tag.text $ name lang
    Tag.td $
      Tag.div ! Attr.class_ "progress-outer" $
        Tag.div !
          Attr.class_ "progress-inner" !
          Attr.style (Tag.textValue $ widthPerc lang) $
          mempty

languages :: [Language]
languages =
  [ Language "Haskell" 80
  , Language "PureScript" 70
  , Language "JavaScript" 60
  , Language "Ruby" 50
  , Language "PHP" 20
  , Language "C" 5
  ]

-- private functions

widthPerc :: Language -> Text
widthPerc lang = "width: " <> Text.pack (show $ percent lang) <> "%"
