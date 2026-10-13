module Screeps.Internal.StructureSpawn.Part2
  ( store
  , SpawnCreepOpts
  , spawnCreep
  , spawnCreep'
  , recycleCreep
  ) where

import Effect (Effect)
import Effect.Uncurried (EffectFn2, EffectFn4, runEffectFn2, runEffectFn4)
import Foreign (Foreign)
import Prim.Row (class Union)
import Screeps.Constants (BodyPartConstant, DirectionConstant, ReturnCode)
import Screeps.Types (Creep, OwnedStructure, Store, StructureSpawn)

-- | A store object that contains cargo of this structure.
foreign import store :: StructureSpawn -> Store

-- spawnCreep 'body, name, [opts]' → 1 variant × opts 2 × 1 = 2 functions
-- NOTE: memory is `any` in the docs; bound as Foreign, no codecs. To write memory, use Screeps.Memory.
-- NOTE: energyStructures accepts spawns and extensions; no shared class covers both except OwnedStructure
type SpawnCreepOpts =
  ( memory :: Foreign
  , energyStructures :: Array OwnedStructure
  , dryRun :: Boolean
  , directions :: Array DirectionConstant
  )

foreign import spawnCreepImpl :: forall r. EffectFn4 StructureSpawn (Array BodyPartConstant) String (Record r) ReturnCode

-- | Start the creep spawning process. The required energy amount can be withdrawn from all spawns and extensions in the room.
spawnCreep' :: forall r rest. Union r rest SpawnCreepOpts => StructureSpawn -> Array BodyPartConstant -> String -> Record r -> Effect ReturnCode
spawnCreep' = runEffectFn4 spawnCreepImpl

-- | Start the creep spawning process. The required energy amount can be withdrawn from all spawns and extensions in the room.
spawnCreep :: StructureSpawn -> Array BodyPartConstant -> String -> Effect ReturnCode
spawnCreep s b n = spawnCreep' s b n {}

foreign import recycleCreepImpl :: EffectFn2 StructureSpawn Creep ReturnCode

-- | Kill the creep and drop up to 100% of resources spent on its spawning and boosting depending on remaining life time.
recycleCreep :: StructureSpawn -> Creep -> Effect ReturnCode
recycleCreep = runEffectFn2 recycleCreepImpl
