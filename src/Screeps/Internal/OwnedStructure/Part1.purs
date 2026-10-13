module Screeps.Internal.OwnedStructure.Part1
  ( my
  , Owner
  , owner
  ) where

import Screeps.Types (OwnedStructure)

-- | Whether this is your own structure.
foreign import my :: OwnedStructure -> Boolean

type Owner = { username :: String }

-- | An object with the structure's owner info.
foreign import owner :: OwnedStructure -> Owner
