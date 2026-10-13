module Screeps.Internal.StructureSpawn.Part1
  ( memory
  , name
  , spawning
  ) where

import Data.Maybe (Maybe)
import Data.Nullable (Nullable, toMaybe)
import Effect (Effect)
import Effect.Uncurried (EffectFn1, runEffectFn1)
import Foreign (Foreign)
import Screeps.Types (StructureSpawn, StructureSpawnSpawning)

foreign import memoryImpl :: EffectFn1 StructureSpawn Foreign

-- | A shorthand to Memory.spawns[spawn.name]. Read-only access to the spawn's memory object.
-- | To write memory, use Screeps.Memory.
memory :: StructureSpawn -> Effect Foreign
memory = runEffectFn1 memoryImpl

-- | Spawn's name. You choose the name upon creating a new spawn, and it cannot be changed later.
foreign import name :: StructureSpawn -> String

foreign import spawningImpl :: StructureSpawn -> Nullable StructureSpawnSpawning

-- | If the spawn is in process of spawning a new creep, this object will contain a spawning object, or Nothing otherwise.
spawning :: StructureSpawn -> Maybe StructureSpawnSpawning
spawning s = toMaybe (spawningImpl s)
