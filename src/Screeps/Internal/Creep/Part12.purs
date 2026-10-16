module Screeps.Internal.Creep.Part12
  ( repair
  , reserveController
  , say
  , sayPublic
  ) where

import Effect (Effect)
import Effect.Uncurried (EffectFn2, EffectFn3, runEffectFn2, runEffectFn3)
import Screeps.Constants (ReturnCode)
import Screeps.Types (Creep, class IsStructure, StructureController)

-- repair 'target' → 1 variant × 1 × 1 = 1 function
foreign import repairImpl :: forall s. EffectFn2 Creep s ReturnCode

-- | Repair a damaged structure using carried energy.
repair :: forall s. IsStructure s => Creep -> s -> Effect ReturnCode
repair = runEffectFn2 repairImpl

-- reserveController 'target' → 1 variant × 1 × 1 = 1 function
foreign import reserveControllerImpl :: EffectFn2 Creep StructureController ReturnCode

-- | Temporarily block a neutral controller from claiming by other players and restore energy sources to their full capacity.
reserveController :: Creep -> StructureController -> Effect ReturnCode
reserveController = runEffectFn2 reserveControllerImpl

-- say 'message, [public]' → 1 variant × 1 × (1 optional + 1) = 2 functions
foreign import sayImpl :: EffectFn2 Creep String ReturnCode
foreign import sayPublicImpl :: EffectFn3 Creep String Boolean ReturnCode

-- | Display a visual speech balloon above the creep with the specified message.
say :: Creep -> String -> Effect ReturnCode
say = runEffectFn2 sayImpl

-- | Display a visual speech balloon above the creep with the specified message, optionally visible to other players.
sayPublic :: Creep -> String -> Boolean -> Effect ReturnCode
sayPublic = runEffectFn3 sayPublicImpl
