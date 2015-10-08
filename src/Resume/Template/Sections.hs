{-# LANGUAGE OverloadedStrings #-}

module Resume.Template.Sections
( Section (..)
, sections
) where

import Data.Text (Text)
import Text.Blaze.Html5 ((!))

import qualified Resume.Content.Biography as Content
import qualified Resume.Content.Employment as Content
import qualified Resume.Content.Languages as Content
import qualified Resume.Content.Readings as Content
import qualified Resume.Content.Projects as Content
import qualified Resume.Template.Tags as Tmpl
import qualified Text.Blaze.Html5 as Tag
import qualified Text.Blaze.Html5.Attributes as Attr

data Section = Section
  { name :: Text
  , aside :: Maybe Text
  , ident :: Text
  , conts :: Tag.Markup
  }

instance Tag.ToMarkup Section where
  toMarkup sect =
    Tag.section ! Attr.id (Tag.textValue $ ident sect) $ do
      Tag.div ! Attr.class_ "section-title" $ do
        Tag.h4 $ Tag.text $ name sect
        subtitle $ aside sect
      Tag.div ! Attr.class_ "section-content" $
        conts sect

sections :: [Section]
sections = [biography, languages, employment, readings, projects]

-- sections list

biography :: Section
biography = Section
  { name  = "Biography"
  , aside = Nothing
  , ident = "biography"
  , conts = Tag.toMarkup Content.biography
  }

languages :: Section
languages = Section
  { name  = "Languages"
  , aside = Just "and relative confidence"
  , ident = "languages"
  , conts = Tmpl.tableRows Content.languages
  }

employment :: Section
employment = Section
  { name  = "Employment"
  , aside = Nothing
  , ident = "employment"
  , conts = Tmpl.listItems Content.employers
  }

readings :: Section
readings = Section
  { name  = "Reading List"
  , aside = Just "and completeness"
  , ident = "readings"
  , conts = Tmpl.tableRows Content.readings
  }

projects :: Section
projects = Section
  { name  = "Projects"
  , aside = Just "in progress!"
  , ident = "projects"
  , conts = Tmpl.listItems Content.projects
  }

-- private functions

subtitle :: Maybe Text -> Tag.Markup
subtitle text =
  case text of
    Just t -> Tag.h6 ! Attr.class_ "subtitle" $ Tag.text t
    _ -> return ()
