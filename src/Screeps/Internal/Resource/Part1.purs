module Screeps.Internal.Resource.Part1
  ( amount
  , id
  , resourceType
  ) where

import Screeps.Constants (ResourceConstant)
import Screeps.Types (Resource)

-- | The amount of resource units containing.
foreign import amount :: Resource -> Int

-- | A unique object identificator. You can use Game.getObjectById method to retrieve an object instance by its id.
foreign import id :: Resource -> String

-- | One of the RESOURCE_* constants.
foreign import resourceType :: Resource -> ResourceConstant
