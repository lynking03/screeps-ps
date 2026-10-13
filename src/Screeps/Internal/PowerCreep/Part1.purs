module Screeps.Internal.PowerCreep.Part1
  ( create
  , className
  , deleteTime
  ) where

import Data.Maybe (Maybe)
import Data.Nullable (Nullable, toMaybe)
import Effect (Effect)
import Effect.Uncurried (EffectFn2, runEffectFn2)
import Screeps.Constants (PowerClassConstant, ReturnCode)
import Screeps.Types (PowerCreep)

foreign import createImpl :: EffectFn2 String PowerClassConstant ReturnCode

-- | A static method to create new Power Creep instance in your account.
create :: String -> PowerClassConstant -> Effect ReturnCode
create = runEffectFn2 createImpl

-- | The power creep's class, one of the `POWER_CLASS` constants.
foreign import className :: PowerCreep -> PowerClassConstant

foreign import deleteTimeImpl :: PowerCreep -> Nullable Int

-- | A timestamp when this creep is marked to be permanently deleted from the account, or undefined otherwise.
deleteTime :: PowerCreep -> Maybe Int
deleteTime c = toMaybe (deleteTimeImpl c)
