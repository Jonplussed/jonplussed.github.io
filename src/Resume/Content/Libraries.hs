{-# LANGUAGE OverloadedStrings #-}

module Resume.Content.Libraries
( Library
, libraries
) where

import Data.Monoid ((<>))
import Data.Text (Text)
import Text.Blaze.Html5 ((!))

import qualified Text.Blaze.Html5 as Tag
import qualified Text.Blaze.Html5.Attributes as Attr

data Library = Library
  { name :: Text
  , url :: Text
  , desc :: Text
  }

instance Tag.ToMarkup Library where
  toMarkup lib = do
      Tag.a
        ! Attr.href (Tag.textValue $ url lib)
        ! Attr.class_ "name"
        $ Tag.text (name lib)
      Tag.text $ ", " <> desc lib

libraries :: [Library]
libraries =
    [ hsyslog
    , hsyslogUdp
    ]

-- private functions

hsyslog :: Library
hsyslog = Library
    { name = "hsyslog"
    , url  = "http://hackage.haskell.org/package/hsyslog"
    , desc = "Haskell interface to the C syslog library"
    }

hsyslogUdp :: Library
hsyslogUdp = Library
    { name = "hsyslog-udp"
    , url  = "http://hackage.haskell.org/package/hsyslog-udp"
    , desc = "Syslog over UDP supporting standard and arbitrary protocols."
    }
