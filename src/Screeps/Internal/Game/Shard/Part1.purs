module Screeps.Internal.Game.Shard.Part1
  ( name
  , type_
  , ptr
  ) where

import Effect (Effect)

-- | The name of the shard.
foreign import name :: Effect String

-- NOTE: `type` is a PureScript keyword, so the binding is exported as `type_`
-- | Currently always equals to `normal`.
foreign import type_ :: Effect String

-- | Whether this shard belongs to the PTR.
foreign import ptr :: Effect Boolean
