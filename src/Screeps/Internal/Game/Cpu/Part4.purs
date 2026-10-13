module Screeps.Internal.Game.Cpu.Part4
  ( setShardLimits
  , unlock
  , generatePixel
  ) where

import Effect (Effect)
import Effect.Uncurried (EffectFn1, runEffectFn1)
import Foreign.Object (Object)
import Screeps.Constants (ReturnCode)

foreign import setShardLimitsImpl :: EffectFn1 (Object Number) ReturnCode
foreign import unlockImpl :: Effect ReturnCode
foreign import generatePixelImpl :: Effect ReturnCode

-- | Allocate CPU limits to different shards. Total CPU should remain equal to `Game.cpu.shardLimits`. Can be used once per 12 hours.
setShardLimits :: Object Number -> Effect ReturnCode
setShardLimits = runEffectFn1 setShardLimitsImpl

-- | Unlock full CPU for your account for additional 24 hours. Consumes 1 CPU unlock bound to your account.
unlock :: Effect ReturnCode
unlock = unlockImpl

-- | Generate 1 pixel resource unit for 10000 CPU from your bucket.
generatePixel :: Effect ReturnCode
generatePixel = generatePixelImpl
