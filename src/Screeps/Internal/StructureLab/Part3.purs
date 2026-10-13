module Screeps.Internal.StructureLab.Part3
  ( unboostCreep
  ) where

import Effect (Effect)
import Effect.Uncurried (EffectFn2, runEffectFn2)
import Screeps.Constants (ReturnCode)
import Screeps.Types (Creep, StructureLab)

foreign import unboostCreepImpl :: EffectFn2 StructureLab Creep ReturnCode

-- | Immediately remove boosts from the creep and drop 50% of the mineral compounds used to boost it onto the ground regardless of the creep's remaining time to live.
unboostCreep :: StructureLab -> Creep -> Effect ReturnCode
unboostCreep = runEffectFn2 unboostCreepImpl
