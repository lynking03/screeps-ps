module Screeps.Internal.StructureInvaderCore.Part1
  ( level
  , ticksToDeploy
  , spawning
  ) where

import Data.Maybe (Maybe)
import Data.Nullable (Nullable, toMaybe)
import Screeps.Types (StructureInvaderCore, StructureSpawnSpawning)

foreign import levelImpl :: StructureInvaderCore -> Int
foreign import ticksToDeployImpl :: StructureInvaderCore -> Nullable Int
foreign import spawningImpl :: StructureInvaderCore -> Nullable StructureSpawnSpawning

-- | The level of the stronghold. The amount and quality of the loot depends on the level.
level :: StructureInvaderCore -> Int
level = levelImpl

-- | Shows the timer for a not yet deployed stronghold, undefined otherwise.
ticksToDeploy :: StructureInvaderCore -> Maybe Int
ticksToDeploy c = toMaybe (ticksToDeployImpl c)

-- | If the core is in process of spawning a new creep, this object will contain a spawning object, or null otherwise.
spawning :: StructureInvaderCore -> Maybe StructureSpawnSpawning
spawning c = toMaybe (spawningImpl c)
