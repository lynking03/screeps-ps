module Screeps.Internal.Game.Cpu.Part2
  ( shardLimits
  , unlocked
  , unlockedTime
  ) where

import Prelude

import Data.Maybe (Maybe)
import Data.Nullable (Nullable, toMaybe)
import Effect (Effect)
import Foreign.Object (Object)

foreign import shardLimitsImpl :: Effect (Object Number)
foreign import unlockedImpl :: Effect Boolean
foreign import unlockedTimeImpl :: Effect (Nullable Number)

-- | An object with limits for each shard with shard names as keys.
shardLimits :: Effect (Object Number)
shardLimits = shardLimitsImpl

-- | Whether full CPU is currently unlocked for your account.
unlocked :: Effect Boolean
unlocked = unlockedImpl

-- | The time in milliseconds since UNIX epoch time until full CPU is unlocked for your account.
unlockedTime :: Effect (Maybe Number)
unlockedTime = toMaybe <$> unlockedTimeImpl
