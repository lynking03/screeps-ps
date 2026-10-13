module Screeps.Internal.RawMemory.Part2
  ( set
  , setActiveSegments
  , setActiveForeignSegment
  , setActiveForeignSegmentId
  ) where

import Data.Maybe (Maybe)
import Data.Nullable (Nullable, toNullable)
import Data.Unit (Unit)
import Effect (Effect)
import Effect.Uncurried (EffectFn1, EffectFn2, runEffectFn1, runEffectFn2)

foreign import setImpl :: EffectFn1 String Unit

-- | Set new Memory value.
set :: String -> Effect Unit
set = runEffectFn1 setImpl

foreign import setActiveSegmentsImpl :: EffectFn1 (Array Int) Unit

-- | Request memory segments using the list of their IDs.
setActiveSegments :: Array Int -> Effect Unit
setActiveSegments = runEffectFn1 setActiveSegmentsImpl

foreign import setActiveForeignSegmentImpl :: EffectFn1 (Nullable String) Unit
foreign import setActiveForeignSegmentIdImpl :: EffectFn2 (Nullable String) Int Unit

-- | Request a memory segment of another user. Nothing clears the foreign segment.
-- | The segment must be marked public by its owner.
-- | Uses the user's default public segment.
setActiveForeignSegment :: Maybe String -> Effect Unit
setActiveForeignSegment username = runEffectFn1 setActiveForeignSegmentImpl (toNullable username)

-- | Request a memory segment of another user, by segment ID from 0 to 99.
-- | Nothing clears the foreign segment.
setActiveForeignSegmentId :: Maybe String -> Int -> Effect Unit
setActiveForeignSegmentId username id = runEffectFn2 setActiveForeignSegmentIdImpl (toNullable username) id
