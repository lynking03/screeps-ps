module Screeps.Internal.Game.Map.Visual.Part2
  ( PolyOpts
  , poly
  , poly'
  , TextOpts
  , text
  , text'
  , clear
  ) where

import Effect (Effect)
import Effect.Uncurried (EffectFn1, EffectFn2, EffectFn3, EffectFn4, runEffectFn1, runEffectFn2, runEffectFn3, runEffectFn4)
import Prim.Row (class Union)
import Screeps.Types (MapVisual, RoomPosition)

-- poly 'points, [style]' → 1 variant × opts 2 × 1 = 2 functions
type PolyOpts =
  ( fill :: String
  , opacity :: Number
  , stroke :: String
  , strokeWidth :: Number
  , lineStyle :: String -- "solid" (undefined), "dashed" or "dotted"
  )

foreign import polyImpl :: forall r. EffectFn3 MapVisual (Array RoomPosition) (Record r) MapVisual

-- | Draw a polyline.
poly' :: forall r rest. Union r rest PolyOpts => MapVisual -> Array RoomPosition -> Record r -> Effect MapVisual
poly' = runEffectFn3 polyImpl

-- | Draw a polyline.
poly :: MapVisual -> Array RoomPosition -> Effect MapVisual
poly v ps = poly' v ps {}

-- text 'text, pos, [style]' → 1 variant × opts 2 × 1 = 2 functions
type TextOpts =
  ( color :: String
  , fontFamily :: String
  , fontSize :: Number
  , fontStyle :: String
  , fontVariant :: String
  , stroke :: String
  , strokeWidth :: Number
  , backgroundColor :: String
  , backgroundPadding :: Number
  , align :: String -- "center", "left" or "right"
  , opacity :: Number
  )

foreign import textImpl :: forall r. EffectFn4 MapVisual String RoomPosition (Record r) MapVisual

-- | Draw a text label. You can use any valid Unicode characters, including emoji.
text' :: forall r rest. Union r rest TextOpts => MapVisual -> String -> RoomPosition -> Record r -> Effect MapVisual
text' = runEffectFn4 textImpl

-- | Draw a text label. You can use any valid Unicode characters, including emoji.
text :: MapVisual -> String -> RoomPosition -> Effect MapVisual
text v s p = text' v s p {}

foreign import clearImpl :: EffectFn1 MapVisual MapVisual

-- | Remove all visuals from the map.
clear :: MapVisual -> Effect MapVisual
clear = runEffectFn1 clearImpl
