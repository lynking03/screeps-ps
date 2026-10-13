module Screeps.Internal.StructureRampart.Part1
  ( isPublic
  , ticksToDecay
  , setPublic
  ) where

import Effect (Effect)
import Effect.Uncurried (EffectFn2, runEffectFn2)
import Screeps.Constants (ReturnCode)
import Screeps.Types (StructureRampart)

-- | If false (default), only your creeps can step on the same square. If true, any hostile creeps can pass through.
foreign import isPublic :: StructureRampart -> Boolean

-- | The amount of game ticks when this rampart will lose some hit points.
foreign import ticksToDecay :: StructureRampart -> Int

foreign import setPublicImpl :: EffectFn2 StructureRampart Boolean ReturnCode

-- | Make this rampart public to allow other players' creeps to pass through.
setPublic :: StructureRampart -> Boolean -> Effect ReturnCode
setPublic = runEffectFn2 setPublicImpl
