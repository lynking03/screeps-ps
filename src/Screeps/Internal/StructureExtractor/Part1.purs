module Screeps.Internal.StructureExtractor.Part1
  ( cooldown
  ) where

import Screeps.Types (StructureExtractor)

-- | The amount of game ticks until the next harvest action is possible.
foreign import cooldown :: StructureExtractor -> Int
