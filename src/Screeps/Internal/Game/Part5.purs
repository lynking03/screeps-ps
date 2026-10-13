module Screeps.Internal.Game.Part5
  ( spawns
  , structures
  , time
  ) where

import Effect (Effect)
import Foreign.Object (Object)
import Screeps.Types (Structure, StructureSpawn)

-- | A hash containing all your spawns with spawn names as hash keys.
foreign import spawns :: Effect (Object StructureSpawn)

-- | A hash containing all your structures with structure id as hash keys.
foreign import structures :: Effect (Object Structure)

-- | System game tick counter. It is automatically incremented on every tick.
foreign import time :: Effect Int
