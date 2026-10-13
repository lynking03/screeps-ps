module Screeps.Internal.Room.Part7
  ( lookAt
  , lookAtXY
  , lookAtArea
  , lookAtAreaAsArray
  , lookForAt
  , lookForAtXY
  ) where

import Effect (Effect)
import Effect.Uncurried (EffectFn2, EffectFn3, EffectFn4, EffectFn5, EffectFn6, runEffectFn2, runEffectFn3, runEffectFn4, runEffectFn5, runEffectFn6)
import Foreign (Foreign)
import Foreign.Object (Object)
import Screeps.Constants (LookConstant)
import Screeps.Types (Room, class HasPos)

-- lookAt 'x, y|target' → 2 variants × 1 × 1 = 2 functions

foreign import lookAtImpl :: forall t. EffectFn2 Room t (Array Foreign)
foreign import lookAtXYImpl :: EffectFn3 Room Int Int (Array Foreign)

-- | Get the list of objects at the specified room position.
-- NOTE: each element is a tagged object ({ type, creep | structure | terrain | ... }); element format not modeled, use Foreign
lookAt :: forall t. HasPos t => Room -> t -> Effect (Array Foreign)
lookAt = runEffectFn2 lookAtImpl

-- | Get the list of objects at the specified room position.
-- NOTE: each element is a tagged object ({ type, creep | structure | terrain | ... }); element format not modeled, use Foreign
lookAtXY :: Room -> Int -> Int -> Effect (Array Foreign)
lookAtXY = runEffectFn3 lookAtXYImpl

-- lookAtArea 'top, left, bottom, right, [asArray]' → 1 variant × 1 × (1 optional + 1) = 2 functions

foreign import lookAtAreaImpl :: EffectFn5 Room Int Int Int Int (Object (Object (Array Foreign)))
foreign import lookAtAreaAsArrayImpl :: EffectFn6 Room Int Int Int Int Boolean (Array Foreign)

-- | Get the list of objects at the specified room area.
-- NOTE: result is keyed result[y][x] (outer key y, inner key x); each element is a tagged object, not modeled, use Foreign
lookAtArea :: Room -> Int -> Int -> Int -> Int -> Effect (Object (Object (Array Foreign)))
lookAtArea = runEffectFn5 lookAtAreaImpl

-- | Get the list of objects at the specified room area.
-- NOTE: each element is a tagged object with x, y and type fields; element format not modeled, use Foreign
lookAtAreaAsArray :: Room -> Int -> Int -> Int -> Int -> Boolean -> Effect (Array Foreign)
lookAtAreaAsArray = runEffectFn6 lookAtAreaAsArrayImpl

-- lookForAt 'type, x, y|type, target' → 2 variants × 1 × 1 = 2 functions

foreign import lookForAtImpl :: forall a t. EffectFn3 Room (LookConstant a) t (Array a)
foreign import lookForAtXYImpl :: forall a. EffectFn4 Room (LookConstant a) Int Int (Array a)

-- | Get an object with the given type at the specified room position.
lookForAt :: forall a t. HasPos t => Room -> LookConstant a -> t -> Effect (Array a)
lookForAt = runEffectFn3 lookForAtImpl

-- | Get an object with the given type at the specified room position.
lookForAtXY :: forall a. Room -> LookConstant a -> Int -> Int -> Effect (Array a)
lookForAtXY = runEffectFn4 lookForAtXYImpl
