module Screeps.Internal.RawMemory.Part1
  ( RawMemorySegments
  , segments
  , ForeignSegment
  , foreignSegment
  , get
  ) where

import Effect (Effect)
import Foreign.Object (Object)

-- | Memory segments available on this tick, keyed by segment ID. Each value is the segment's string data.
-- NOTE: object keys are segment IDs (numbers) stored as strings
type RawMemorySegments = Object String

-- | Memory segments available on this tick, keyed by segment ID. Each value is the segment's string data.
foreign import segmentsImpl :: Effect (Object String)

-- | Memory segments available on this tick, keyed by segment ID. Each value is the segment's string data.
segments :: Effect RawMemorySegments
segments = segmentsImpl

-- | The record of another player's memory segment available on this tick.
type ForeignSegment = { username :: String, id :: Int, data :: String }

-- | A memory segment of another player available on this tick.
foreign import foreignSegmentImpl :: Effect ForeignSegment

-- | A memory segment of another player available on this tick.
foreignSegment :: Effect ForeignSegment
foreignSegment = foreignSegmentImpl

-- | Get a raw string representation of the Memory object.
foreign import get :: Effect String
