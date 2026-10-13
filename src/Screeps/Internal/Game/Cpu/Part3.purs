module Screeps.Internal.Game.Cpu.Part3
  ( HeapStatistics
  , getHeapStatistics
  , getUsed
  , halt
  ) where

import Effect (Effect)
import Prelude (Unit)

-- return value of getHeapStatistics: v8 heap statistics plus externally_allocated_size
type HeapStatistics =
  { total_heap_size :: Int
  , total_heap_size_executable :: Int
  , total_physical_size :: Int
  , total_available_size :: Int
  , used_heap_size :: Int
  , heap_size_limit :: Int
  , malloced_memory :: Int
  , peak_malloced_memory :: Int
  , does_zap_garbage :: Int
  , externally_allocated_size :: Int
  }

-- | Use this method to get heap statistics for your virtual machine.
foreign import getHeapStatistics :: Effect HeapStatistics

-- | Get amount of CPU time used from the beginning of the current game tick.
foreign import getUsed :: Effect Number

-- | Reset your runtime environment and wipe all data in heap memory.
-- NOTE: no return value documented; typed as Unit
foreign import halt :: Effect Unit
