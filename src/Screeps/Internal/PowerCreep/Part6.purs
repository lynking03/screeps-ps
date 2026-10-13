module Screeps.Internal.PowerCreep.Part6
  ( spawnCooldownTime
  , ticksToLive
  , cancelOrder
  ) where

import Data.Maybe (Maybe)
import Data.Nullable (Nullable, toMaybe)
import Effect (Effect)
import Effect.Uncurried (EffectFn2, runEffectFn2)
import Screeps.Constants (ReturnCode)
import Screeps.Types (PowerCreep)

foreign import spawnCooldownTimeImpl :: PowerCreep -> Nullable Int

-- | The timestamp when spawning or deleting this creep will become available.
-- NOTE: undefined when the power creep is spawned in the world; returned as Nothing
spawnCooldownTime :: PowerCreep -> Maybe Int
spawnCooldownTime c = toMaybe (spawnCooldownTimeImpl c)

foreign import ticksToLiveImpl :: PowerCreep -> Nullable Int

-- | The remaining amount of game ticks after which the creep will die and become unspawned.
-- NOTE: undefined when the creep is not spawned in the world; returned as Nothing
ticksToLive :: PowerCreep -> Maybe Int
ticksToLive c = toMaybe (ticksToLiveImpl c)

foreign import cancelOrderImpl :: EffectFn2 PowerCreep String ReturnCode

-- | Cancel the order given during the current game tick.
cancelOrder :: PowerCreep -> String -> Effect ReturnCode
cancelOrder = runEffectFn2 cancelOrderImpl
