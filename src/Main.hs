module Main (main) where

import Resume.Template (webpage)
import Text.Blaze.Renderer.Text (renderMarkup)

import qualified Data.Text.Lazy.IO as Text

main :: IO ()
main = Text.writeFile "index.html" $ renderMarkup webpage
