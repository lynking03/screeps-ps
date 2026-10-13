module Screeps.Internal.Game.Part1
  ( constructionSites
  , cpu
  , creeps
  ) where

import Effect (Effect)
import Foreign (Foreign)
import Foreign.Object (Object)
import Screeps.Types (ConstructionSite, Creep)

-- | A hash containing all your construction sites with their id as hash keys.
foreign import constructionSites :: Effect (Object ConstructionSite)

-- | A global object containing information about your CPU usage and methods.
-- NOTE: the cpu object's fields are not listed in the spec; returned as Foreign
foreign import cpu :: Effect Foreign

-- | A hash containing all your creeps with creep names as hash keys.
foreign import creeps :: Effect (Object Creep)
