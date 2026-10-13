module Screeps.Internal.PowerCreep.Part7
  ( delete
  , deleteCancel
  , drop
  , dropAmount
  , enableRoom
  ) where

import Effect (Effect)
import Effect.Uncurried (EffectFn1, EffectFn2, EffectFn3, runEffectFn1, runEffectFn2, runEffectFn3)
import Screeps.Constants (ResourceConstant, ReturnCode)
import Screeps.Types (PowerCreep, StructureController)

foreign import deleteImpl :: EffectFn1 PowerCreep ReturnCode
foreign import deleteCancelImpl :: EffectFn2 PowerCreep Boolean ReturnCode

-- | Delete the power creep permanently from your account. It should NOT be spawned in the world.
delete :: PowerCreep -> Effect ReturnCode
delete = runEffectFn1 deleteImpl

-- | Delete the power creep permanently from your account. Pass true to cancel a previously scheduled deletion.
deleteCancel :: PowerCreep -> Boolean -> Effect ReturnCode
deleteCancel = runEffectFn2 deleteCancelImpl

foreign import dropImpl :: EffectFn2 PowerCreep ResourceConstant ReturnCode
foreign import dropAmountImpl :: EffectFn3 PowerCreep ResourceConstant Int ReturnCode

-- | Drop this resource on the ground.
drop :: PowerCreep -> ResourceConstant -> Effect ReturnCode
drop = runEffectFn2 dropImpl

-- | Drop this resource on the ground.
dropAmount :: PowerCreep -> ResourceConstant -> Int -> Effect ReturnCode
dropAmount = runEffectFn3 dropAmountImpl

foreign import enableRoomImpl :: EffectFn2 PowerCreep StructureController ReturnCode

-- | Enable powers usage in this room. The room controller should be at adjacent tile.
enableRoom :: PowerCreep -> StructureController -> Effect ReturnCode
enableRoom = runEffectFn2 enableRoomImpl
