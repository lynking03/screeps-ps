module Screeps.Internal.Game.Map.Visual.Part3
  ( getSize
  , export
  , import_
  ) where

import Effect (Effect)
import Effect.Uncurried (EffectFn1, EffectFn2, runEffectFn1, runEffectFn2)
import Screeps.Types (MapVisual)

foreign import getSizeImpl :: EffectFn1 MapVisual Int

-- | Get the stored size of all visuals added on the map in the current tick.
-- NOTE: Effect chosen: reads global per-tick map visual state
getSize :: MapVisual -> Effect Int
getSize = runEffectFn1 getSizeImpl

foreign import exportImpl :: EffectFn1 MapVisual String

-- | Returns a compact representation of all visuals added on the map in the current tick.
export :: MapVisual -> Effect String
export = runEffectFn1 exportImpl

foreign import importImpl :: EffectFn2 MapVisual String MapVisual

-- | Add previously exported (with Game.map.visual.export) map visuals to the map visual data of the current tick.
-- NOTE: `import` is a PureScript keyword, so the binding is named import_
import_ :: MapVisual -> String -> Effect MapVisual
import_ = runEffectFn2 importImpl
