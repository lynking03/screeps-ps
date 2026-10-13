module Screeps.Internal.PowerCreep.Part8
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
import Screeps.Types (Creep, PowerCreep, class HasPos)

-- move 'direction' → 1 variant split by type: number (move) and Creep (moveCreep)

foreign import moveImpl :: EffectFn2 PowerCreep DirectionConstant ReturnCode
foreign import moveCreepImpl :: EffectFn2 PowerCreep Creep ReturnCode

-- | Move the creep one square in the specified direction.
move :: PowerCreep -> DirectionConstant -> Effect ReturnCode
move = runEffectFn2 moveImpl

-- | Move the creep one square in the specified direction, toward a nearby creep.
moveCreep :: PowerCreep -> Creep -> Effect ReturnCode
moveCreep = runEffectFn2 moveCreepImpl

-- moveByPath 'path' → 1 variant; path is array|string, so one function per form
-- NOTE: path step elements are not described in the docs, so they are Foreign

foreign import moveByPathImpl :: EffectFn2 PowerCreep (Array Foreign) ReturnCode
foreign import moveByPathSerializedImpl :: EffectFn2 PowerCreep String ReturnCode

-- | Move the creep using the specified predefined path.
moveByPath :: PowerCreep -> Array Foreign -> Effect ReturnCode
moveByPath = runEffectFn2 moveByPathImpl

-- | Move the creep using the specified predefined serialized path.
moveByPathSerialized :: PowerCreep -> String -> Effect ReturnCode
moveByPathSerialized = runEffectFn2 moveByPathSerializedImpl

-- moveTo 'x, y, [opts]|target, [opts]' → 2 variants × opts 2 × 1 = 4 functions
type MoveToOpts =
  ( reusePath :: Int
  , serializeMemory :: Boolean
  , noPathFinding :: Boolean
  , "visualizePathStyle" :: Foreign
  )
-- NOTE: also accepts Room.findPath's options
-- NOTE: visualizePathStyle is nested options, typed as Foreign

foreign import moveToImpl :: forall t r. EffectFn3 PowerCreep t (Record r) ReturnCode
foreign import moveToXYImpl :: forall r. EffectFn4 PowerCreep Int Int (Record r) ReturnCode

-- | Find the optimal path to the target within the same room and move to it.
moveTo' :: forall t r rest. HasPos t => Union r rest MoveToOpts => PowerCreep -> t -> Record r -> Effect ReturnCode
moveTo' = runEffectFn3 moveToImpl

-- | Find the optimal path to the target within the same room and move to it.
moveTo :: forall t. HasPos t => PowerCreep -> t -> Effect ReturnCode
moveTo c t = moveTo' c t {}

-- | Find the optimal path to the coordinates within the same room and move there.
moveToXY' :: forall r rest. Union r rest MoveToOpts => PowerCreep -> Int -> Int -> Record r -> Effect ReturnCode
moveToXY' = runEffectFn4 moveToXYImpl

-- | Find the optimal path to the coordinates within the same room and move there.
moveToXY :: PowerCreep -> Int -> Int -> Effect ReturnCode
moveToXY c x y = moveToXY' c x y {}
