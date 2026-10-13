module Screeps.Internal.PathFinder.CostMatrix.Part1
  ( newCostMatrix
  , set
  , get
  ) where

import Prelude (Unit)
import Effect (Effect)
import Data.Function.Uncurried (Fn3, runFn3)
import Effect.Uncurried (EffectFn4, runEffectFn4)
import Screeps.Types (CostMatrix)

-- | Creates a new CostMatrix containing 0's for all positions.
foreign import newCostMatrix :: Effect CostMatrix

foreign import setImpl :: EffectFn4 CostMatrix Int Int Int Unit
foreign import getImpl :: Fn3 CostMatrix Int Int Int

-- | Set the cost of a position in this CostMatrix.
set :: CostMatrix -> Int -> Int -> Int -> Effect Unit
set = runEffectFn4 setImpl

-- | Get the cost of a position in this CostMatrix.
get :: CostMatrix -> Int -> Int -> Int
get = runFn3 getImpl
