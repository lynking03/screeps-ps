module Screeps.Internal.Game.Part2
  ( flags
  , GlobalControlLevel
  , gcl
  , GlobalPowerLevel
  , gpl
  ) where

import Effect (Effect)
import Foreign.Object (Object)
import Screeps.Types (Flag)

-- | A hash containing all your flags with flag names as hash keys.
foreign import flags :: Effect (Object Flag)

type GlobalControlLevel = { level :: Int, progress :: Int, progressTotal :: Int }

-- | Your Global Control Level, with its level and progress towards the next level.
foreign import gcl :: Effect GlobalControlLevel

type GlobalPowerLevel = { level :: Int, progress :: Int, progressTotal :: Int }

-- | Your Global Power Level, with its level and progress towards the next level.
foreign import gpl :: Effect GlobalPowerLevel
