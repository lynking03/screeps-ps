module Screeps.Internal.Creep.Part7
  ( dismantle
  , drop
  , dropAmount
  , generateSafeMode
  ) where

import Effect (Effect)
import Effect.Uncurried (EffectFn2, EffectFn3, runEffectFn2, runEffectFn3)
import Screeps.Constants (ResourceConstant, ReturnCode)
import Screeps.Types (Creep, class IsStructure, StructureController)

foreign import dismantleImpl :: forall s. EffectFn2 Creep s ReturnCode

-- | Dismantles any structure that can be constructed (even hostile) returning 50% of the energy spent on its repair.
dismantle :: forall s. IsStructure s => Creep -> s -> Effect ReturnCode
dismantle = runEffectFn2 dismantleImpl

-- drop 'resourceType, [amount]' → 1 variant × 1 × (1 optional + 1) = 2 functions
foreign import dropImpl :: EffectFn2 Creep ResourceConstant ReturnCode
foreign import dropAmountImpl :: EffectFn3 Creep ResourceConstant Int ReturnCode

-- | Drop this resource on the ground.
drop :: Creep -> ResourceConstant -> Effect ReturnCode
drop = runEffectFn2 dropImpl

-- | Drop this resource on the ground, with an explicit amount.
dropAmount :: Creep -> ResourceConstant -> Int -> Effect ReturnCode
dropAmount = runEffectFn3 dropAmountImpl

foreign import generateSafeModeImpl :: EffectFn2 Creep StructureController ReturnCode

-- | Add one more available safe mode activation to a room controller.
generateSafeMode :: Creep -> StructureController -> Effect ReturnCode
generateSafeMode = runEffectFn2 generateSafeModeImpl
