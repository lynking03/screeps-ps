module Screeps.Internal.Room.Part8
  ( LookAtAreaGrid
  , LookAtAreaEntry
  , lookForAtArea
  , lookForAtAreaAsArray
  ) where

import Data.Nullable (Nullable)
import Effect (Effect)
import Effect.Uncurried (EffectFn6, EffectFn7, runEffectFn6, runEffectFn7)
import Foreign.Object (Object)
import Screeps.Constants (LookConstant)
import Screeps.Types (Room)

-- | Object form: x -> y -> objects (undefined where nothing is found).
type LookAtAreaGrid a = Object (Object (Nullable (Array a)))

-- | One entry of the array form. The looked-up objects are under `value`.
-- NOTE: the JS returns the objects under the look type's key (e.g. `structure`); the wrapper renames it to `value`
type LookAtAreaEntry a = { x :: Int, y :: Int, value :: a }

foreign import lookForAtAreaImpl :: forall a. EffectFn6 Room (LookConstant a) Int Int Int Int (LookAtAreaGrid a)
foreign import lookForAtAreaAsArrayImpl :: forall a. EffectFn6 Room (LookConstant a) Int Int Int Int (Array (LookAtAreaEntry a))

-- | Get the list of objects with the given type at the specified room area.
lookForAtArea :: forall a. Room -> LookConstant a -> Int -> Int -> Int -> Int -> Effect (LookAtAreaGrid a)
lookForAtArea = runEffectFn6 lookForAtAreaImpl

-- | Get the list of objects with the given type at the specified room area.
-- NOTE: asArray is fixed to true here; use lookForAtArea for the object form.
lookForAtAreaAsArray :: forall a. Room -> LookConstant a -> Int -> Int -> Int -> Int -> Effect (Array (LookAtAreaEntry a))
lookForAtAreaAsArray = runEffectFn6 lookForAtAreaAsArrayImpl
