module Screeps.Internal.PowerCreep.Part9
  ( notifyWhenAttacked
  , pickup
  , rename
  ) where

import Effect (Effect)
import Effect.Uncurried (EffectFn2, runEffectFn2)
import Screeps.Constants (ReturnCode)
import Screeps.Types (PowerCreep, Resource)

foreign import notifyWhenAttackedImpl :: EffectFn2 PowerCreep Boolean ReturnCode
foreign import pickupImpl :: EffectFn2 PowerCreep Resource ReturnCode
foreign import renameImpl :: EffectFn2 PowerCreep String ReturnCode

-- | Toggle auto notification when the creep is under attack. The notification will be sent to your account email. Turned on by default.
notifyWhenAttacked :: PowerCreep -> Boolean -> Effect ReturnCode
notifyWhenAttacked = runEffectFn2 notifyWhenAttackedImpl

-- | Pick up an item (a dropped piece of energy). The target has to be at adjacent square to the creep or at the same square.
pickup :: PowerCreep -> Resource -> Effect ReturnCode
pickup = runEffectFn2 pickupImpl

-- | Rename the power creep. It must not be spawned in the world.
rename :: PowerCreep -> String -> Effect ReturnCode
rename = runEffectFn2 renameImpl
