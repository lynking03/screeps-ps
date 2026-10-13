module Screeps.Internal.Deposit.Part1
  ( cooldown
  , depositType
  , id
  ) where

import Screeps.Constants (ResourceConstant)
import Screeps.Types (Deposit)

-- | The amount of game ticks until the next harvest action is possible.
foreign import cooldown :: Deposit -> Int

-- | The deposit type, one of the RESOURCE_* constants.
foreign import depositType :: Deposit -> ResourceConstant

-- | A unique object identificator.
foreign import id :: Deposit -> String
