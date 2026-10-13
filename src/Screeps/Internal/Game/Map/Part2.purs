module Screeps.Internal.Game.Map.Part2
  ( getRoomLinearDistance
  , getRoomLinearDistanceContinuous
  , getRoomTerrain
  , getWorldSize
  ) where

import Effect (Effect)
import Effect.Uncurried (EffectFn1, EffectFn2, EffectFn3, runEffectFn1, runEffectFn2, runEffectFn3)
import Screeps.Types (RoomTerrain)

-- getRoomLinearDistance 'roomName1, roomName2, [continuous]' → 1 variant × 1 × (1 optional + 1) = 2 functions
foreign import getRoomLinearDistanceImpl :: EffectFn2 String String Int
foreign import getRoomLinearDistanceContinuousImpl :: EffectFn3 String String Boolean Int

-- | Get the linear distance (in rooms) between two rooms.
getRoomLinearDistance :: String -> String -> Effect Int
getRoomLinearDistance = runEffectFn2 getRoomLinearDistanceImpl

-- | Get the linear distance (in rooms) between two rooms, optionally treating the world map as continuous on borders.
getRoomLinearDistanceContinuous :: String -> String -> Boolean -> Effect Int
getRoomLinearDistanceContinuous = runEffectFn3 getRoomLinearDistanceContinuousImpl

foreign import getRoomTerrainImpl :: EffectFn1 String RoomTerrain

-- | Get a `Room.Terrain` object which provides fast access to static terrain data.
getRoomTerrain :: String -> Effect RoomTerrain
getRoomTerrain = runEffectFn1 getRoomTerrainImpl

-- | Returns the world size as a number of rooms between world corners.
foreign import getWorldSize :: Effect Int
