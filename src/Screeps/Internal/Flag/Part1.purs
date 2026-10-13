module Screeps.Internal.Flag.Part1
  ( color
  , memory
  , name
  ) where

import Effect (Effect)
import Effect.Uncurried (EffectFn1, runEffectFn1)
import Foreign (Foreign)
import Screeps.Constants (ColorConstant)
import Screeps.Types (Flag)

-- | Flag primary color.
foreign import color :: Flag -> ColorConstant

foreign import memoryImpl :: EffectFn1 Flag Foreign

-- | A shorthand to Memory.flags[flag.name].
-- | To write memory, use Screeps.Memory.
-- NOTE: memory is user data; no codecs
memory :: Flag -> Effect Foreign
memory = runEffectFn1 memoryImpl

-- | Flag's name.
foreign import name :: Flag -> String
