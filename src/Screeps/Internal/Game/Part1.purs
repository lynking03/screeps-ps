module Screeps.Internal.Game.Part1
  ( constructionSites
  , creeps
  ) where

import Effect (Effect)
import Foreign (Foreign)
import Foreign.Object (Object)
import Screeps.Types (ConstructionSite, Creep)

-- | A hash containing all your construction sites with their id as hash keys.
foreign import constructionSites :: Effect (Object ConstructionSite)

-- | A hash containing all your creeps with creep names as hash keys.
foreign import creeps :: Effect (Object Creep)
