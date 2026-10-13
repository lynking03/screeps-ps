module Screeps.Internal.StructureController.Part3
  ( safeModeAvailable
  , safeModeCooldown
  , Sign
  , sign
  ) where

import Data.Maybe (Maybe)
import Data.Nullable (Nullable, toMaybe)
import Foreign (Foreign)
import Screeps.Types (StructureController)

-- | Safe mode activations available to use.
foreign import safeModeAvailable :: StructureController -> Int

foreign import safeModeCooldownImpl :: StructureController -> Nullable Int

-- | During this period in ticks new safe mode activations will be blocked, or Nothing if cooldown is inactive.
safeModeCooldown :: StructureController -> Maybe Int
safeModeCooldown c = toMaybe (safeModeCooldownImpl c)

-- property with a params block → record of its fields
-- NOTE: datetime is a JavaScript Date; no Date binding exists, so it is left as Foreign
type Sign =
  { username :: String
  , text :: String
  , time :: Int
  , datetime :: Foreign
  }

-- | An object with the controller sign info if present.
foreign import sign :: StructureController -> Sign
