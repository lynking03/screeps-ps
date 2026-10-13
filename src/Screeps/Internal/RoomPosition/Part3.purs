module Screeps.Internal.RoomPosition.Part3
  ( FindClosestByPathOpts
  , findClosestByPath
  , findClosestByPath'
  , findClosestByPathObjects
  , findClosestByPathObjects'
  , FindClosestByRangeOpts
  , findClosestByRange
  , findClosestByRange'
  , findClosestByRangeObjects
  , findClosestByRangeObjects'
  , FindInRangeOpts
  , findInRange
  , findInRange'
  , findInRangeObjects
  , findInRangeObjects'
  ) where

import Prelude (map)
import Data.Maybe (Maybe)
import Data.Nullable (Nullable, toMaybe)
import Effect (Effect)
import Effect.Uncurried (EffectFn3, EffectFn4, runEffectFn3, runEffectFn4)
import Prim.Row (class Union)
import Screeps.Constants (FindConstant)
import Screeps.Types (RoomPosition, class HasPos)

-- findClosestByPath 'type, [opts]|objects, [opts]' → 2 variants × opts 2 × 1 = 4 functions
type FindClosestByPathOpts a =
  ( filter :: a -> Boolean
  , algorithm :: String
  )
-- NOTE: filter accepts the function form only (object and string forms omitted)
-- NOTE: algorithm is the literal "astar" or "dijkstra"; no constant type exists for it
-- NOTE: also accepts Room.findPath's options (e.g. maxOps), not bound here

foreign import findClosestByPathImpl :: forall a r. EffectFn3 RoomPosition (FindConstant a) (Record r) (Nullable a)
foreign import findClosestByPathObjectsImpl :: forall t r. EffectFn3 RoomPosition (Array t) (Record r) (Nullable t)

-- | Find an object with the shortest path from the given position.
findClosestByPath' :: forall a r rest. Union r rest (FindClosestByPathOpts a) => RoomPosition -> FindConstant a -> Record r -> Effect (Maybe a)
findClosestByPath' p t o = map toMaybe (runEffectFn3 findClosestByPathImpl p t o)

-- | Find an object with the shortest path from the given position.
findClosestByPath :: forall a. RoomPosition -> FindConstant a -> Effect (Maybe a)
findClosestByPath p t = findClosestByPath' p t {}

-- | Find an object with the shortest path from the given position.
findClosestByPathObjects' :: forall t r rest. HasPos t => Union r rest (FindClosestByPathOpts t) => RoomPosition -> Array t -> Record r -> Effect (Maybe t)
findClosestByPathObjects' p ts o = map toMaybe (runEffectFn3 findClosestByPathObjectsImpl p ts o)

-- | Find an object with the shortest path from the given position.
findClosestByPathObjects :: forall t. HasPos t => RoomPosition -> Array t -> Effect (Maybe t)
findClosestByPathObjects p ts = findClosestByPathObjects' p ts {}

-- findClosestByRange 'type, [opts]|objects, [opts]' → 2 variants × opts 2 × 1 = 4 functions
type FindClosestByRangeOpts a =
  ( filter :: a -> Boolean
  )
-- NOTE: filter accepts the function form only (object and string forms omitted)

foreign import findClosestByRangeImpl :: forall a r. EffectFn3 RoomPosition (FindConstant a) (Record r) (Nullable a)
foreign import findClosestByRangeObjectsImpl :: forall t r. EffectFn3 RoomPosition (Array t) (Record r) (Nullable t)

-- | Find an object with the shortest linear distance from the given position.
findClosestByRange' :: forall a r rest. Union r rest (FindClosestByRangeOpts a) => RoomPosition -> FindConstant a -> Record r -> Effect (Maybe a)
findClosestByRange' p t o = map toMaybe (runEffectFn3 findClosestByRangeImpl p t o)

-- | Find an object with the shortest linear distance from the given position.
findClosestByRange :: forall a. RoomPosition -> FindConstant a -> Effect (Maybe a)
findClosestByRange p t = findClosestByRange' p t {}

-- | Find an object with the shortest linear distance from the given position.
findClosestByRangeObjects' :: forall t r rest. HasPos t => Union r rest (FindClosestByRangeOpts t) => RoomPosition -> Array t -> Record r -> Effect (Maybe t)
findClosestByRangeObjects' p ts o = map toMaybe (runEffectFn3 findClosestByRangeObjectsImpl p ts o)

-- | Find an object with the shortest linear distance from the given position.
findClosestByRangeObjects :: forall t. HasPos t => RoomPosition -> Array t -> Effect (Maybe t)
findClosestByRangeObjects p ts = findClosestByRangeObjects' p ts {}

-- findInRange 'type, range, [opts]|objects, range, [opts]' → 2 variants × opts 2 × 1 = 4 functions
type FindInRangeOpts a =
  ( filter :: a -> Boolean
  )
-- NOTE: opts is Room.find's options; only filter is bound (function form only)

foreign import findInRangeImpl :: forall a r. EffectFn4 RoomPosition (FindConstant a) Int (Record r) (Array a)
foreign import findInRangeObjectsImpl :: forall t r. EffectFn4 RoomPosition (Array t) Int (Record r) (Array t)

-- | Find all objects in the specified linear range.
findInRange' :: forall a r rest. Union r rest (FindInRangeOpts a) => RoomPosition -> FindConstant a -> Int -> Record r -> Effect (Array a)
findInRange' p t n o = runEffectFn4 findInRangeImpl p t n o

-- | Find all objects in the specified linear range.
findInRange :: forall a. RoomPosition -> FindConstant a -> Int -> Effect (Array a)
findInRange p t n = findInRange' p t n {}

-- | Find all objects in the specified linear range.
findInRangeObjects' :: forall t r rest. HasPos t => Union r rest (FindInRangeOpts t) => RoomPosition -> Array t -> Int -> Record r -> Effect (Array t)
findInRangeObjects' p ts n o = runEffectFn4 findInRangeObjectsImpl p ts n o

-- | Find all objects in the specified linear range.
findInRangeObjects :: forall t. HasPos t => RoomPosition -> Array t -> Int -> Effect (Array t)
findInRangeObjects p ts n = findInRangeObjects' p ts n {}
