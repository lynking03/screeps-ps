module Screeps.Internal.StructureSpawn.Spawning.Part2
  ( remainingTime
  , spawn
  , cancel
  ) where

import Effect (Effect)
import Effect.Uncurried (EffectFn1, runEffectFn1)
import Screeps.Constants (ReturnCode)
import Screeps.Types (StructureSpawn, StructureSpawnSpawning)

-- | Remaining time to go.
foreign import remainingTime :: StructureSpawnSpawning -> Int

-- | A link to the spawn.
foreign import spawn :: StructureSpawnSpawning -> StructureSpawn

foreign import cancelImpl :: EffectFn1 StructureSpawnSpawning ReturnCode

-- | Cancel spawning immediately. Energy spent on spawning is not returned.
cancel :: StructureSpawnSpawning -> Effect ReturnCode
cancel = runEffectFn1 cancelImpl
