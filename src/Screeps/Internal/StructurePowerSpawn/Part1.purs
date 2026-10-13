module Screeps.Internal.StructurePowerSpawn.Part1
  ( store
  , processPower
  ) where

import Effect (Effect)
import Effect.Uncurried (EffectFn1, runEffectFn1)
import Screeps.Constants (ReturnCode)
import Screeps.Types (Store, StructurePowerSpawn)

-- | A `Store` object that contains cargo of this structure.
foreign import store :: StructurePowerSpawn -> Store

foreign import processPowerImpl :: EffectFn1 StructurePowerSpawn ReturnCode

-- | Register power resource units into your account. Registered power allows to develop power creeps skills.
processPower :: StructurePowerSpawn -> Effect ReturnCode
processPower = runEffectFn1 processPowerImpl
