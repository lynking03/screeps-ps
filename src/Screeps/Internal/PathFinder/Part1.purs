module Screeps.Internal.PathFinder.Part1
  ( Goal
  , SearchOpts
  , SearchResult
  , search
  , search'
  ) where

import Effect (Effect)
import Effect.Uncurried (EffectFn3, runEffectFn3)
import Prim.Row (class Union)
import Screeps.Types (CostMatrix, RoomPosition)

-- A goal: range defaults to 0 in the game; it is required here.
-- NOTE: a bare RoomPosition goal (without pos/range) is not bound.
type Goal = { pos :: RoomPosition, range :: Int }

type SearchOpts =
  ( roomCallback :: String -> CostMatrix
  , plainCost :: Int
  , swampCost :: Int
  , flee :: Boolean
  , maxOps :: Int
  , maxRooms :: Int
  , maxCost :: Number
  , heuristicWeight :: Number
  )
-- NOTE: roomCallback must return a CostMatrix; returning false (skip room) is not expressible here.
-- NOTE: roomCallback must be pure; it is invoked synchronously by the pathfinder.

type SearchResult =
  { path :: Array RoomPosition
  , ops :: Int
  , cost :: Int
  , incomplete :: Boolean
  }

foreign import searchImpl :: forall r. EffectFn3 RoomPosition (Array Goal) (Record r) SearchResult

-- | Find an optimal path between origin and goal.
search' :: forall r rest. Union r rest SearchOpts => RoomPosition -> Array Goal -> Record r -> Effect SearchResult
search' = runEffectFn3 searchImpl

-- | Find an optimal path between origin and goal.
search :: RoomPosition -> Array Goal -> Effect SearchResult
search o g = search' o g {}
