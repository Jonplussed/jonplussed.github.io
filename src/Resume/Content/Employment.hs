{-# LANGUAGE OverloadedStrings #-}

module Resume.Content.Employment
( Employer
, employers
) where

import Data.Monoid ((<>))
import Data.Text (Text)
import Text.Blaze.Html5 ((!))

import qualified Text.Blaze.Html5 as Tag
import qualified Text.Blaze.Html5.Attributes as Attr

data Employer = Employer
  { name :: Text
  , url :: Text
  , yearStart :: Text
  , yearEnd :: Text
  , position :: Text
  , details :: Text
  }

instance Tag.ToMarkup Employer where
  toMarkup emp = do
    Tag.h3 $ do
      Tag.a ! Attr.href (Tag.textValue $ url emp) $ Tag.text (name emp)
      Tag.text $ yearStart emp <> "&mdash;" <> yearEnd emp
    Tag.h4 . Tag.text $ position emp
    Tag.details $
      Tag.p . Tag.text $ details emp

employers :: [Employer]
employers = [bendyworks, liaison, cfi]

bendyworks :: Employer
bendyworks = Employer
  { name =      "Bendyworks"
  , url =       "http://bendyworks.com"
  , yearStart = "2013"
  , yearEnd =   "2015"
  , position =  "developer"
  , details =   "Beyond having a near-perfect record on client happiness, I \
                \contributed numerous technical talks on functional \
                \programming, assisted others in learning Haskell, and ran the \
                \Madison Haskell Users Group."
  }

liaison :: Employer
liaison = Employer
  { name =      "Liaason"
  , url =       "http://www.liaison-intl.com"
  , yearStart = "2011"
  , yearEnd =   "2013"
  , position =  "developer"
  , details =   "Helped renovate and rewrite a massive, 100s of \
                \read/writes-per-second distributed document-parsing and ETL \
                \process."
  }

cfi :: Employer
cfi = Employer
  { name =      "Center for Inquiry"
  , url =       "http://centerforinquiry.net"
  , yearStart = "2009"
  , yearEnd =   "2011"
  , position =  "developer, system admin"
  , details =   "Along with administering their servers, designing their \
                \multiple websites, and end-to-end revamping their publishing \
                \and editorial processess, I developed a conference-website \
                \framework to simplify future website generation."
  }
