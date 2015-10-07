{-# LANGUAGE OverloadedStrings #-}

module Resume.Content.Languages
( Language
, languages
) where

import Data.Text (Text)

import qualified Text.Blaze.Html5 as Tag

newtype Language = Language Text

instance Tag.ToMarkup Language where
  toMarkup (Language text) = Tag.text text

languages :: [Language]
languages = map Language
  [ "Haskell"
  , "PureScript"
  , "JavaScript"
  , "Ruby"
  , "C"
  ]
