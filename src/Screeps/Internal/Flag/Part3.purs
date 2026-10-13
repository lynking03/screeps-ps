module Screeps.Internal.Flag.Part3
  ( setPosition
  , setPositionXY
  ) where

import Effect (Effect)
import Effect.Uncurried (EffectFn2, EffectFn3, runEffectFn2, runEffectFn3)
import Screeps.Constants (ReturnCode)
import Screeps.Types (Flag, class HasPos)

foreign import setPositionImpl :: forall t. EffectFn2 Flag t ReturnCode
foreign import setPositionXYImpl :: EffectFn3 Flag Int Int ReturnCode

-- | Set new position of the flag.
setPosition :: forall t. HasPos t => Flag -> t -> Effect ReturnCode
setPosition = runEffectFn2 setPositionImpl

-- | Set new position of the flag.
setPositionXY :: Flag -> Int -> Int -> Effect ReturnCode
setPositionXY = runEffectFn3 setPositionXYImpl
