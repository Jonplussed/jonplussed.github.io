{-# LANGUAGE OverloadedStrings #-}

module Resume.Content.Biography
( Biography
, biography
) where

import Data.Text as Text

import qualified Text.Blaze.Html5 as Tag

newtype Biography = Biography Text

instance Tag.ToMarkup Biography where
  toMarkup (Biography text) = Tag.p $ Tag.preEscapedText text

biography :: Biography
biography = Biography
  "Relevant to software, I have three passions: tooling, data, and \
  \the web&mdash; the web because of its unparalled ability to \
  \distribute information, and data because the proper analysis and \
  \presentation of allows people to make informed&mdash; and therefore \
  \better&mdash; decisions. Tooling&mdash; so contentious!&mdash; is \
  \more a matter or priority, and my priority is this: I desire to \
  \craft software that is correct, readable, elegant, and performant, \
  \and no language provides me this capability as does Haskell (and \
  \associated PureScript, Elm, etc)&mdash; the basis for my current \
  \and future endeavors."
