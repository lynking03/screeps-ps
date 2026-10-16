module Screeps.Internal.StructureLab.Part1
  ( cooldown
  , mineralType
  , store
  ) where

import Screeps.Types (StructureLab, Store)
import Screeps.Constants (ResourceConstant)

-- | The amount of game ticks the lab has to wait until the next reaction or unboost operation is possible.
foreign import cooldown :: StructureLab -> Int

-- | The type of minerals containing in the lab. Labs can contain only one mineral type at the same time.
-- NOTE: docs give a plain string with no constant list; a mineral ResourceConstant is expected, typed String here
foreign import mineralType :: StructureLab -> ResourceConstant

-- | A Store object that contains cargo of this structure.
foreign import store :: StructureLab -> Store
