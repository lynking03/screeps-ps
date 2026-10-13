module Screeps.Internal.Room.Part1
  ( controller
  , energyAvailable
  , energyCapacityAvailable
  ) where

import Data.Maybe (Maybe)
import Data.Nullable (Nullable, toMaybe)
import Screeps.Types (Room, StructureController)

foreign import controllerImpl :: Room -> Nullable StructureController

-- | The Controller structure of this room, if present, otherwise Nothing.
controller :: Room -> Maybe StructureController
controller r = toMaybe (controllerImpl r)

-- | Total amount of energy available in all spawns and extensions in the room.
foreign import energyAvailable :: Room -> Int

-- | Total amount of energyCapacity of all spawns and extensions in the room.
foreign import energyCapacityAvailable :: Room -> Int
