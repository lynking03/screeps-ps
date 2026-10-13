module Screeps.Internal.PathFinder.CostMatrix.Part2
  ( clone
  , serialize
  , deserialize
  ) where

import Effect (Effect)
import Effect.Uncurried (EffectFn1, runEffectFn1)
import Foreign (Foreign)
import Screeps.Types (CostMatrix)

foreign import cloneImpl :: EffectFn1 CostMatrix CostMatrix

-- | Copy this CostMatrix into a new CostMatrix with the same data.
clone :: CostMatrix -> Effect CostMatrix
clone = runEffectFn1 cloneImpl

foreign import serialize :: CostMatrix -> Array Int

foreign import deserializeImpl :: EffectFn1 Foreign CostMatrix

-- | Deserialize a new CostMatrix using the return value of serialize.
deserialize :: Foreign -> Effect CostMatrix
deserialize = runEffectFn1 deserializeImpl
