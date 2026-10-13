module Screeps.Internal.RoomVisual.Part2
  ( CircleOpts
  , circle
  , circle'
  , circleXY
  , circleXY'
  , RectOpts
  , rect
  , rect'
  , rectXY
  , rectXY'
  , PolyOpts
  , poly
  , poly'
  ) where

import Effect (Effect)
import Effect.Uncurried (EffectFn3, EffectFn4, EffectFn5, EffectFn6, runEffectFn3, runEffectFn4, runEffectFn5, runEffectFn6)
import Foreign (Foreign)
import Prim.Row (class Union)
import Screeps.Types (RoomPosition, RoomVisual)

-- circle 'x, y, [style]|pos, [style]' → 2 variants × opts object 2 = 4 functions
type CircleOpts =
  ( radius :: Number
  , fill :: String
  , opacity :: Number
  , stroke :: String
  , strokeWidth :: Number
  , lineStyle :: String
  )

foreign import circleImpl :: forall r. EffectFn3 RoomVisual RoomPosition (Record r) RoomVisual
foreign import circleXYImpl :: forall r. EffectFn4 RoomVisual Number Number (Record r) RoomVisual

-- | Draw a circle.
circle' :: forall r rest. Union r rest CircleOpts => RoomVisual -> RoomPosition -> Record r -> Effect RoomVisual
circle' = runEffectFn3 circleImpl

-- | Draw a circle.
circle :: RoomVisual -> RoomPosition -> Effect RoomVisual
circle rv p = circle' rv p {}

-- | Draw a circle.
circleXY' :: forall r rest. Union r rest CircleOpts => RoomVisual -> Number -> Number -> Record r -> Effect RoomVisual
circleXY' = runEffectFn4 circleXYImpl

-- | Draw a circle.
circleXY :: RoomVisual -> Number -> Number -> Effect RoomVisual
circleXY rv x y = circleXY' rv x y {}

-- rect 'x, y, width, height, [style]|topLeftPos, width, height, [style]' → 2 variants × opts object 2 = 4 functions
type RectOpts =
  ( fill :: String
  , opacity :: Number
  , stroke :: String
  , strokeWidth :: Number
  , lineStyle :: String
  )

foreign import rectImpl :: forall r. EffectFn5 RoomVisual RoomPosition Number Number (Record r) RoomVisual
foreign import rectXYImpl :: forall r. EffectFn6 RoomVisual Number Number Number Number (Record r) RoomVisual

-- | Draw a rectangle.
-- NOTE: no example for this overload
rect' :: forall r rest. Union r rest RectOpts => RoomVisual -> RoomPosition -> Number -> Number -> Record r -> Effect RoomVisual
rect' = runEffectFn5 rectImpl

-- | Draw a rectangle.
-- NOTE: no example for this overload
rect :: RoomVisual -> RoomPosition -> Number -> Number -> Effect RoomVisual
rect rv p w h = rect' rv p w h {}

-- | Draw a rectangle.
rectXY' :: forall r rest. Union r rest RectOpts => RoomVisual -> Number -> Number -> Number -> Number -> Record r -> Effect RoomVisual
rectXY' = runEffectFn6 rectXYImpl

-- | Draw a rectangle.
rectXY :: RoomVisual -> Number -> Number -> Number -> Number -> Effect RoomVisual
rectXY rv x y w h = rectXY' rv x y w h {}

-- poly 'points, [style]' → 1 variant × opts object 2 = 2 functions
type PolyOpts =
  ( fill :: String
  , opacity :: Number
  , stroke :: String
  , strokeWidth :: Number
  , lineStyle :: String
  )

-- NOTE: each point is either a RoomPosition or an [x, y] array; typed as Foreign
foreign import polyImpl :: forall r. EffectFn3 RoomVisual (Array Foreign) (Record r) RoomVisual

-- | Draw a polyline.
poly' :: forall r rest. Union r rest PolyOpts => RoomVisual -> Array Foreign -> Record r -> Effect RoomVisual
poly' = runEffectFn3 polyImpl

-- | Draw a polyline.
poly :: RoomVisual -> Array Foreign -> Effect RoomVisual
poly rv pts = poly' rv pts {}
