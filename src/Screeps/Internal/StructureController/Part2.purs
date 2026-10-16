module Screeps.Internal.StructureController.Part2
  ( progressTotal
  , Reservation
  , reservation
  , safeMode
  ) where

import Data.Maybe (Maybe)
import Data.Nullable (Nullable, toMaybe)
import Screeps.Types (StructureController)

-- | The progress needed to reach the next level.
foreign import progressTotal :: StructureController -> Int

type Reservation = { username :: String, ticksToEnd :: Int }

foreign import reservationImpl :: StructureController -> Nullable Reservation

-- | An object with the controller reservation info if present.
reservation :: StructureController -> Maybe Reservation
reservation c = toMaybe (reservationImpl c)

-- | How many ticks of safe mode remaining, or undefined.
foreign import safeModeImpl :: StructureController -> Nullable Int

-- | How many ticks of safe mode remaining, or undefined.
safeMode :: StructureController -> Maybe Int
safeMode c = toMaybe (safeModeImpl c)
