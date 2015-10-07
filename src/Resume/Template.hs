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
webpage = wrapper contents

-- privae functions

contents :: Tag.Markup
contents = do
  Tmpl.section "Biography" $ Tag.toMarkup Bio.biography
  Tmpl.section "Languages" $ Tmpl.list Lang.languages
  Tmpl.section "Employment" $ Tmpl.list Emp.employers

wrapper :: Tag.Markup -> Tag.Markup
wrapper more = do
  Tag.docType
  Tag.html ! Attr.lang "en-US" $ do
    Tag.head $ do
      Tag.meta ! Attr.charset "UTF-8"
      Tag.title $ Tag.text pageTitle
      Tmpl.stylesheet "all" "stylesheets/normalize.css"
      Tmpl.stylesheet "screen" "stylesheets/screen.css"
      Tmpl.stylesheet "print" "stylesheets/print.css"
    Tag.body $
      Tag.div ! Attr.class_ "wrapper" $ do
        Tag.header $
          Tag.div ! Attr.class_ "header-content" $
            Tag.h1 $ Tag.text pageTitle
        Tag.main more
