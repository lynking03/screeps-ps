module Screeps.Internal.StructureExtension.Part1
  ( store
  ) where

import Screeps.Types (StructureExtension, Store)

-- | A `Store` object that contains cargo of this structure.
foreign import store :: StructureExtension -> Store
