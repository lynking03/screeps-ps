module Screeps.Internal.StructureLink.Part1
  ( cooldown
  , store
  , transferEnergy
  , transferEnergyAmount
  ) where

import Effect (Effect)
import Effect.Uncurried (EffectFn2, EffectFn3, runEffectFn2, runEffectFn3)
import Screeps.Constants (ReturnCode)
import Screeps.Types (Store, StructureLink)

-- | The amount of game ticks the link has to wait until the next transfer is possible.
foreign import cooldown :: StructureLink -> Int

-- | A Store object that contains cargo of this structure.
foreign import store :: StructureLink -> Store

-- transferEnergy 'target, [amount]' → 1 variant × 1 × (1 optional + 1) = 2 functions
foreign import transferEnergyImpl :: EffectFn2 StructureLink StructureLink ReturnCode
foreign import transferEnergyAmountImpl :: EffectFn3 StructureLink StructureLink Int ReturnCode

-- | Remotely transfer energy to another link at any location in the same room.
transferEnergy :: StructureLink -> StructureLink -> Effect ReturnCode
transferEnergy = runEffectFn2 transferEnergyImpl

-- | Remotely transfer energy to another link at any location in the same room.
transferEnergyAmount :: StructureLink -> StructureLink -> Int -> Effect ReturnCode
transferEnergyAmount = runEffectFn3 transferEnergyAmountImpl
