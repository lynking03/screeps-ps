module Screeps.Internal.Game.Cpu.Part1
  ( limit
  , tickLimit
  , bucket
  ) where

import Effect (Effect)

-- | Your assigned CPU limit for the current shard.
foreign import limit :: Effect Number

-- | An amount of available CPU time at the current game tick. Usually it is higher than Game.cpu.limit.
foreign import tickLimit :: Effect Number

-- | An amount of unused CPU accumulated in your bucket.
foreign import bucket :: Effect Number
