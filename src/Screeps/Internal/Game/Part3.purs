module Screeps.Internal.Game.Part3
  ( powerCreeps
  ) where

import Effect (Effect)
import Foreign (Foreign)
import Foreign.Object (Object)
import Screeps.Types (PowerCreep)

-- | A hash containing all your power creeps with their names as hash keys.
foreign import powerCreeps :: Effect (Object PowerCreep)
