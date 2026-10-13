module Screeps.Internal.Deposit.Part2
  ( lastCooldown
  , ticksToDecay
  ) where

import Screeps.Types (Deposit)

-- | The cooldown of the last harvest operation on this deposit.
foreign import lastCooldown :: Deposit -> Int

-- | The amount of game ticks when this deposit will disappear.
foreign import ticksToDecay :: Deposit -> Int
