module Screeps.Internal.Creep.Part13
  ( signController
  , suicide
  , transfer
  , transferAmount
  ) where

import Effect (Effect)
import Effect.Uncurried (EffectFn1, EffectFn3, EffectFn4, runEffectFn1, runEffectFn3, runEffectFn4)
import Screeps.Constants (ResourceConstant, ReturnCode)
import Screeps.Types (Creep, StructureController, class IsRoomObject)

foreign import signControllerImpl :: EffectFn3 Creep StructureController String ReturnCode

-- | Sign a controller with an arbitrary text visible to all players.
signController :: Creep -> StructureController -> String -> Effect ReturnCode
signController = runEffectFn3 signControllerImpl

foreign import suicideImpl :: EffectFn1 Creep ReturnCode

-- | Kill the creep immediately.
suicide :: Creep -> Effect ReturnCode
suicide = runEffectFn1 suicideImpl

-- transfer 'target, resourceType, [amount]' → 1 variant × 1 × (1 optional + 1) = 2 functions
foreign import transferImpl :: forall t. EffectFn3 Creep t ResourceConstant ReturnCode
foreign import transferAmountImpl :: forall t. EffectFn4 Creep t ResourceConstant Int ReturnCode

-- | Transfer resource from the creep to another object.
-- NOTE: accepts Creep, PowerCreep, Structure
transfer :: forall t. IsRoomObject t => Creep -> t -> ResourceConstant -> Effect ReturnCode
transfer = runEffectFn3 transferImpl

-- | Transfer resource from the creep to another object, with a given amount.
-- NOTE: accepts Creep, PowerCreep, Structure
transferAmount :: forall t. IsRoomObject t => Creep -> t -> ResourceConstant -> Int -> Effect ReturnCode
transferAmount = runEffectFn4 transferAmountImpl
