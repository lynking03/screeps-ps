module Screeps.Internal.Game.Map.Part3
  ( RoomStatus
  , getRoomStatus
  ) where

import Data.Nullable (Nullable)
import Effect (Effect)
import Effect.Uncurried (EffectFn1, runEffectFn1)

-- | The availability status of a room. `status` is one of "normal", "closed",
-- | "novice" or "respawn".
-- NOTE: no ROOM_STATUS constant type exists in Screeps.Constants, so status is String
-- | `timestamp` is null when the status is permanent.
type RoomStatus = { status :: String, timestamp :: Nullable Number }

foreign import getRoomStatusImpl :: EffectFn1 String RoomStatus

-- | Gets availability status of the room with the specified name.
getRoomStatus :: String -> Effect RoomStatus
getRoomStatus = runEffectFn1 getRoomStatusImpl
