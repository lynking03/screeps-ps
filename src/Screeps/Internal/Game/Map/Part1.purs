module Screeps.Internal.Game.Map.Part1
  ( describeExits
  , findExit
  , findExit'
  , FindRouteOpts
  , findRoute
  , findRoute'
  , Route
  ) where

import Prelude (map)

import Data.Either (Either(..))
import Data.Maybe (Maybe)
import Data.Nullable (Nullable, toMaybe)
import Effect (Effect)
import Effect.Uncurried (EffectFn1, EffectFn5, runEffectFn1, runEffectFn5)
import Data.Function.Uncurried (Fn2)
import Foreign.Object (Object)
import Prim.Row (class Union)
import Screeps.Constants (ExitConstant, ReturnCode)

foreign import describeExitsImpl :: EffectFn1 String (Nullable (Object String))

-- | List all exits available from the room with the given name.
-- NOTE: keys are direction constants as strings: "1" TOP, "3" RIGHT, "5" BOTTOM, "7" LEFT
describeExits :: String -> Effect (Maybe (Object String))
describeExits roomName = map toMaybe (runEffectFn1 describeExitsImpl roomName)

-- findRoute options, shared by findExit and findRoute
type FindRouteOpts = ( routeCallback :: Fn2 String String Number )

foreign import findExitImpl :: forall r. EffectFn5 (ReturnCode -> Either ReturnCode ExitConstant) (ExitConstant -> Either ReturnCode ExitConstant) String String (Record r) (Either ReturnCode ExitConstant)

-- | Find the exit direction from the given room en route to another room.
-- NOTE: fromRoom and toRoom accept only room names; Room objects are not accepted
-- NOTE: opts accepts findRoute's options
findExit' :: forall r rest. Union r rest FindRouteOpts => String -> String -> Record r -> Effect (Either ReturnCode ExitConstant)
findExit' fromRoom toRoom opts = runEffectFn5 findExitImpl Left Right fromRoom toRoom opts

-- | Find the exit direction from the given room en route to another room.
-- NOTE: fromRoom and toRoom accept only room names; Room objects are not accepted
findExit :: String -> String -> Effect (Either ReturnCode ExitConstant)
findExit fromRoom toRoom = findExit' fromRoom toRoom {}

-- | A single step of a route: the exit to take and the room it leads to.
type Route = { exit :: ExitConstant, room :: String }

foreign import findRouteImpl :: forall r. EffectFn5 (ReturnCode -> Either ReturnCode (Array Route)) (Array Route -> Either ReturnCode (Array Route)) String String (Record r) (Either ReturnCode (Array Route))

-- | Find route from the given room to another room.
-- NOTE: fromRoom and toRoom accept only room names; Room objects are not accepted
findRoute' :: forall r rest. Union r rest FindRouteOpts => String -> String -> Record r -> Effect (Either ReturnCode (Array Route))
findRoute' fromRoom toRoom opts = runEffectFn5 findRouteImpl Left Right fromRoom toRoom opts

-- | Find route from the given room to another room.
-- NOTE: fromRoom and toRoom accept only room names; Room objects are not accepted
findRoute :: String -> String -> Effect (Either ReturnCode (Array Route))
findRoute fromRoom toRoom = findRoute' fromRoom toRoom {}
