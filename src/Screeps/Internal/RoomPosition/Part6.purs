module Screeps.Internal.RoomPosition.Part6
  ( look
  , lookFor
  ) where

import Effect (Effect)
import Effect.Uncurried (EffectFn1, EffectFn2, runEffectFn1, runEffectFn2)
import Foreign (Foreign)
import Screeps.Constants (LookConstant)
import Screeps.Types (RoomPosition)

foreign import lookImpl :: EffectFn1 RoomPosition (Array Foreign)
foreign import lookForImpl :: forall a. EffectFn2 RoomPosition (LookConstant a) (Array a)

-- | Get the list of objects at the specified room position.
-- NOTE: each element is a tagged union keyed by `type` (creep, structure, terrain, ...), with a field named after the type; no per-type codecs
look :: RoomPosition -> Effect (Array Foreign)
look = runEffectFn1 lookImpl

-- | Get an object with the given type at the specified room position.
lookFor :: forall a. RoomPosition -> LookConstant a -> Effect (Array a)
lookFor = runEffectFn2 lookForImpl
