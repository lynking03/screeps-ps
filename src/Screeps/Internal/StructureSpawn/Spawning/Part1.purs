module Screeps.Internal.StructureSpawn.Spawning.Part1
  ( directions
  , name
  , needTime
  ) where

import Screeps.Constants (DirectionConstant)
import Screeps.Types (StructureSpawnSpawning)

-- | An array with the spawn directions.
foreign import directions :: StructureSpawnSpawning -> Array DirectionConstant

-- | The name of a new creep.
foreign import name :: StructureSpawnSpawning -> String

-- | Time needed in total to complete the spawning.
foreign import needTime :: StructureSpawnSpawning -> Int
