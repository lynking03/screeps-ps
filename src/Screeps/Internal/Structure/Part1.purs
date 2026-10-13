module Screeps.Internal.Structure.Part1
  ( hits
  , hitsMax
  , id
  ) where

import Screeps.Types (class IsStructure)

foreign import hitsImpl :: forall s. s -> Int
foreign import hitsMaxImpl :: forall s. s -> Int
foreign import idImpl :: forall s. s -> String

-- | The current amount of hit points of the structure.
hits :: forall s. IsStructure s => s -> Int
hits = hitsImpl

-- | The total amount of hit points of the structure.
hitsMax :: forall s. IsStructure s => s -> Int
hitsMax = hitsMaxImpl

-- | A unique object identificator. You can use Game.getObjectById method to retrieve an object instance by its id.
id :: forall s. IsStructure s => s -> String
id = idImpl
