module Screeps.Internal.PowerCreep.Part3
  ( level
  , memory
  , my
  ) where

import Effect (Effect)
import Effect.Uncurried (EffectFn1, runEffectFn1)
import Foreign (Foreign)
import Screeps.Types (PowerCreep)

-- | The power creep's level.
foreign import level :: PowerCreep -> Int

foreign import memoryImpl :: EffectFn1 PowerCreep Foreign

-- | A shorthand to Memory.powerCreeps[creep.name]. You can use it for quick access the creep's specific memory data object.
-- | To write memory, use Screeps.Memory.
memory :: PowerCreep -> Effect Foreign
memory = runEffectFn1 memoryImpl

-- | Whether it is your creep or foe.
foreign import my :: PowerCreep -> Boolean
