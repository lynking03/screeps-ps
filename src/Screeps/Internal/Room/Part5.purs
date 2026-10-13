module Screeps.Internal.Room.Part5
  ( FindOpts
  , find
  , find'
  , findExitTo
  , PathStep
  , FindPathOpts
  , findPath
  , findPath'
  ) where

import Data.Either (Either(..))
import Data.Unit (Unit)
import Effect (Effect)
import Effect.Uncurried (EffectFn2, EffectFn3, EffectFn4, runEffectFn3, runEffectFn4)
import Foreign (Foreign)
import Prim.Row (class Union)
import Screeps.Constants (DirectionConstant, ExitConstant, FindConstant, ReturnCode)
import Screeps.Types (CostMatrix, Room, RoomPosition)

-- find 'type, [opts]' → 1 variant × opts 2 × 1 = 2 functions
-- NOTE: filter also accepts object and string forms; only the function form is bound
type FindOpts a = ( filter :: a -> Boolean )

foreign import findImpl :: forall a r. EffectFn3 Room (FindConstant a) (Record r) (Array a)

-- | Find all objects of the specified type in the room.
find' :: forall a r rest. Union r rest (FindOpts a) => Room -> FindConstant a -> Record r -> Effect (Array a)
find' = runEffectFn3 findImpl

-- | Find all objects of the specified type in the room.
find :: forall a. Room -> FindConstant a -> Effect (Array a)
find room t = find' room t {}

-- findExitTo 'room' → 1 variant × 1 = 1 function
-- NOTE: room accepts a room name or Room object; only the room name string form is bound
foreign import findExitToImpl :: EffectFn4 (ReturnCode -> Either ReturnCode ExitConstant) (ExitConstant -> Either ReturnCode ExitConstant) Room String (Either ReturnCode ExitConstant)

-- | Find the exit direction en route to another room.
findExitTo :: Room -> String -> Effect (Either ReturnCode ExitConstant)
findExitTo = runEffectFn4 findExitToImpl Left Right

-- | One path step: position, movement delta, and direction.
type PathStep = { x :: Int, y :: Int, dx :: Int, dy :: Int, direction :: DirectionConstant }

-- findPath 'fromPos, toPos, [opts]' → 1 variant × opts 2 × 1 = 2 functions
-- NOTE: ignore and avoid take arrays of RoomObject or RoomPosition; bound as Array Foreign
-- NOTE: costCallback must return undefined; a replacement CostMatrix returned by it is not supported
-- NOTE: serialize = true makes the game return a serialized string instead of the array below
type FindPathOpts =
  ( ignoreCreeps :: Boolean
  , ignoreDestructibleStructures :: Boolean
  , ignoreRoads :: Boolean
  , costCallback :: EffectFn2 String CostMatrix Unit
  , ignore :: Array Foreign
  , avoid :: Array Foreign
  , maxOps :: Int
  , heuristicWeight :: Number
  , serialize :: Boolean
  , maxRooms :: Int
  , range :: Int
  , plainCost :: Int
  , swampCost :: Int
  )

foreign import findPathImpl :: forall r. EffectFn4 Room RoomPosition RoomPosition (Record r) (Array PathStep)

-- | Find an optimal path inside the room between fromPos and toPos using Jump Point Search algorithm.
findPath' :: forall r rest. Union r rest FindPathOpts => Room -> RoomPosition -> RoomPosition -> Record r -> Effect (Array PathStep)
findPath' = runEffectFn4 findPathImpl

-- | Find an optimal path inside the room between fromPos and toPos using Jump Point Search algorithm.
findPath :: Room -> RoomPosition -> RoomPosition -> Effect (Array PathStep)
findPath room fromPos toPos = findPath' room fromPos toPos {}
