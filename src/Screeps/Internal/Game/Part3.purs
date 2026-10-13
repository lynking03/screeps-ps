module Screeps.Internal.Game.Part3
  ( map
  , market
  , powerCreeps
  ) where

import Effect (Effect)
import Foreign (Foreign)
import Foreign.Object (Object)
import Screeps.Types (PowerCreep)

-- | A global object representing world map.
-- NOTE: no GameMap type exists in Screeps.Types; returned as Foreign
foreign import map :: Effect Foreign

-- | A global object representing the in-game market.
-- NOTE: no Market type exists in Screeps.Types; returned as Foreign
foreign import market :: Effect Foreign

-- | A hash containing all your power creeps with their names as hash keys.
foreign import powerCreeps :: Effect (Object PowerCreep)
