module Screeps.Internal.RoomVisual.Part3
  ( TextStyleOpts
  , text
  , text'
  , textXY
  , textXY'
  , clear
  , getSize
  ) where

import Effect (Effect)
import Effect.Uncurried (EffectFn1, EffectFn4, EffectFn5, runEffectFn1, runEffectFn4, runEffectFn5)
import Foreign (Foreign)
import Prim.Row (class Union)
import Screeps.Types (RoomPosition, RoomVisual)

-- text 'text, x, y, [style]|text, pos, [style]' → 2 variants × style 2 × 1 = 4 functions
-- NOTE: font accepts a number or a string; bound as Foreign
type TextStyleOpts =
  ( color :: String
  , font :: Foreign
  , stroke :: String
  , strokeWidth :: Number
  , backgroundColor :: String
  , backgroundPadding :: Number
  , align :: String
  , opacity :: Number
  )

foreign import textXYImpl :: forall r. EffectFn5 RoomVisual String Number Number (Record r) RoomVisual
foreign import textImpl :: forall r. EffectFn4 RoomVisual String RoomPosition (Record r) RoomVisual

-- | Draw a text label.
textXY' :: forall r rest. Union r rest TextStyleOpts => RoomVisual -> String -> Number -> Number -> Record r -> Effect RoomVisual
textXY' v t x y o = runEffectFn5 textXYImpl v t x y o

-- | Draw a text label.
textXY :: RoomVisual -> String -> Number -> Number -> Effect RoomVisual
textXY v t x y = textXY' v t x y {}

-- | Draw a text label.
text' :: forall r rest. Union r rest TextStyleOpts => RoomVisual -> String -> RoomPosition -> Record r -> Effect RoomVisual
text' v t p o = runEffectFn4 textImpl v t p o

-- | Draw a text label.
text :: RoomVisual -> String -> RoomPosition -> Effect RoomVisual
text v t p = text' v t p {}

-- | Remove all visuals from the room.
foreign import clearImpl :: EffectFn1 RoomVisual RoomVisual

-- | Remove all visuals from the room.
clear :: RoomVisual -> Effect RoomVisual
clear = runEffectFn1 clearImpl

-- | Get the stored size of all visuals added in the room in the current tick.
-- NOTE: reads per-tick accumulated state, so bound as Effect
foreign import getSizeImpl :: EffectFn1 RoomVisual Int

-- | Get the stored size of all visuals added in the room in the current tick.
getSize :: RoomVisual -> Effect Int
getSize = runEffectFn1 getSizeImpl
