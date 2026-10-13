module Screeps.Internal.Structure.Part2
  ( structureType
  , destroy
  , isActive
  ) where

import Effect (Effect)
import Effect.Uncurried (EffectFn1, runEffectFn1)
import Screeps.Constants (ReturnCode, StructureConstant)
import Screeps.Types (class IsStructure)

foreign import structureTypeImpl :: forall s. s -> StructureConstant

-- | One of the STRUCTURE_* constants identifying the structure type.
structureType :: forall s. IsStructure s => s -> StructureConstant
structureType = structureTypeImpl

foreign import destroyImpl :: forall s. EffectFn1 s ReturnCode

-- | Destroy this structure immediately.
destroy :: forall s. IsStructure s => s -> Effect ReturnCode
destroy = runEffectFn1 destroyImpl

foreign import isActiveImpl :: forall s. s -> Boolean

-- | Check whether this structure can be used. If room controller level is insufficient, then this method will return false, and the structure will be highlighted with red in the game.
isActive :: forall s. IsStructure s => s -> Boolean
isActive = isActiveImpl
