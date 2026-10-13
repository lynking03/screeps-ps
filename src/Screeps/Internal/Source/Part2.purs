module Screeps.Internal.Source.Part2
  ( ticksToRegeneration
  ) where

import Screeps.Types (Source)

-- | The remaining time after which the source will be refilled.
foreign import ticksToRegeneration :: Source -> Int
