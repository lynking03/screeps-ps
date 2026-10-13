module Screeps.Internal.StructureNuker.Part1
  ( cooldown
  , store
  , launchNuke
  ) where

import Effect (Effect)
import Effect.Uncurried (EffectFn2, runEffectFn2)
import Screeps.Constants (ReturnCode)
import Screeps.Types (RoomPosition, Store, StructureNuker)

-- | The amount of game ticks until the next launch is possible.
foreign import cooldown :: StructureNuker -> Int

-- | A `Store` object that contains cargo of this structure.
foreign import store :: StructureNuker -> Store

foreign import launchNukeImpl :: EffectFn2 StructureNuker RoomPosition ReturnCode

-- | Launch a nuke to the specified position.
launchNuke :: StructureNuker -> RoomPosition -> Effect ReturnCode
launchNuke = runEffectFn2 launchNukeImpl
