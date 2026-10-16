module Screeps.Internal.StructureTerminal.Part1
  ( cooldown
  , store
  , send
  , sendDescription
  ) where

import Effect (Effect)
import Effect.Uncurried (EffectFn4, EffectFn5, runEffectFn4, runEffectFn5)
import Screeps.Constants (ResourceConstant, ReturnCode)
import Screeps.Types (Store, StructureTerminal)

-- | The remaining amount of ticks while this terminal cannot be used to make send or market deal calls.
foreign import cooldown :: StructureTerminal -> Int

-- | A Store object that contains cargo of this structure.
foreign import store :: StructureTerminal -> Store

foreign import sendImpl :: EffectFn4 StructureTerminal ResourceConstant Int String ReturnCode
foreign import sendDescriptionImpl :: EffectFn5 StructureTerminal ResourceConstant Int String String ReturnCode

-- | Sends resource to a Terminal in another room with the specified name.
send :: StructureTerminal -> ResourceConstant -> Int -> String -> Effect ReturnCode
send = runEffectFn4 sendImpl

-- | Sends resource to a Terminal in another room with the specified name.
sendDescription :: StructureTerminal -> ResourceConstant -> Int -> String -> String -> Effect ReturnCode
sendDescription = runEffectFn5 sendDescriptionImpl
