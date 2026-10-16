module Screeps.Internal.StructureTower.Part1
  ( store
  , attack
  , heal
  ) where

import Effect (Effect)
import Effect.Uncurried (EffectFn2, runEffectFn2)
import Screeps.Constants (ReturnCode)
import Screeps.Types (Store, StructureTower, class IsCreep, class IsRoomObject)

-- | A Store object that contains cargo of this structure.
foreign import store :: StructureTower -> Store

foreign import attackImpl :: forall t. EffectFn2 StructureTower t ReturnCode

-- | Remotely attack any creep, power creep or structure in the room.
-- NOTE: target accepts Creep, PowerCreep, Structure; bound as IsRoomObject (their nearest shared class)
attack :: forall t. IsRoomObject t => StructureTower -> t -> Effect ReturnCode
attack = runEffectFn2 attackImpl

foreign import healImpl :: forall t. EffectFn2 StructureTower t ReturnCode

-- | Remotely heal any creep or power creep in the room.
-- NOTE: target accepts Creep, PowerCreep; bound as IsCreep
heal :: forall t. IsCreep t => StructureTower -> t -> Effect ReturnCode
heal = runEffectFn2 healImpl
