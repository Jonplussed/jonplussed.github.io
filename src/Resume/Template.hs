{-# LANGUAGE OverloadedStrings #-}

module Resume.Template
( webpage
) where

import Data.Monoid ((<>))
import Data.Text (Text)
import Text.Blaze.Html5 ((!))

import qualified Resume.Template.Sections as Sect
import qualified Resume.Template.Tags as Tmpl
import qualified Text.Blaze.Html5 as Tag
import qualified Text.Blaze.Html5.Attributes as Attr

-- constants

pageTitle :: Text
pageTitle = "Jonathan Childress"

-- public functions

webpage :: Tag.Markup
webpage = do
  Tag.docType
  Tag.html ! Attr.lang "en-US" $ do
    Tag.head $ do
      Tag.meta ! Attr.charset "UTF-8"
      Tag.title $ Tag.text pageTitle
      Tmpl.stylesheet "all" "stylesheets/normalize.css"
      Tmpl.stylesheet "screen" "stylesheets/screen.css"
      Tmpl.stylesheet "print" "stylesheets/print.css"
    Tag.body $
      Tag.div ! Attr.class_ "wrapper-outer" $
        Tag.div ! Attr.class_ "wrapper-inner" $ do
          Tag.header $
            Tag.div ! Attr.class_ "header-content" $ do
              Tag.h1 $ Tag.text pageTitle
              navigation
          Tag.main $ do
            contents
            navigation

-- private functions

contents :: Tag.Markup
contents = mapM_ Tag.toMarkup Sect.sections

navigation :: Tag.Markup
navigation = Tag.nav . Tmpl.listItems $ map navLink Sect.sections

navLink :: Sect.Section -> Tag.Markup
navLink sect =
  Tag.a ! Attr.href (Tag.textValue $ "#" <> Sect.ident sect) $
    Tag.text $ Sect.name sect
