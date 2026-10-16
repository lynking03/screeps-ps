module Screeps.Internal.Game.Market.Part4
  ( MarketOrder
  , MarketHistoryEntry
  , extendOrder
  , getAllOrders
  , getAllOrdersFilter
  , getHistory
  , getHistoryResourceType
  ) where

import Data.Nullable (Nullable)
import Effect (Effect)
import Effect.Uncurried (EffectFn1, EffectFn2, runEffectFn1, runEffectFn2)
import Screeps.Constants (OrderConstant, ResourceConstant, ReturnCode)

-- An order returned by getAllOrders.
-- NOTE: resourceType also accepts account-bound resources (INTERSHARD_RESOURCES), which are not in ResourceConstant
type MarketOrder =
  { id :: String
  , created :: Nullable Int -- NOTE: absent for inter-shard market orders
  , createdTimestamp :: Nullable Number -- NOTE: absent for old orders
  , "type" :: OrderConstant
  , resourceType :: ResourceConstant
  , roomName :: String
  , amount :: Int
  , remainingAmount :: Int
  , price :: Number
  }

-- One day of market price history, as returned by getHistory.
type MarketHistoryEntry =
  { resourceType :: ResourceConstant
  , date :: String
  , transactions :: Int
  , volume :: Int
  , avgPrice :: Number
  , stddevPrice :: Number
  }

foreign import extendOrderImpl :: EffectFn2 String Int ReturnCode

-- | Add more capacity to an existing order.
extendOrder :: String -> Int -> Effect ReturnCode
extendOrder = runEffectFn2 extendOrderImpl

foreign import getAllOrdersImpl :: Effect (Array MarketOrder)

-- | Get other players' orders currently active on the market.
getAllOrders :: Effect (Array MarketOrder)
getAllOrders = getAllOrdersImpl

-- NOTE: filter also accepts an object form ({ type, resourceType, ... }); only the function form is bound here
foreign import getAllOrdersFilterImpl :: EffectFn1 (MarketOrder -> Boolean) (Array MarketOrder)

-- | Get other players' orders currently active on the market.
getAllOrdersFilter :: (MarketOrder -> Boolean) -> Effect (Array MarketOrder)
getAllOrdersFilter = runEffectFn1 getAllOrdersFilterImpl

-- NOTE: no example for this overload
foreign import getHistoryImpl :: Effect (Array MarketHistoryEntry)

-- | Get daily price history of the specified resource on the market for the last 14 days.
getHistory :: Effect (Array MarketHistoryEntry)
getHistory = getHistoryImpl

foreign import getHistoryResourceTypeImpl :: EffectFn1 ResourceConstant (Array MarketHistoryEntry)

-- | Get daily price history of the specified resource on the market for the last 14 days.
getHistoryResourceType :: ResourceConstant -> Effect (Array MarketHistoryEntry)
getHistoryResourceType = runEffectFn1 getHistoryResourceTypeImpl
