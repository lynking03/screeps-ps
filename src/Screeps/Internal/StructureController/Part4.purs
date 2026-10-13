module Screeps.Internal.StructureController.Part4
  ( ticksToDowngrade
  , upgradeBlocked
  , activateSafeMode
  ) where

import Effect (Effect)
import Effect.Uncurried (EffectFn1, runEffectFn1)
import Screeps.Constants (ReturnCode)
import Screeps.Types (StructureController)

-- | The amount of game ticks when this controller will lose one level.
foreign import ticksToDowngrade :: StructureController -> Int

-- | The amount of game ticks while this controller cannot be upgraded due to attack.
foreign import upgradeBlocked :: StructureController -> Int

foreign import activateSafeModeImpl :: EffectFn1 StructureController ReturnCode

-- | Activate safe mode if available.
activateSafeMode :: StructureController -> Effect ReturnCode
activateSafeMode = runEffectFn1 activateSafeModeImpl
