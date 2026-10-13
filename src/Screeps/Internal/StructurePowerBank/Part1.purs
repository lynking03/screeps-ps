module Screeps.Internal.StructurePowerBank.Part1
  ( power
  , ticksToDecay
  ) where

import Screeps.Types (StructurePowerBank)

-- | The amount of power containing.
foreign import power :: StructurePowerBank -> Int

-- | The amount of game ticks when this structure will disappear.
foreign import ticksToDecay :: StructurePowerBank -> Int
