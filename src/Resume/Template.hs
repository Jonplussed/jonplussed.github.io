{-# LANGUAGE OverloadedStrings #-}

module Resume.Template where

import Data.Text (Text)
import Prelude (($))
import Text.Blaze.Html5 ((!))

import qualified Resume.Content.Biography as Bio
import qualified Resume.Content.Employment as Emp
import qualified Resume.Content.Languages as Lang
import qualified Resume.Template.Tags as Tmpl
import qualified Text.Blaze.Html5 as Tag
import qualified Text.Blaze.Html5.Attributes as Attr

-- constants

pageTitle :: Text
pageTitle = "Jonathan Childress"

-- public functions

webpage :: Tag.Markup
webpage = header contents

-- privae functions

contents :: Tag.Markup
contents = Tag.main $ do
  Tmpl.section "Biography" $ Tag.toMarkup Bio.biography
  Tmpl.section "Languages" $ Tmpl.list Lang.languages
  Tmpl.section "Employment" $ Tmpl.list Emp.employers

header :: Tag.Markup -> Tag.Markup
header more = do
  Tag.docType
  Tag.html ! Attr.lang "en-US" $ do
    Tag.head $ do
      Tag.meta ! Attr.charset "UTF-8"
      Tag.title $ Tag.text pageTitle
      Tmpl.stylesheet "screen" "stylesheets/screen.css"
      Tmpl.stylesheet "print" "stylesheets/print.css"
    Tag.body $ do
      Tag.h1 $ Tag.text pageTitle
      more
