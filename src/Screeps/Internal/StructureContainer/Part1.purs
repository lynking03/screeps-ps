module Screeps.Internal.StructureContainer.Part1
  ( store
  , ticksToDecay
  ) where

import Screeps.Types (StructureContainer, Store)

-- | A `Store` object that contains cargo of this structure.
foreign import store :: StructureContainer -> Store

-- | The amount of game ticks when this container will lose some hit points.
foreign import ticksToDecay :: StructureContainer -> Int
