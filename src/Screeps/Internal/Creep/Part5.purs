module Screeps.Internal.Creep.Part5
  ( ticksToLive
  , attack
  , attackController
  ) where

import Effect (Effect)
import Effect.Uncurried (EffectFn2, runEffectFn2)
import Screeps.Constants (ReturnCode)
import Screeps.Types (Creep, StructureController, class IsRoomObject)

-- | The remaining amount of game ticks after which the creep will die.
foreign import ticksToLive :: Creep -> Int

-- attack 'target' → 1 variant × 1 × 1 = 1 function
foreign import attackImpl :: forall t. EffectFn2 Creep t ReturnCode

-- NOTE: accepts Creep, PowerCreep, Structure
-- | Attack another creep, power creep, or structure in a short-ranged attack.
attack :: forall t. IsRoomObject t => Creep -> t -> Effect ReturnCode
attack = runEffectFn2 attackImpl

-- attackController 'target' → 1 variant × 1 × 1 = 1 function
foreign import attackControllerImpl :: EffectFn2 Creep StructureController ReturnCode

-- | Decreases the controller's downgrade timer by 300 ticks per every CLAIM body part, or reservation timer by 1 tick per every CLAIM body part.
attackController :: Creep -> StructureController -> Effect ReturnCode
attackController = runEffectFn2 attackControllerImpl
