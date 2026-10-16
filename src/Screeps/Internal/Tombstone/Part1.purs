module Screeps.Internal.Tombstone.Part1
  ( creep
  , deathTime
  , id
  ) where

import Screeps.Types (Tombstone, AnyCreep)

-- | An object containing the deceased creep or power creep.
foreign import creep :: Tombstone -> AnyCreep

-- | Time of death.
foreign import deathTime :: Tombstone -> Int

-- | A unique object identificator. You can use Game.getObjectById method to retrieve an object instance by its id.
foreign import id :: Tombstone -> String
