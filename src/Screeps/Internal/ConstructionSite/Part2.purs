module Screeps.Internal.ConstructionSite.Part2
  ( progress
  , progressTotal
  , structureType
  ) where

import Screeps.Constants (StructureConstant)
import Screeps.Types (ConstructionSite)

-- | The current construction progress.
foreign import progress :: ConstructionSite -> Int

-- | The total construction progress needed for the structure to be built.
foreign import progressTotal :: ConstructionSite -> Int

-- | One of the STRUCTURE_* constants.
foreign import structureType :: ConstructionSite -> StructureConstant
