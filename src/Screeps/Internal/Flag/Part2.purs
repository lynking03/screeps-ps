module Screeps.Internal.Flag.Part2
  ( secondaryColor
  , remove
  , setColor
  , setColorSecondaryColor
  ) where

import Effect (Effect)
import Effect.Uncurried (EffectFn1, EffectFn2, EffectFn3, runEffectFn1, runEffectFn2, runEffectFn3)
import Screeps.Constants (ColorConstant, ReturnCode)
import Screeps.Types (Flag)

-- | Flag secondary color.
foreign import secondaryColor :: Flag -> ColorConstant

foreign import removeImpl :: EffectFn1 Flag ReturnCode

-- | Remove the flag.
remove :: Flag -> Effect ReturnCode
remove = runEffectFn1 removeImpl

-- setColor 'color, [secondaryColor]' → 1 variant × 1 × (1 optional + 1) = 2 functions
foreign import setColorImpl :: EffectFn2 Flag ColorConstant ReturnCode
foreign import setColorSecondaryColorImpl :: EffectFn3 Flag ColorConstant ColorConstant ReturnCode

-- | Set new color of the flag.
setColor :: Flag -> ColorConstant -> Effect ReturnCode
setColor = runEffectFn2 setColorImpl

-- | Set new color of the flag.
setColorSecondaryColor :: Flag -> ColorConstant -> ColorConstant -> Effect ReturnCode
setColorSecondaryColor = runEffectFn3 setColorSecondaryColorImpl
