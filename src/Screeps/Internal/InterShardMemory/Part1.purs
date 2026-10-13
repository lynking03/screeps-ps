module Screeps.Internal.InterShardMemory.Part1
  ( getLocal
  , setLocal
  , getRemote
  ) where

import Prelude (Unit)
import Effect (Effect)
import Effect.Uncurried (EffectFn1, runEffectFn1)

foreign import getLocalImpl :: Effect String

-- | Returns the string contents of the current shard's data.
getLocal :: Effect String
getLocal = getLocalImpl

foreign import setLocalImpl :: EffectFn1 String Unit

-- | Replace the current shard's data with the new value.
setLocal :: String -> Effect Unit
setLocal = runEffectFn1 setLocalImpl

foreign import getRemoteImpl :: EffectFn1 String String

-- | Returns the string contents of another shard's data.
getRemote :: String -> Effect String
getRemote = runEffectFn1 getRemoteImpl
