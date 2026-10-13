module Screeps.Internal.PowerCreep.Part11
  ( suicide
  , transfer
  , transferAmount
  , upgrade
  ) where

import Effect (Effect)
import Effect.Uncurried (EffectFn1, EffectFn2, EffectFn3, EffectFn4, runEffectFn1, runEffectFn2, runEffectFn3, runEffectFn4)
import Screeps.Constants (PowerConstant, ResourceConstant, ReturnCode)
import Screeps.Types (PowerCreep, class IsRoomObject)

-- suicide '' → 1 variant × 1 × 1 = 1 function
foreign import suicideImpl :: EffectFn1 PowerCreep ReturnCode

-- | Kill the power creep immediately.
-- NOTE: no example for this overload
suicide :: PowerCreep -> Effect ReturnCode
suicide = runEffectFn1 suicideImpl

-- transfer 'target, resourceType, [amount]' → 1 variant × 1 × (1 optional + 1) = 2 functions
-- NOTE: accepts Creep, PowerCreep, Structure
foreign import transferImpl :: forall t. EffectFn3 PowerCreep t ResourceConstant ReturnCode
foreign import transferAmountImpl :: forall t. EffectFn4 PowerCreep t ResourceConstant Int ReturnCode

-- | Transfer resource from the creep to another object.
transfer :: forall t. IsRoomObject t => PowerCreep -> t -> ResourceConstant -> Effect ReturnCode
transfer = runEffectFn3 transferImpl

-- | Transfer resource from the creep to another object.
-- NOTE: no example for this overload
transferAmount :: forall t. IsRoomObject t => PowerCreep -> t -> ResourceConstant -> Int -> Effect ReturnCode
transferAmount = runEffectFn4 transferAmountImpl

-- upgrade 'power' → 1 variant × 1 × 1 = 1 function
foreign import upgradeImpl :: EffectFn2 PowerCreep PowerConstant ReturnCode

-- | Upgrade the creep, adding a new power ability to it or increasing level of the existing power.
upgrade :: PowerCreep -> PowerConstant -> Effect ReturnCode
upgrade = runEffectFn2 upgradeImpl
