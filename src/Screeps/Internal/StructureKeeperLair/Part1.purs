module Screeps.Internal.StructureKeeperLair.Part1
  ( ticksToSpawn
  ) where

import Screeps.Types (StructureKeeperLair)

-- | Time to spawning of the next Source Keeper.
foreign import ticksToSpawn :: StructureKeeperLair -> Int
