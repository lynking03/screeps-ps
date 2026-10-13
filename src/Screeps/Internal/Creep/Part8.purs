module Screeps.Internal.Creep.Part8
  ( getActiveBodyparts
  , harvest
  , heal
  ) where

import Data.Function.Uncurried (Fn2, runFn2)
import Effect (Effect)
import Effect.Uncurried (EffectFn2, runEffectFn2)
import Screeps.Constants (BodyPartConstant, ReturnCode)
import Screeps.Types (Creep, class IsCreep, class IsRoomObject)

foreign import getActiveBodypartsImpl :: Fn2 Creep BodyPartConstant Int

-- | Get the quantity of live body parts of the given type.
getActiveBodyparts :: Creep -> BodyPartConstant -> Int
getActiveBodyparts = runFn2 getActiveBodypartsImpl

foreign import harvestImpl :: forall t. EffectFn2 Creep t ReturnCode

-- NOTE: accepts Source, Mineral, Deposit
-- | Harvest energy from the source or resources from minerals and deposits.
harvest :: forall t. IsRoomObject t => Creep -> t -> Effect ReturnCode
harvest = runEffectFn2 harvestImpl

foreign import healImpl :: forall t. EffectFn2 Creep t ReturnCode

-- NOTE: accepts Creep, PowerCreep
-- | Heal self or another creep.
heal :: forall t. IsCreep t => Creep -> t -> Effect ReturnCode
heal = runEffectFn2 healImpl
