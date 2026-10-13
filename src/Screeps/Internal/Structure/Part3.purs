module Screeps.Internal.Structure.Part3
  ( notifyWhenAttacked
  ) where

import Effect (Effect)
import Effect.Uncurried (EffectFn2, runEffectFn2)
import Screeps.Constants (ReturnCode)
import Screeps.Types (class IsStructure)

foreign import notifyWhenAttackedImpl :: forall s. EffectFn2 s Boolean ReturnCode

-- | Toggle auto notification when the structure is under attack.
notifyWhenAttacked :: forall s. IsStructure s => s -> Boolean -> Effect ReturnCode
notifyWhenAttacked = runEffectFn2 notifyWhenAttackedImpl
