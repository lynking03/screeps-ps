module Screeps.Internal.Creep.Part10
  ( notifyWhenAttacked
  , pickup
  , pull
  ) where

import Effect (Effect)
import Effect.Uncurried (EffectFn2, runEffectFn2)
import Screeps.Constants (ReturnCode)
import Screeps.Types (Creep, Resource)

-- notifyWhenAttacked 'enabled' → 1 variant × 1 × 1 = 1 function
foreign import notifyWhenAttackedImpl :: EffectFn2 Creep Boolean ReturnCode

-- | Toggle auto notification when the creep is under attack.
notifyWhenAttacked :: Creep -> Boolean -> Effect ReturnCode
notifyWhenAttacked = runEffectFn2 notifyWhenAttackedImpl

-- pickup 'target' → 1 variant × 1 × 1 = 1 function
foreign import pickupImpl :: EffectFn2 Creep Resource ReturnCode

-- | Pick up an item (a dropped piece of energy).
pickup :: Creep -> Resource -> Effect ReturnCode
pickup = runEffectFn2 pickupImpl

-- pull 'target' → 1 variant × 1 × 1 = 1 function
foreign import pullImpl :: EffectFn2 Creep Creep ReturnCode

-- | Help another creep to follow this creep.
pull :: Creep -> Creep -> Effect ReturnCode
pull = runEffectFn2 pullImpl
