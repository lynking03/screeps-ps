module Screeps.Internal.Mineral.Part1
  ( density
  , mineralAmount
  , mineralType
  ) where

import Screeps.Constants (DensityConstant, ResourceConstant)
import Screeps.Types (Mineral)

-- | The density that this mineral deposit will be refilled to once ticksToRegeneration reaches 0.
foreign import density :: Mineral -> DensityConstant

-- | The remaining amount of resources.
foreign import mineralAmount :: Mineral -> Int

-- | The resource type.
foreign import mineralType :: Mineral -> ResourceConstant
