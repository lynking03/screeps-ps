module Screeps.Internal.StructureRoad.Part1
  ( ticksToDecay
  ) where

import Screeps.Types (StructureRoad)

-- | The amount of game ticks when this road will lose some hit points.
foreign import ticksToDecay :: StructureRoad -> Int
