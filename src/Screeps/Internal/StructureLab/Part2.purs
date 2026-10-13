module Screeps.Internal.StructureLab.Part2
  ( boostCreep
  , boostCreepBodyPartsCount
  , reverseReaction
  , runReaction
  ) where

import Effect (Effect)
import Effect.Uncurried (EffectFn2, EffectFn3, runEffectFn2, runEffectFn3)
import Screeps.Constants (ReturnCode)
import Screeps.Types (Creep, StructureLab)

-- boostCreep 'creep, [bodyPartsCount]' → 1 variant × 1 × (1 optional + 1) = 2 functions
foreign import boostCreepImpl :: EffectFn2 StructureLab Creep ReturnCode
foreign import boostCreepBodyPartsCountImpl :: EffectFn3 StructureLab Creep Int ReturnCode

-- | Boosts creep body parts using the containing mineral compound.
boostCreep :: StructureLab -> Creep -> Effect ReturnCode
boostCreep = runEffectFn2 boostCreepImpl

-- | Boosts creep body parts using the containing mineral compound.
boostCreepBodyPartsCount :: StructureLab -> Creep -> Int -> Effect ReturnCode
boostCreepBodyPartsCount = runEffectFn3 boostCreepBodyPartsCountImpl

-- reverseReaction 'lab1, lab2' → 1 variant × 1 × 1 = 1 function
foreign import reverseReactionImpl :: EffectFn3 StructureLab StructureLab StructureLab ReturnCode

-- | Breaks mineral compounds back into reagents.
reverseReaction :: StructureLab -> StructureLab -> StructureLab -> Effect ReturnCode
reverseReaction = runEffectFn3 reverseReactionImpl

-- runReaction 'lab1, lab2' → 1 variant × 1 × 1 = 1 function
foreign import runReactionImpl :: EffectFn3 StructureLab StructureLab StructureLab ReturnCode

-- | Produce mineral compounds using reagents from two other labs.
runReaction :: StructureLab -> StructureLab -> StructureLab -> Effect ReturnCode
runReaction = runEffectFn3 runReactionImpl
