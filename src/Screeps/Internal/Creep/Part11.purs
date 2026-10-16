module Screeps.Internal.Creep.Part11
  ( rangedAttack
  , rangedHeal
  , rangedMassAttack
  ) where

import Effect (Effect)
import Effect.Uncurried (EffectFn1, EffectFn2, runEffectFn1, runEffectFn2)
import Screeps.Constants (ReturnCode)
import Screeps.Types (Creep, class IsCreep, class IsRoomObject)

foreign import rangedAttackImpl :: forall t. EffectFn2 Creep t ReturnCode
foreign import rangedHealImpl :: forall t. EffectFn2 Creep t ReturnCode
foreign import rangedMassAttackImpl :: EffectFn1 Creep ReturnCode

-- | A ranged attack against another creep or structure. If the target is inside a rampart, the rampart is attacked instead.
-- NOTE: accepts Creep, PowerCreep, Structure
rangedAttack :: forall t. IsRoomObject t => Creep -> t -> Effect ReturnCode
rangedAttack = runEffectFn2 rangedAttackImpl

-- | Heal another creep at a distance. It will restore the target creep's damaged body parts and increase the hits counter.
-- NOTE: accepts Creep, PowerCreep
rangedHeal :: forall t. IsCreep t => Creep -> t -> Effect ReturnCode
rangedHeal = runEffectFn2 rangedHealImpl

-- | A ranged attack against all hostile creeps or structures within 3 squares range.
rangedMassAttack :: Creep -> Effect ReturnCode
rangedMassAttack = runEffectFn1 rangedMassAttackImpl
