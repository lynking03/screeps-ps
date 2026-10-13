module Screeps.Internal.PowerCreep.Part4
  ( name
  , Owner
  , owner
  , store
  ) where

import Screeps.Types (PowerCreep, Store)

-- | The power creep's name, used as its key in `Game.powerCreeps`.
foreign import name :: PowerCreep -> String

-- NOTE: owner's field list was not included in the spec; only username is bound, from the owner-info description
type Owner = { username :: String }

-- | An object with the power creep's owner info.
foreign import owner :: PowerCreep -> Owner

-- | A Store object that contains the cargo of this power creep.
foreign import store :: PowerCreep -> Store
