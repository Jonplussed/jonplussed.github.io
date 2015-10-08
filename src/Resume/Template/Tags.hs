{-# LANGUAGE OverloadedStrings #-}

module Resume.Template.Tags
( listItems
, section
, stylesheet
, tableRows
) where

import Data.Char (toLower)
import Data.Text (Text)
import Text.Blaze.Html5 ((!))

import qualified Data.Text as Text

import qualified Text.Blaze.Html5 as Tag
import qualified Text.Blaze.Html5.Attributes as Attr

listItems :: Tag.ToMarkup a => [a] -> Tag.Markup
listItems = Tag.ul . mapM_ (Tag.li . Tag.toMarkup)

tableRows :: Tag.ToMarkup a => [a] -> Tag.Markup
tableRows = Tag.table . mapM_ (Tag.tr . Tag.toMarkup)

section :: Text -> Tag.Markup -> Tag.Markup
section name contents =
  Tag.section ! Attr.id (Tag.textValue $ downcase name) $ do
    Tag.h4 ! Attr.class_ "section-title" $ Tag.text name
    Tag.div ! Attr.class_ "section-content" $
      contents

stylesheet :: Text -> Text -> Tag.Markup
stylesheet device url =
  Tag.link ! Attr.rel "stylesheet"
           ! Attr.type_ "text/css"
           ! Attr.media (Tag.textValue device)
           ! Attr.href (Tag.textValue url)

-- private functions

downcase :: Text -> Text
downcase = Text.map toLower
