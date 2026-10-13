module Screeps.Internal.Tombstone.Part2
  ( store
  , ticksToDecay
  ) where

import Screeps.Types (Store, Tombstone)

-- | A Store object that contains cargo of this tombstone.
foreign import store :: Tombstone -> Store

-- | The amount of game ticks before this tombstone decays.
foreign import ticksToDecay :: Tombstone -> Int
