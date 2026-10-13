module Screeps.Internal.Creep.Part2
  ( hitsMax
  , id
  , memory
  ) where

import Effect (Effect)
import Effect.Uncurried (EffectFn1, runEffectFn1)
import Foreign (Foreign)
import Screeps.Types (Creep)

-- | The maximum amount of hit points of the creep.
foreign import hitsMax :: Creep -> Int

-- | A unique object identificator. You can use Game.getObjectById method to retrieve an object instance by its id.
foreign import id :: Creep -> String

foreign import memoryImpl :: EffectFn1 Creep Foreign

-- | A shorthand to Memory.creeps[creep.name]. You can use it for quick access the creep's specific memory data object.
-- | To write memory, use Screeps.Memory.
-- NOTE: memory is user data; typed as Foreign with no codecs
memory :: Creep -> Effect Foreign
memory = runEffectFn1 memoryImpl
