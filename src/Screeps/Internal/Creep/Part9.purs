module Screeps.Internal.Creep.Part9
  ( move
  , moveCreep
  , moveByPath
  , moveByPathSerialized
  , MoveToOpts
  , moveTo
  , moveTo'
  , moveToXY
  , moveToXY'
  ) where

import Effect (Effect)
import Effect.Uncurried (EffectFn2, EffectFn3, EffectFn4, runEffectFn2, runEffectFn3, runEffectFn4)
import Foreign (Foreign)
import Prim.Row (class Union)
import Screeps.Constants (DirectionConstant, ReturnCode)
import Screeps.Types (Creep, class HasPos)

-- move 'direction' → 2 variants (direction constant, creep) × 1 = 2 functions
foreign import moveImpl :: EffectFn2 Creep DirectionConstant ReturnCode
foreign import moveCreepImpl :: EffectFn2 Creep Creep ReturnCode

-- | Move the creep one square in the specified direction.
move :: Creep -> DirectionConstant -> Effect ReturnCode
move = runEffectFn2 moveImpl

-- | Move the creep one square in the direction of a nearby creep (pulling).
moveCreep :: Creep -> Creep -> Effect ReturnCode
moveCreep = runEffectFn2 moveCreepImpl

-- moveByPath 'path' → 1 variant; path is array|string → array form and string form = 2 functions
-- NOTE: path array elements are Room.findPath step objects; element format is not described in the spec, so Foreign
foreign import moveByPathImpl :: EffectFn2 Creep (Array Foreign) ReturnCode
foreign import moveByPathSerializedImpl :: EffectFn2 Creep String ReturnCode

-- | Move the creep using the specified predefined path.
moveByPath :: Creep -> Array Foreign -> Effect ReturnCode
moveByPath = runEffectFn2 moveByPathImpl

-- | Move the creep using the specified predefined path, given in serialized string form (Room.serializePath).
moveByPathSerialized :: Creep -> String -> Effect ReturnCode
moveByPathSerialized = runEffectFn2 moveByPathSerializedImpl

-- moveTo 'x, y, [opts]|target, [opts]' → 2 variants × opts 2 × 1 = 4 functions
type MoveToOpts =
  ( reusePath :: Int
  , serializeMemory :: Boolean
  , noPathFinding :: Boolean
  )
-- NOTE: also accepts Room.findPath's options
-- NOTE: visualizePathStyle (nested options) omitted

foreign import moveToImpl :: forall t r. EffectFn3 Creep t (Record r) ReturnCode
foreign import moveToXYImpl :: forall r. EffectFn4 Creep Int Int (Record r) ReturnCode

-- | Find the optimal path to the target within the same room and move to it.
moveTo' :: forall t r rest. HasPos t => Union r rest MoveToOpts => Creep -> t -> Record r -> Effect ReturnCode
moveTo' = runEffectFn3 moveToImpl

-- | Find the optimal path to the target within the same room and move to it.
moveTo :: forall t. HasPos t => Creep -> t -> Effect ReturnCode
moveTo c t = moveTo' c t {}

-- | Find the optimal path to the coordinates within the same room and move there.
moveToXY' :: forall r rest. Union r rest MoveToOpts => Creep -> Int -> Int -> Record r -> Effect ReturnCode
moveToXY' = runEffectFn4 moveToXYImpl

-- | Find the optimal path to the coordinates within the same room and move there.
moveToXY :: Creep -> Int -> Int -> Effect ReturnCode
moveToXY c x y = moveToXY' c x y {}
