module Screeps.Internal.RoomVisual.Part4
  ( export
  , import_
  ) where

import Effect (Effect)
import Effect.Uncurried (EffectFn2, runEffectFn2)
import Screeps.Types (RoomVisual)

foreign import exportImpl :: RoomVisual -> String

-- | Returns a compact representation of all visuals added in the room in the current tick.
export :: RoomVisual -> String
export = exportImpl

-- NOTE: `import` is a PureScript keyword, so the binding is named import_
foreign import importImpl :: EffectFn2 RoomVisual String RoomVisual

-- | Add previously exported (with RoomVisual.export) room visuals to the room visual data of the current tick.
import_ :: RoomVisual -> String -> Effect RoomVisual
import_ = runEffectFn2 importImpl
