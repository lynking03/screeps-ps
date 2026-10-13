module Screeps.Internal.PowerCreep.Part12
  ( usePower
  , usePowerTarget
  , withdraw
  , withdrawAmount
  ) where

import Effect (Effect)
import Effect.Uncurried (EffectFn2, EffectFn3, EffectFn4, runEffectFn2, runEffectFn3, runEffectFn4)
import Screeps.Constants (PowerConstant, ResourceConstant, ReturnCode)
import Screeps.Types (PowerCreep, class IsRoomObject)

-- usePower 'power, [target]' → 1 variant × 1 × (1 optional + 1) = 2 functions
foreign import usePowerImpl :: EffectFn2 PowerCreep PowerConstant ReturnCode
foreign import usePowerTargetImpl :: forall t. EffectFn3 PowerCreep PowerConstant t ReturnCode

-- | Apply one of the creep's powers on the specified target.
usePower :: PowerCreep -> PowerConstant -> Effect ReturnCode
usePower = runEffectFn2 usePowerImpl

-- | Apply one of the creep's powers on the specified target.
usePowerTarget :: forall t. IsRoomObject t => PowerCreep -> PowerConstant -> t -> Effect ReturnCode
usePowerTarget = runEffectFn3 usePowerTargetImpl

-- withdraw 'target, resourceType, [amount]' → 1 variant × 1 × (1 optional + 1) = 2 functions
-- NOTE: target accepts Structure, Tombstone, Ruin; nearest shared class IsRoomObject used
foreign import withdrawImpl :: forall t. EffectFn3 PowerCreep t ResourceConstant ReturnCode
foreign import withdrawAmountImpl :: forall t. EffectFn4 PowerCreep t ResourceConstant Int ReturnCode

-- | Withdraw resources from a structure or tombstone.
withdraw :: forall t. IsRoomObject t => PowerCreep -> t -> ResourceConstant -> Effect ReturnCode
withdraw = runEffectFn3 withdrawImpl

-- | Withdraw resources from a structure or tombstone.
withdrawAmount :: forall t. IsRoomObject t => PowerCreep -> t -> ResourceConstant -> Int -> Effect ReturnCode
withdrawAmount = runEffectFn4 withdrawAmountImpl
