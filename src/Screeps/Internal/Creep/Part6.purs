module Screeps.Internal.Creep.Part6
  ( build
  , cancelOrder
  , claimController
  ) where

import Effect (Effect)
import Effect.Uncurried (EffectFn2, runEffectFn2)
import Screeps.Constants (ReturnCode)
import Screeps.Types (ConstructionSite, Creep, StructureController)

foreign import buildImpl :: EffectFn2 Creep ConstructionSite ReturnCode
foreign import cancelOrderImpl :: EffectFn2 Creep String ReturnCode
foreign import claimControllerImpl :: EffectFn2 Creep StructureController ReturnCode

-- | Build a structure at the target construction site using carried energy.
build :: Creep -> ConstructionSite -> Effect ReturnCode
build = runEffectFn2 buildImpl

-- | Cancel the order given during the current game tick.
cancelOrder :: Creep -> String -> Effect ReturnCode
cancelOrder = runEffectFn2 cancelOrderImpl

-- | Claims a neutral controller under your control.
claimController :: Creep -> StructureController -> Effect ReturnCode
claimController = runEffectFn2 claimControllerImpl
