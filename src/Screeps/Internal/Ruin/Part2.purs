module Screeps.Internal.Ruin.Part2
  ( structure
  , ticksToDecay
  ) where

import Screeps.Types (Ruin, Structure)

-- | An object containing basic data of the destroyed structure.
foreign import structure :: Ruin -> Structure

-- | The amount of game ticks before this ruin decays.
foreign import ticksToDecay :: Ruin -> Int
