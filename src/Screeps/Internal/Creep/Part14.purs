module Screeps.Internal.Creep.Part14
  ( upgradeController
  , withdraw
  , withdrawAmount
  ) where

import Effect (Effect)
import Effect.Uncurried (EffectFn2, EffectFn3, EffectFn4, runEffectFn2, runEffectFn3, runEffectFn4)
import Screeps.Constants (ResourceConstant, ReturnCode)
import Screeps.Types (Creep, class IsRoomObject, StructureController)

-- upgradeController 'target' → 1 variant × 1 × 1 = 1 function
foreign import upgradeControllerImpl :: EffectFn2 Creep StructureController ReturnCode

-- | Upgrade your controller to the next level using carried energy.
upgradeController :: Creep -> StructureController -> Effect ReturnCode
upgradeController = runEffectFn2 upgradeControllerImpl

-- withdraw 'target, resourceType, [amount]' → 1 variant × 1 × (1 optional + 1) = 2 functions
-- NOTE: target accepts Structure, Tombstone, Ruin; IsRoomObject is the nearest shared class
foreign import withdrawImpl :: forall t. EffectFn3 Creep t ResourceConstant ReturnCode
foreign import withdrawAmountImpl :: forall t. EffectFn4 Creep t ResourceConstant Int ReturnCode

-- | Withdraw resources from a structure or tombstone.
withdraw :: forall t. IsRoomObject t => Creep -> t -> ResourceConstant -> Effect ReturnCode
withdraw = runEffectFn3 withdrawImpl

-- | Withdraw resources from a structure or tombstone.
withdrawAmount :: forall t. IsRoomObject t => Creep -> t -> ResourceConstant -> Int -> Effect ReturnCode
withdrawAmount = runEffectFn4 withdrawAmountImpl
