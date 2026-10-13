module Screeps.Internal.RoomPosition.Part5
  ( inRangeTo
  , inRangeToXY
  , isEqualTo
  , isEqualToXY
  , isNearTo
  , isNearToXY
  ) where

import Data.Function.Uncurried (Fn2, Fn3, Fn4, runFn2, runFn3, runFn4)
import Screeps.Types (RoomPosition, class HasPos)

foreign import inRangeToImpl :: forall t. Fn3 RoomPosition t Int Boolean
foreign import inRangeToXYImpl :: Fn4 RoomPosition Int Int Int Boolean

-- | Check whether this position is in the given range of another position.
inRangeTo :: RoomPosition -> RoomPosition -> Int -> Boolean
inRangeTo = runFn3 inRangeToImpl

-- | Check whether this position is in the given range of another position.
inRangeToXY :: RoomPosition -> Int -> Int -> Int -> Boolean
inRangeToXY = runFn4 inRangeToXYImpl

foreign import isEqualToImpl :: forall t. Fn2 RoomPosition t Boolean
foreign import isEqualToXYImpl :: Fn3 RoomPosition Int Int Boolean

-- | Check whether this position is the same as the specified position.
isEqualTo :: forall t. HasPos t => RoomPosition -> t -> Boolean
isEqualTo = runFn2 isEqualToImpl

-- | Check whether this position is the same as the specified position.
isEqualToXY :: RoomPosition -> Int -> Int -> Boolean
isEqualToXY = runFn3 isEqualToXYImpl

foreign import isNearToImpl :: forall t. Fn2 RoomPosition t Boolean
foreign import isNearToXYImpl :: Fn3 RoomPosition Int Int Boolean

-- | Check whether this position is on the adjacent square to the specified position.
isNearTo :: forall t. HasPos t => RoomPosition -> t -> Boolean
isNearTo = runFn2 isNearToImpl

-- | Check whether this position is on the adjacent square to the specified position.
isNearToXY :: RoomPosition -> Int -> Int -> Boolean
isNearToXY = runFn3 isNearToXYImpl
