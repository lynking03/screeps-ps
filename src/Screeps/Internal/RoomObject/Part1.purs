module Screeps.Internal.RoomObject.Part1
  ( RoomObjectEffect
  , effects
  , pos
  , room
  ) where

import Data.Maybe (Maybe)
import Data.Nullable (Nullable, toMaybe)
import Screeps.Types (class IsRoomObject, Room, RoomPosition)

-- | An applied effect: a natural effect ID or a Power ID, with its duration.
type RoomObjectEffect =
  { effect :: Int
  , level :: Nullable Int
  , ticksRemaining :: Int
  }

foreign import effectsImpl :: forall r. r -> Array RoomObjectEffect
foreign import posImpl :: forall r. r -> RoomPosition
foreign import roomNullableImpl :: forall r. r -> Nullable Room

-- | Applied effects, an array of objects describing each effect.
effects :: forall r. IsRoomObject r => r -> Array RoomObjectEffect
effects = effectsImpl

-- | An object representing the position of this object in the room.
pos :: forall r. IsRoomObject r => r -> RoomPosition
pos = posImpl

-- | The link to the Room object. Nothing if the object is in a room that is not visible to you.
room :: forall r. IsRoomObject r => r -> Maybe Room
room o = toMaybe (roomNullableImpl o)
