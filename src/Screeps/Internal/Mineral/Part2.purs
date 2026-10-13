module Screeps.Internal.Mineral.Part2
  ( id
  , ticksToRegeneration
  ) where

import Screeps.Types (Mineral)

-- | A unique object identificator. You can use Game.getObjectById method to retrieve an object instance by its id.
foreign import id :: Mineral -> String

-- | The remaining time after which the deposit will be refilled.
foreign import ticksToRegeneration :: Mineral -> Int
