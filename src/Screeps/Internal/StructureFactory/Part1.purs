module Screeps.Internal.StructureFactory.Part1
  ( cooldown
  , level
  , store
  ) where

import Screeps.Types (Store, StructureFactory)

-- | The amount of game ticks the factory has to wait until the next production is possible.
foreign import cooldown :: StructureFactory -> Int

-- | The factory's level.
foreign import level :: StructureFactory -> Int

-- | A `Store` object that contains cargo of this structure.
foreign import store :: StructureFactory -> Store
