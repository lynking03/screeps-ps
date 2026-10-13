module Screeps.Internal.Creep.Part4
  ( saying
  , spawning
  , store
  ) where

import Screeps.Types (Creep, Store)

-- | The text message that the creep was saying at the last tick.
foreign import saying :: Creep -> String

-- | Whether this creep is still being spawned.
foreign import spawning :: Creep -> Boolean

-- | A `Store` object that contains cargo of this creep.
foreign import store :: Creep -> Store
