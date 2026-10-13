module Screeps.Internal.Room.Part3
  ( terminal
  , visual
  , serializePath
  ) where

import Data.Maybe (Maybe)
import Data.Nullable (Nullable, toMaybe)
import Effect (Effect)
import Effect.Uncurried (EffectFn1, runEffectFn1)
import Foreign (Foreign)
import Screeps.Types (Room, RoomVisual, StructureTerminal)

foreign import terminalImpl :: Room -> Nullable StructureTerminal

-- | The Terminal structure of this room, if present, otherwise Nothing.
terminal :: Room -> Maybe StructureTerminal
terminal r = toMaybe (terminalImpl r)

-- | A RoomVisual object for this room, used to draw shapes and labels.
foreign import visual :: Room -> RoomVisual

-- NOTE: path elements (PathStep objects from Room.findPath) have no shared type; using Foreign
foreign import serializePathImpl :: EffectFn1 (Array Foreign) String

-- | Serialize a path array into a short string representation, which is suitable to store in memory.
serializePath :: Array Foreign -> Effect String
serializePath = runEffectFn1 serializePathImpl
