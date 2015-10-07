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

pageTitle :: Text
pageTitle = "Jonathan Childress"

header :: Tag.Markup
header = do
  Tag.docType
  Tag.html ! Attr.lang "en-US" $
    Tag.head $ do
      Tag.meta ! Attr.charset "UTF-8"
      Tag.title $ Tag.text pageTitle
      Tmpl.stylesheet "screen" "/screen.css"
      Tmpl.stylesheet "print" "/print.css"

contents :: Tag.Markup
contents =
  Tag.body $ do
    Tmpl.section "Biography" $ Tag.toMarkup Bio.biography
    Tmpl.section "Languages" $ Tmpl.list Lang.languages
    Tmpl.section "Employment" $ Tmpl.list Emp.employers
