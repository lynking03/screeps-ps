module Screeps.Internal.RawMemory.Part3
  ( setDefaultPublicSegment
  , setPublicSegments
  ) where

import Prelude

import Data.Maybe (Maybe)
import Data.Nullable (Nullable, toNullable)
import Effect (Effect)
import Effect.Uncurried (EffectFn1, runEffectFn1)

foreign import setDefaultPublicSegmentImpl :: EffectFn1 (Nullable Int) Unit

-- | Set the specified segment as your default public segment. Pass `Nothing` to remove it.
setDefaultPublicSegment :: Maybe Int -> Effect Unit
setDefaultPublicSegment id = runEffectFn1 setDefaultPublicSegmentImpl (toNullable id)

foreign import setPublicSegmentsImpl :: EffectFn1 (Array Int) Unit

-- | Set specified segments as public. Subsequent calls override previous ones.
setPublicSegments :: Array Int -> Effect Unit
setPublicSegments = runEffectFn1 setPublicSegmentsImpl
