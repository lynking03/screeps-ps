module Screeps.Internal.StructureObserver.Part1
  ( observeRoom
  ) where

import Effect (Effect)
import Effect.Uncurried (EffectFn2, runEffectFn2)
import Screeps.Constants (ReturnCode)
import Screeps.Types (StructureObserver)

foreign import observeRoomImpl :: EffectFn2 StructureObserver String ReturnCode

-- | Provide visibility into a distant room from your script.
observeRoom :: StructureObserver -> String -> Effect ReturnCode
observeRoom = runEffectFn2 observeRoomImpl
