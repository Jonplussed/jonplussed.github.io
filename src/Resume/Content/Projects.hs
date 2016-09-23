{-# LANGUAGE OverloadedStrings #-}

module Resume.Content.Projects
( Project
, projects
) where

import Data.Monoid ((<>))
import Data.Text (Text)
import Text.Blaze.Html5 ((!))

import qualified Text.Blaze.Html5 as Tag
import qualified Text.Blaze.Html5.Attributes as Attr

data Project = Project
  { name :: Text
  , url :: Text
  , desc :: Text
  }

instance Tag.ToMarkup Project where
  toMarkup lib = do
      Tag.a
        ! Attr.href (Tag.textValue $ url lib)
        ! Attr.class_ "name"
        $ Tag.text (name lib)
      Tag.text $ ", " <> desc lib

projects :: [Project]
projects =
    [ webglRaw
    , webglMonad
    , midiFree
    , hooferApi
    , urlTextHistogram
    ]

-- private functions

webglRaw :: Project
webglRaw = Project
    { name = "purescript-webgl-raw"
    , url  = "https://github.com/Jonplussed/purescript-webgl-raw"
    , desc = "parses the WebGL specification to generate PureScript functions"
    }

webglMonad :: Project
webglMonad = Project
    { name = "purescript-webgl-monad"
    , url  = "https://github.com/Jonplussed/purescript-webgl-monad"
    , desc = "a clean, monadic wrapper for raw WebGL functions"
    }

midiFree :: Project
midiFree = Project
    { name = "midi-free"
    , url  = "https://github.com/Jonplussed/midi-free"
    , desc = "a free monad for writing MIDI files"
    }

hooferApi :: Project
hooferApi = Project
    { name = "hoofer-api"
    , url  = "https://github.com/Jonplussed/hoofers-api"
    , desc = "a tiny JSON API server for the Hoofer sailing club at UW Madison"
    }

urlTextHistogram :: Project
urlTextHistogram = Project
    { name = "url-text-historgram"
    , url  = "https://github.com/Jonplussed/url-text-histogram"
    , desc = "a toy web-app for learning the WAI and Conduit libraries"
    }
