module Screeps.Internal.Game.Shard.Part2
  ( access
  , accessTime
  , activateAccess
  ) where

import Prelude (map)

import Data.Maybe (Maybe)
import Data.Nullable (Nullable, toMaybe)
import Effect (Effect)
import Screeps.Constants (ReturnCode)

-- | Whether you currently have access to this shard.
foreign import access :: Effect Boolean

foreign import accessTimeImpl :: Effect (Nullable Number)

-- | The time in milliseconds since UNIX epoch until access to this restricted shard is active.
accessTime :: Effect (Maybe Number)
accessTime = map toMaybe accessTimeImpl

-- | Activate access to the current restricted shard for additional 30 days.
foreign import activateAccess :: Effect ReturnCode
