module Screeps.Internal.StructureStorage.Part1
  ( store
  ) where

import Screeps.Types (Store, StructureStorage)

-- | A `Store` object that contains cargo of this structure.
foreign import store :: StructureStorage -> Store
