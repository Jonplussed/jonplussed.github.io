{-# LANGUAGE OverloadedStrings #-}

module Resume.Template.Tags
( listItems
, progressBar
, stylesheet
, tableRows
) where

import Data.Monoid ((<>))
import Data.Text (Text)
import Text.Blaze.Html5 ((!))

import qualified Data.Text as Text

import qualified Text.Blaze.Html5 as Tag
import qualified Text.Blaze.Html5.Attributes as Attr

listItems :: Tag.ToMarkup a => [a] -> Tag.Markup
listItems = Tag.ul . mapM_ (Tag.li . Tag.toMarkup)

progressBar :: Int -> Tag.Markup
progressBar percent =
    Tag.div
      ! Attr.class_ "progress-outer" $
      Tag.div
        ! Attr.class_ "progress-inner"
        ! Attr.style (Tag.textValue widthPerc) $
        mempty
  where
    widthPerc = "width: " <> Text.pack (show percent) <> "%"

tableRows :: Tag.ToMarkup a => [a] -> Tag.Markup
tableRows = Tag.table . mapM_ (Tag.tr . Tag.toMarkup)

stylesheet :: Text -> Text -> Tag.Markup
stylesheet device url =
  Tag.link ! Attr.rel "stylesheet"
           ! Attr.type_ "text/css"
           ! Attr.media (Tag.textValue device)
           ! Attr.href (Tag.textValue url)
