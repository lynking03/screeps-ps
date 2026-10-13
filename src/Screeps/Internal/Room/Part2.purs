module Screeps.Internal.Room.Part2
  ( memory
  , name
  , storage
  ) where

import Data.Maybe (Maybe)
import Data.Nullable (Nullable, toMaybe)
import Effect (Effect)
import Effect.Uncurried (EffectFn1, runEffectFn1)
import Foreign (Foreign)
import Screeps.Types (Room, StructureStorage)

foreign import memoryImpl :: EffectFn1 Room Foreign

-- | A shorthand to Memory.rooms[room.name].
-- | To write memory, use Screeps.Memory.
-- NOTE: user data; no codecs
memory :: Room -> Effect Foreign
memory = runEffectFn1 memoryImpl

-- | The name of the room.
foreign import name :: Room -> String

foreign import storageImpl :: Room -> Nullable StructureStorage

-- | The Storage structure of this room, if present.
storage :: Room -> Maybe StructureStorage
storage r = toMaybe (storageImpl r)
