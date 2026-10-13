module Screeps.Internal.Source.Part1
  ( energy
  , energyCapacity
  , id
  ) where

import Screeps.Types (Source)

-- | The remaining amount of energy.
foreign import energy :: Source -> Int

-- | The total amount of energy in the source.
foreign import energyCapacity :: Source -> Int

-- | A unique object identificator. You can use Game.getObjectById method to retrieve an object instance by its id.
foreign import id :: Source -> String
