module Screeps.Internal.StructureTower.Part1
  ( store
  , attack
  , heal
  ) where

import Effect (Effect)
import Effect.Uncurried (EffectFn2, runEffectFn2)
import Screeps.Constants (ReturnCode)
import Screeps.Types (Store, StructureTower)

-- | A `Store` object that contains cargo of this structure.
foreign import store :: StructureTower -> Store

foreign import attackImpl :: forall t. EffectFn2 StructureTower t ReturnCode
foreign import healImpl :: forall t. EffectFn2 StructureTower t ReturnCode

-- | Remotely attack any creep, power creep or structure in the room.
-- NOTE: target accepts Creep, PowerCreep, Structure; IsRoomObject is missing from Screeps.Types, so target is unconstrained
attack :: forall t. StructureTower -> t -> Effect ReturnCode
attack = runEffectFn2 attackImpl

-- | Remotely heal any creep or power creep in the room.
-- NOTE: target accepts Creep, PowerCreep; IsCreep is missing from Screeps.Types, so target is unconstrained
heal :: forall t. StructureTower -> t -> Effect ReturnCode
heal = runEffectFn2 healImpl
