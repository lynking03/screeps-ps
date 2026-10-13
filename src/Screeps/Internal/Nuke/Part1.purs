module Screeps.Internal.Nuke.Part1
  ( id
  , launchRoomName
  , timeToLand
  ) where

import Screeps.Types (Nuke)

-- | A unique object identificator. You can use Game.getObjectById method to retrieve an object instance by its id.
foreign import id :: Nuke -> String

-- | The name of the room where this nuke has been launched from.
foreign import launchRoomName :: Nuke -> String

-- | The remaining landing time.
foreign import timeToLand :: Nuke -> Int
