module Screeps.Internal.Creep.Part3
  ( my
  , name
  , Owner
  , owner
  ) where

import Screeps.Types (Creep)

-- | Whether it is your creep or foe.
foreign import my :: Creep -> Boolean

-- | Creep's name. You can choose the name while creating a new creep, and it cannot be changed later.
foreign import name :: Creep -> String

type Owner = { username :: String }

-- | An object with the creep's owner info.
foreign import owner :: Creep -> Owner
