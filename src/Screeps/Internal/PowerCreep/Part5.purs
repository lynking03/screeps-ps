module Screeps.Internal.PowerCreep.Part5
  ( PowerInfo
  , powers
  , saying
  , shard
  ) where

import Data.Maybe (Maybe)
import Data.Nullable (Nullable, toMaybe)
import Foreign.Object (Object)
import Screeps.Types (PowerCreep)

-- | Per-power entry returned by `powers`. `cooldown` is undefined when the power creep is not spawned.
type PowerInfo = { level :: Int, cooldown :: Nullable Int }

-- | Available powers, keyed by power ID.
foreign import powers :: PowerCreep -> Object PowerInfo

-- | The text message that the creep was saying at the last tick.
foreign import saying :: PowerCreep -> String

foreign import shardImpl :: PowerCreep -> Nullable String

-- | The name of the shard where the power creep is spawned, if any.
shard :: PowerCreep -> Maybe String
shard pc = toMaybe (shardImpl pc)
