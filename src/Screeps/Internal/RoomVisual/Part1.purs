module Screeps.Internal.RoomVisual.Part1
  ( newRoomVisual
  , newRoomVisualRoomName
  , roomName
  , LineStyle
  , line
  , line'
  , lineXY
  , lineXY'
  ) where

import Effect (Effect)
import Effect.Uncurried (EffectFn1, EffectFn4, EffectFn6, runEffectFn1, runEffectFn4, runEffectFn6)
import Prim.Row (class Union)
import Screeps.Types (RoomVisual, class HasPos)

-- | Create a new RoomVisual object in any room, even if it's invisible to your script.
-- | Visuals posted through it go to all rooms.
foreign import newRoomVisual :: Effect RoomVisual

foreign import newRoomVisualRoomNameImpl :: EffectFn1 String RoomVisual

-- | Create a new RoomVisual object in the given room, even if it's invisible to your script.
newRoomVisualRoomName :: String -> Effect RoomVisual
newRoomVisualRoomName = runEffectFn1 newRoomVisualRoomNameImpl

-- | The name of the room.
foreign import roomName :: RoomVisual -> String

-- line 'x1, y1, x2, y2, [style]|pos1, pos2, [style]' → 2 variants × style 2 × 1 = 4 functions
type LineStyle =
  ( width :: Number
  , color :: String
  , opacity :: Number
  , lineStyle :: String
  )

foreign import lineImpl :: forall t u r. EffectFn4 RoomVisual t u (Record r) RoomVisual
foreign import lineXYImpl :: forall r. EffectFn6 RoomVisual Number Number Number Number (Record r) RoomVisual

-- | Draw a line.
line' :: forall t u r rest. HasPos t => HasPos u => Union r rest LineStyle => RoomVisual -> t -> u -> Record r -> Effect RoomVisual
line' = runEffectFn4 lineImpl

-- | Draw a line.
line :: forall t u. HasPos t => HasPos u => RoomVisual -> t -> u -> Effect RoomVisual
line v p1 p2 = line' v p1 p2 {}

-- | Draw a line.
lineXY' :: forall r rest. Union r rest LineStyle => RoomVisual -> Number -> Number -> Number -> Number -> Record r -> Effect RoomVisual
lineXY' = runEffectFn6 lineXYImpl

-- | Draw a line.
lineXY :: RoomVisual -> Number -> Number -> Number -> Number -> Effect RoomVisual
lineXY v x1 y1 x2 y2 = lineXY' v x1 y1 x2 y2 {}
