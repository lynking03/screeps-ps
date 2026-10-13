module Screeps.Internal.Game.Part4
  ( resources
  , rooms
  , shard
  ) where

import Effect (Effect)
import Foreign (Foreign)
import Foreign.Object (Object)
import Screeps.Types (Room)

-- | An object with your global resources that are bound to the account, like pixels or cpu unlocks.
-- NOTE: keys are ResourceConstant values; modeled as Object Int since the docs give no fixed fields
foreign import resources :: Effect (Object Int)

-- | A hash containing all the rooms available to you with room names as hash keys.
foreign import rooms :: Effect (Object Room)

-- | A global object describing the world shard where your script is currently being executed in.
-- NOTE: shard fields are not listed in the spec, so the object is returned as Foreign
foreign import shard :: Effect Foreign
