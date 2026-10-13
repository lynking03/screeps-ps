-- | `Game.getObjectById`, hand-written (not generated: it is listed in
-- | handwritten.txt so the binding loop never produces or overwrites it).
-- | Not re-exported by the generated `Screeps.Game` facade; import it directly.
module Screeps.Game.GetObjectById
  ( getObjectById
  ) where

import Prelude

import Data.Maybe (Maybe(..))
import Data.Nullable (Nullable, toMaybe)
import Effect (Effect)
import Effect.Uncurried (EffectFn1, runEffectFn1)
import Screeps.Types (RoomObject, class RoomObjectClass, downcast)

foreign import getObjectByIdImpl :: EffectFn1 String (Nullable RoomObject)

-- | Get an object with the specified unique ID, at the type you ask for:
-- | `getObjectById id :: Effect (Maybe Source)`. `Nothing` if the object is not
-- | visible, does not exist, or is a different type (checked with `instanceof`).
getObjectById :: forall a. RoomObjectClass a => String -> Effect (Maybe a)
getObjectById id = do
  found <- runEffectFn1 getObjectByIdImpl id
  pure case toMaybe found of
    Nothing -> Nothing
    Just obj -> downcast obj
