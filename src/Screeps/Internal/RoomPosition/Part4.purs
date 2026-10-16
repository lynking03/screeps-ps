module Screeps.Internal.RoomPosition.Part4
  ( PathStep
  , FindPathOpts
  , findPathTo
  , findPathTo'
  , findPathToXY
  , findPathToXY'
  , getDirectionTo
  , getDirectionToXY
  , getRangeTo
  , getRangeToXY
  ) where

import Data.Function.Uncurried (Fn2, Fn3, runFn2, runFn3)
import Effect (Effect)
import Effect.Uncurried (EffectFn3, EffectFn4, runEffectFn3, runEffectFn4)
import Prim.Row (class Union)
import Screeps.Constants (DirectionConstant)
import Screeps.Types (RoomPosition, class HasPos)

-- | One step of a path returned by `findPathTo`.
type PathStep =
  { x :: Int
  , y :: Int
  , dx :: Int
  , dy :: Int
  , direction :: DirectionConstant
  }

-- findPathTo 'x, y, [opts]|target, [opts]' → 2 variants × opts 2 × 1 = 4 functions
type FindPathOpts = ( maxOps :: Int, ignoreDestructibleStructures :: Boolean )
-- NOTE: opts are the Room.findPath options; only the fields shown in the
-- examples of this spec are bound. Remaining fields are not listed in this spec.

foreign import findPathToImpl :: forall t r. EffectFn3 RoomPosition t (Record r) (Array PathStep)
foreign import findPathToXYImpl :: forall r. EffectFn4 RoomPosition Int Int (Record r) (Array PathStep)

-- | Find an optimal path to the specified position using Jump Point Search algorithm.
findPathTo' :: forall t r rest. HasPos t => Union r rest FindPathOpts => RoomPosition -> t -> Record r -> Effect (Array PathStep)
findPathTo' = runEffectFn3 findPathToImpl

-- | Find an optimal path to the specified position using Jump Point Search algorithm.
findPathTo :: forall t. HasPos t => RoomPosition -> t -> Effect (Array PathStep)
findPathTo p t = findPathTo' p t {}

-- | Find an optimal path to the specified position using Jump Point Search algorithm.
findPathToXY' :: forall r rest. Union r rest FindPathOpts => RoomPosition -> Int -> Int -> Record r -> Effect (Array PathStep)
findPathToXY' = runEffectFn4 findPathToXYImpl

-- | Find an optimal path to the specified position using Jump Point Search algorithm.
findPathToXY :: RoomPosition -> Int -> Int -> Effect (Array PathStep)
findPathToXY p x y = findPathToXY' p x y {}

-- getDirectionTo 'x,y|target' → 2 variants × 1 = 2 functions
foreign import getDirectionToImpl :: forall t. Fn2 RoomPosition t DirectionConstant
foreign import getDirectionToXYImpl :: Fn3 RoomPosition Int Int DirectionConstant

-- | Get linear direction to the specified position.
getDirectionTo :: forall t. HasPos t => RoomPosition -> t -> DirectionConstant
getDirectionTo = runFn2 getDirectionToImpl

-- | Get linear direction to the specified position.
getDirectionToXY :: RoomPosition -> Int -> Int -> DirectionConstant
getDirectionToXY = runFn3 getDirectionToXYImpl

-- getRangeTo 'x,y|target' → 2 variants × 1 = 2 functions
foreign import getRangeToImpl :: forall t. Fn2 RoomPosition t Int
foreign import getRangeToXYImpl :: Fn3 RoomPosition Int Int Int

-- | Get linear range to the specified position.
getRangeTo :: forall t. HasPos t => RoomPosition -> t -> Int
getRangeTo = runFn2 getRangeToImpl

-- | Get linear range to the specified position.
getRangeToXY :: RoomPosition -> Int -> Int -> Int
getRangeToXY = runFn3 getRangeToXYImpl
