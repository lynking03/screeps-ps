module Screeps.Internal.Room.Part6
  ( EventLogEntry
  , getEventLog
  , getEventLogRaw
  , getPositionAt
  , getTerrain
  ) where

import Prelude (map)
import Data.Maybe (Maybe)
import Data.Nullable (Nullable, toMaybe)
import Effect (Effect)
import Effect.Uncurried (EffectFn1, EffectFn2, EffectFn3, runEffectFn1, runEffectFn2, runEffectFn3)
import Foreign (Foreign)
import Screeps.Constants (EventConstant)
import Screeps.Types (Room, RoomPosition, RoomTerrain)

-- | One entry of the event log. `data` varies by event type, so it is left as Foreign.
-- NOTE: `data` shape depends on `event`; no codecs provided
type EventLogEntry = { event :: EventConstant, objectId :: String, data :: Foreign }

foreign import getEventLogImpl :: EffectFn1 Room (Array EventLogEntry)
foreign import getEventLogRawImpl :: EffectFn2 Room Boolean Foreign

-- | Returns an array of events happened on the previous tick in this room.
getEventLog :: Room -> Effect (Array EventLogEntry)
getEventLog = runEffectFn1 getEventLogImpl

-- | Returns an array of events happened on the previous tick in this room.
-- NOTE: returns a parsed array when the flag is false, and a raw JSON string when true
getEventLogRaw :: Room -> Boolean -> Effect Foreign
getEventLogRaw = runEffectFn2 getEventLogRawImpl

foreign import getPositionAtImpl :: EffectFn3 Room Int Int (Nullable RoomPosition)

-- | Creates a RoomPosition object at the specified location.
getPositionAt :: Room -> Int -> Int -> Effect (Maybe RoomPosition)
getPositionAt r x y = map toMaybe (runEffectFn3 getPositionAtImpl r x y)

foreign import getTerrainImpl :: EffectFn1 Room RoomTerrain

-- | Get a `Room.Terrain` object which provides fast access to static terrain data.
getTerrain :: Room -> Effect RoomTerrain
getTerrain = runEffectFn1 getTerrainImpl
