module Screeps.Internal.Store.Part1
  ( getCapacity
  , getCapacityResource
  , getFreeCapacity
  , getFreeCapacityResource
  , getUsedCapacity
  , getUsedCapacityResource
  ) where

import Data.Function.Uncurried (Fn2, runFn2)
import Data.Maybe (Maybe)
import Data.Nullable (Nullable, toMaybe)
import Screeps.Constants (ResourceConstant)
import Screeps.Types (Store)

-- getCapacity '[resource]' → 1 variant × 1 × (1 optional + 1) = 2 functions
foreign import getCapacityImpl :: Store -> Nullable Int
foreign import getCapacityResourceImpl :: Fn2 Store ResourceConstant (Nullable Int)

-- | Returns capacity of this store for the specified resource.
getCapacity :: Store -> Maybe Int
getCapacity s = toMaybe (getCapacityImpl s)

-- | Returns capacity of this store for the specified resource.
getCapacityResource :: Store -> ResourceConstant -> Maybe Int
getCapacityResource s r = toMaybe (runFn2 getCapacityResourceImpl s r)

-- getFreeCapacity '[resource]' → 2 functions
foreign import getFreeCapacityImpl :: Store -> Nullable Int
foreign import getFreeCapacityResourceImpl :: Fn2 Store ResourceConstant (Nullable Int)

-- | Returns free capacity for the store.
getFreeCapacity :: Store -> Maybe Int
getFreeCapacity s = toMaybe (getFreeCapacityImpl s)

-- | Returns free capacity for the store.
getFreeCapacityResource :: Store -> ResourceConstant -> Maybe Int
getFreeCapacityResource s r = toMaybe (runFn2 getFreeCapacityResourceImpl s r)

-- getUsedCapacity '[resource]' → 2 functions
foreign import getUsedCapacityImpl :: Store -> Nullable Int
foreign import getUsedCapacityResourceImpl :: Fn2 Store ResourceConstant (Nullable Int)

-- | Returns the capacity used by the specified resource.
getUsedCapacity :: Store -> Maybe Int
getUsedCapacity s = toMaybe (getUsedCapacityImpl s)

-- | Returns the capacity used by the specified resource.
getUsedCapacityResource :: Store -> ResourceConstant -> Maybe Int
getUsedCapacityResource s r = toMaybe (runFn2 getUsedCapacityResourceImpl s r)
