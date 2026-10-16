module Screeps.Internal.Game.Map.Visual.Part1
  ( LineOpts
  , line
  , line'
  , CircleOpts
  , circle
  , circle'
  , RectOpts
  , rect
  , rect'
  ) where

import Effect (Effect)
import Effect.Uncurried (EffectFn3, EffectFn4, EffectFn5, runEffectFn3, runEffectFn4, runEffectFn5)
import Prim.Row (class Union)
import Screeps.Types (MapVisual, RoomPosition)

-- line 'pos1, pos2, [style]' → 1 variant × opts 2 × 1 = 2 functions
type LineOpts =
  ( width :: Number
  , color :: String
  , opacity :: Number
  -- NOTE: lineStyle is 'undefined | dashed | dotted'; bound as String
  , lineStyle :: String
  )

foreign import lineImpl :: forall r. EffectFn4 MapVisual RoomPosition RoomPosition (Record r) MapVisual

-- | Draw a line.
line' :: forall r rest. Union r rest LineOpts => MapVisual -> RoomPosition -> RoomPosition -> Record r -> Effect MapVisual
line' = runEffectFn4 lineImpl

-- | Draw a line.
line :: MapVisual -> RoomPosition -> RoomPosition -> Effect MapVisual
line v p1 p2 = line' v p1 p2 {}

-- circle 'pos, [style]' → 1 variant × opts 2 × 1 = 2 functions
type CircleOpts =
  ( radius :: Number
  , fill :: String
  , opacity :: Number
  , stroke :: String
  , strokeWidth :: Number
  -- NOTE: lineStyle is 'undefined | dashed | dotted'; bound as String
  , lineStyle :: String
  )

foreign import circleImpl :: forall r. EffectFn3 MapVisual RoomPosition (Record r) MapVisual

-- | Draw a circle.
circle' :: forall r rest. Union r rest CircleOpts => MapVisual -> RoomPosition -> Record r -> Effect MapVisual
circle' = runEffectFn3 circleImpl

-- | Draw a circle.
circle :: MapVisual -> RoomPosition -> Effect MapVisual
circle v p = circle' v p {}

-- rect 'topLeftPos, width, height, [style]' → 1 variant × opts 2 × 1 = 2 functions
type RectOpts =
  ( fill :: String
  , opacity :: Number
  , stroke :: String
  , strokeWidth :: Number
  -- NOTE: lineStyle is 'undefined | dashed | dotted'; bound as String
  , lineStyle :: String
  )

foreign import rectImpl :: forall r. EffectFn5 MapVisual RoomPosition Number Number (Record r) MapVisual

-- | Draw a rectangle.
rect' :: forall r rest. Union r rest RectOpts => MapVisual -> RoomPosition -> Number -> Number -> Record r -> Effect MapVisual
rect' = runEffectFn5 rectImpl

-- | Draw a rectangle.
rect :: MapVisual -> RoomPosition -> Number -> Number -> Effect MapVisual
rect v p w h = rect' v p w h {}
