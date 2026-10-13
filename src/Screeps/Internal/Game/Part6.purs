module Screeps.Internal.Game.Part6
  ( getObjectById
  , notify
  , notifyGroupInterval
  ) where

import Data.Maybe (Maybe(..))
import Data.Nullable (Nullable, toMaybe)
import Data.Unit (Unit)
import Effect (Effect)
import Prelude (map)
import Effect.Uncurried (EffectFn1, EffectFn2, runEffectFn1, runEffectFn2)
import Screeps.Types (RoomObject)

foreign import getObjectByIdImpl :: EffectFn1 String (Nullable RoomObject)

-- | Get an object with the specified unique ID. It may be a game object of any type.
-- NOTE: returns any game object type; no shared supertype beyond RoomObject exists, so narrow with care
getObjectById :: String -> Effect (Maybe RoomObject)
getObjectById id = map toMaybe (runEffectFn1 getObjectByIdImpl id)

foreign import notifyImpl :: EffectFn1 String Unit
foreign import notifyGroupIntervalImpl :: EffectFn2 String Int Unit

-- | Send a custom message at your profile email.
notify :: String -> Effect Unit
notify = runEffectFn1 notifyImpl

-- | Send a custom message at your profile email, grouped with other notifications for the given number of minutes.
notifyGroupInterval :: String -> Int -> Effect Unit
notifyGroupInterval = runEffectFn2 notifyGroupIntervalImpl
