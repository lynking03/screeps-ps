module Screeps.Internal.StructureSpawn.Part3
  ( renewCreep
  ) where

import Effect (Effect)
import Effect.Uncurried (EffectFn2, runEffectFn2)
import Screeps.Constants (ReturnCode)
import Screeps.Types (Creep, StructureSpawn)

foreign import renewCreepImpl :: EffectFn2 StructureSpawn Creep ReturnCode

-- | Increase the remaining time to live of the target creep.
renewCreep :: StructureSpawn -> Creep -> Effect ReturnCode
renewCreep = runEffectFn2 renewCreepImpl
