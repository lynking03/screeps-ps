module Screeps.Internal.StructureController.Part5
  ( unclaim
  ) where

import Effect (Effect)
import Effect.Uncurried (EffectFn1, runEffectFn1)
import Screeps.Constants (ReturnCode)
import Screeps.Types (StructureController)

foreign import unclaimImpl :: EffectFn1 StructureController ReturnCode

-- | Make your claimed controller neutral again.
unclaim :: StructureController -> Effect ReturnCode
unclaim = runEffectFn1 unclaimImpl
