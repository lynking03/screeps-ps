module Screeps.Internal.ConstructionSite.Part1
  ( id
  , my
  , ConstructionSiteOwner
  , owner
  ) where

import Screeps.Types (ConstructionSite)

-- | A unique object identificator. You can use Game.getObjectById method to retrieve an object instance by its id.
foreign import id :: ConstructionSite -> String

-- | Whether this is your own construction site.
foreign import my :: ConstructionSite -> Boolean

-- property with a params block → record of its fields
-- NOTE: named ConstructionSiteOwner (not Owner) to avoid clashing with other parts' owner types in the re-exporting module
type ConstructionSiteOwner = { username :: String }

-- | An object with the structure's owner info containing the following properties.
foreign import owner :: ConstructionSite -> ConstructionSiteOwner
