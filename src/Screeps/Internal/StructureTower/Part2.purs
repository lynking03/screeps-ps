module Screeps.Internal.StructureTower.Part2
  ( repair
  ) where

import Effect (Effect)
import Effect.Uncurried (EffectFn2, runEffectFn2)
import Screeps.Constants (ReturnCode)
import Screeps.Types (StructureTower, class IsStructure)

foreign import repairImpl :: forall s. EffectFn2 StructureTower s ReturnCode

-- | Remotely repair any structure in the room.
repair :: forall s. IsStructure s => StructureTower -> s -> Effect ReturnCode
repair = runEffectFn2 repairImpl
