{-# LANGUAGE OverloadedStrings #-}

module Resume.Content.Readings
( Reading
, readings
) where

import Data.Text (Text)
import Resume.Template.Tags (progressBar)

import qualified Text.Blaze.Html5 as Tag

data Reading = Reading
  { name :: Text
  , percent :: Int
  }

instance Tag.ToMarkup Reading where
  toMarkup book = do
    Tag.td . Tag.text $ name book
    Tag.td . progressBar $ percent book

readings :: [Reading]
readings =
  [ Reading "Types and Programming Languages" 10
  , Reading "WebGL Programming Guide" 40
  , Reading "The Elements of Computing Systems" 40
  , Reading "Relational Theory for Computer Professionals" 70
  , Reading "Functional Javascript" 100
  , Reading "Learn You a Haskell" 100
  , Reading "Metaprogramming Ruby" 100
  , Reading "Agile Web Development with Rails" 100
  ]
