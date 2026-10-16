module Screeps.Internal.Ruin.Part1
  ( destroyTime
  , id
  , store
  ) where

import Screeps.Types (Ruin, Store)

-- | The time when the structure has been destroyed.
foreign import destroyTime :: Ruin -> Int

-- | A unique object identificator. You can use Game.getObjectById method to retrieve an object instance by its id.
foreign import id :: Ruin -> String

-- | A Store object that contains resources of this structure.
foreign import store :: Ruin -> Store
