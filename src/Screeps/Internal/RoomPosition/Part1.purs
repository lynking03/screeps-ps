module Screeps.Internal.RoomPosition.Part1
  ( newRoomPosition
  , roomName
  , x
  ) where

import Data.Function.Uncurried (Fn3, runFn3)
import Screeps.Types (RoomPosition)

foreign import newRoomPositionImpl :: Fn3 Int Int String RoomPosition

-- | Create a new position object at the given coordinates in the named room.
newRoomPosition :: Int -> Int -> String -> RoomPosition
newRoomPosition = runFn3 newRoomPositionImpl

-- | The name of the room.
foreign import roomName :: RoomPosition -> String

-- | X position in the room.
foreign import x :: RoomPosition -> Int
