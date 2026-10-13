module Screeps.Internal.StructurePortal.Part1
  ( destination
  , ticksToDecay
  ) where

import Data.Maybe (Maybe)
import Data.Nullable (Nullable, toMaybe)
import Foreign (Foreign)
import Screeps.Types (StructurePortal)

-- | The destination of the portal: a `RoomPosition` for an inter-room portal, or an object with `shard` and `room` strings for an inter-shard portal.
-- NOTE: returns RoomPosition or { shard, room } depending on portal type; no union type available, so Foreign
foreign import destination :: StructurePortal -> Foreign

foreign import ticksToDecayImpl :: StructurePortal -> Nullable Int

-- | The amount of game ticks when the portal disappears, or Nothing when the portal is stable.
ticksToDecay :: StructurePortal -> Maybe Int
ticksToDecay p = toMaybe (ticksToDecayImpl p)
