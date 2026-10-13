module Screeps.Internal.StructureSpawn.Spawning.Part3
  ( setDirections
  ) where

import Effect (Effect)
import Effect.Uncurried (EffectFn2, runEffectFn2)
import Screeps.Constants (DirectionConstant, ReturnCode)
import Screeps.Types (StructureSpawnSpawning)

foreign import setDirectionsImpl :: EffectFn2 StructureSpawnSpawning (Array DirectionConstant) ReturnCode

-- | Set desired directions where the creep should move when spawned.
setDirections :: StructureSpawnSpawning -> Array DirectionConstant -> Effect ReturnCode
setDirections = runEffectFn2 setDirectionsImpl
