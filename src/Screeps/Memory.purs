-- | The global `Memory` object: arbitrary JSON kept between ticks (2 MB limit).
-- |
-- | Values are `Foreign`; decode them yourself. Write only JSON data (records,
-- | arrays, strings, numbers, booleans). Never store game objects: store their
-- | `id` and look them up with `Game.getObjectById` next tick.
-- |
-- | Per-object memory (`creep.memory`, `flag.memory`, `room.memory`,
-- | `spawn.memory`, `powerCreep.memory`) is an alias for
-- | `Memory.<creeps|flags|rooms|spawns|powerCreeps>[name]`, so it can be read and
-- | written here with a path, e.g. `setPath ["creeps", name, "role"] v`.
-- |
-- | `RawMemory` (custom serialisation, segments) is bound separately.
module Screeps.Memory
  ( memory
  , get
  , set
  , delete
  , getPath
  , setPath
  , deletePath
  ) where

import Prelude

import Data.Maybe (Maybe)
import Data.Nullable (Nullable, toMaybe)
import Effect (Effect)
import Effect.Uncurried (EffectFn1, EffectFn2, runEffectFn1, runEffectFn2)
import Foreign (Foreign)

foreign import memoryImpl :: Effect Foreign
foreign import getImpl :: EffectFn1 String (Nullable Foreign)
foreign import setImpl :: EffectFn2 String Foreign Unit
foreign import deleteImpl :: EffectFn1 String Unit
foreign import getPathImpl :: EffectFn1 (Array String) (Nullable Foreign)
foreign import setPathImpl :: EffectFn2 (Array String) Foreign Unit
foreign import deletePathImpl :: EffectFn1 (Array String) Unit

-- | The whole `Memory` object. It is mutable: later writes show through it.
memory :: Effect Foreign
memory = memoryImpl

-- | `Memory[key]`, or `Nothing` when it is missing, `null` or `undefined`.
get :: String -> Effect (Maybe Foreign)
get key = toMaybe <$> runEffectFn1 getImpl key

-- | Set `Memory[key]`.
set :: String -> Foreign -> Effect Unit
set = runEffectFn2 setImpl

-- | Remove `Memory[key]`.
delete :: String -> Effect Unit
delete = runEffectFn1 deleteImpl

-- | Follow a path of keys from `Memory`. `Nothing` if any step is missing or not
-- | an object. `getPath []` is the whole `Memory`.
getPath :: Array String -> Effect (Maybe Foreign)
getPath path = toMaybe <$> runEffectFn1 getPathImpl path

-- | Set the value at a path, creating missing intermediate objects (and
-- | replacing non-object ones). `setPath []` does nothing.
setPath :: Array String -> Foreign -> Effect Unit
setPath = runEffectFn2 setPathImpl

-- | Remove the value at a path. Does nothing if the path does not exist.
deletePath :: Array String -> Effect Unit
deletePath = runEffectFn1 deletePathImpl
