module Screeps.Internal.Creep.Part11
  ( rangedAttack
  , rangedHeal
  , rangedMassAttack
  ) where

import Effect (Effect)
import Effect.Uncurried (EffectFn1, EffectFn2, runEffectFn1, runEffectFn2)
import Screeps.Constants (ReturnCode)
import Screeps.Types (Creep)

foreign import rangedAttackImpl :: EffectFn2 Creep Creep ReturnCode
foreign import rangedHealImpl :: EffectFn2 Creep Creep ReturnCode
foreign import rangedMassAttackImpl :: EffectFn1 Creep ReturnCode

-- | A ranged attack against another creep. Requires the RANGED_ATTACK body part.
-- NOTE: target should accept Creep, PowerCreep, Structure; IsRoomObject is missing from Screeps.Types, so target is narrowed to Creep
rangedAttack :: Creep -> Creep -> Effect ReturnCode
rangedAttack = runEffectFn2 rangedAttackImpl

-- | Heal another creep at a distance. Requires the HEAL body part.
-- NOTE: target should accept Creep, PowerCreep; IsCreep is missing from Screeps.Types, so target is narrowed to Creep
rangedHeal :: Creep -> Creep -> Effect ReturnCode
rangedHeal = runEffectFn2 rangedHealImpl

-- | A ranged attack against all hostile creeps or structures within 3 squares range. Requires the RANGED_ATTACK body part.
rangedMassAttack :: Creep -> Effect ReturnCode
rangedMassAttack = runEffectFn1 rangedMassAttackImpl
