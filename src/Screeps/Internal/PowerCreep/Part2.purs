module Screeps.Internal.PowerCreep.Part2
  ( hits
  , hitsMax
  , id
  ) where

import Screeps.Types (PowerCreep)

-- | The current amount of hit points of the creep.
foreign import hits :: PowerCreep -> Int

-- | The maximum amount of hit points of the creep.
foreign import hitsMax :: PowerCreep -> Int

-- | A unique object identificator. You can use Game.getObjectById method to retrieve an object instance by its id.
foreign import id :: PowerCreep -> String
