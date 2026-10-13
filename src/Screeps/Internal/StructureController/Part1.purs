module Screeps.Internal.StructureController.Part1
  ( isPowerEnabled
  , level
  , progress
  ) where

import Screeps.Types (StructureController)

-- | Whether using power is enabled in this room.
foreign import isPowerEnabled :: StructureController -> Boolean

-- | Current controller level, from 0 to 8.
foreign import level :: StructureController -> Int

-- | The current progress of upgrading the controller to the next level.
foreign import progress :: StructureController -> Int
