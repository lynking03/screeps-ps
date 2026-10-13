module Screeps.Internal.PowerCreep.Part10
  ( renew
  , say
  , sayPublic
  , spawn
  ) where

import Effect (Effect)
import Effect.Uncurried (EffectFn2, EffectFn3, runEffectFn2, runEffectFn3)
import Screeps.Constants (ReturnCode)
import Screeps.Types (PowerCreep, StructurePowerSpawn, class IsOwnedStructure)

-- | Instantly restore time to live to the maximum using a Power Spawn or a Power Bank nearby.
-- NOTE: target accepts StructurePowerBank or StructurePowerSpawn; bound as IsOwnedStructure
foreign import renewImpl :: forall t. EffectFn2 PowerCreep t ReturnCode

-- | Instantly restore time to live to the maximum using a Power Spawn or a Power Bank nearby.
-- NOTE: target accepts StructurePowerBank or StructurePowerSpawn; bound as IsOwnedStructure
renew :: forall t. IsOwnedStructure t => PowerCreep -> t -> Effect ReturnCode
renew = runEffectFn2 renewImpl

-- say 'message, [public]' → 1 variant × 1 × (1 optional + 1) = 2 functions
foreign import sayImpl :: EffectFn2 PowerCreep String ReturnCode
foreign import sayPublicImpl :: EffectFn3 PowerCreep String Boolean ReturnCode

-- | Display a visual speech balloon above the power creep with the specified message.
say :: PowerCreep -> String -> Effect ReturnCode
say = runEffectFn2 sayImpl

-- | Display a visual speech balloon above the power creep with the specified message.
sayPublic :: PowerCreep -> String -> Boolean -> Effect ReturnCode
sayPublic = runEffectFn3 sayPublicImpl

foreign import spawnImpl :: EffectFn2 PowerCreep StructurePowerSpawn ReturnCode

-- | Spawn this power creep in the specified Power Spawn.
spawn :: PowerCreep -> StructurePowerSpawn -> Effect ReturnCode
spawn = runEffectFn2 spawnImpl
