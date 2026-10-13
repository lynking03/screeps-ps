module Screeps.Internal.Game.Market.Part3
  ( changeOrderPrice
  , CreateOrderParams
  , createOrder
  , deal
  , dealYourRoomName
  ) where

import Effect (Effect)
import Effect.Uncurried (EffectFn1, EffectFn2, EffectFn3, runEffectFn1, runEffectFn2, runEffectFn3)
import Prim.Row (class Union)
import Screeps.Constants (OrderConstant, ResourceConstant, ReturnCode)

-- changeOrderPrice 'orderId, newPrice' → 1 variant × 1 × 1 = 1 function
foreign import changeOrderPriceImpl :: EffectFn2 String Number ReturnCode

-- | Change the price of an existing order.
changeOrderPrice :: String -> Number -> Effect ReturnCode
changeOrderPrice = runEffectFn2 changeOrderPriceImpl

-- createOrder 'params' → 1 variant × opts-object-style (record with optional roomName) = 1 function
-- NOTE: resourceType also accepts account-bound resources (INTERSHARD_RESOURCES), which have no ResourceConstant
type CreateOrderParams r =
  ( "type" :: OrderConstant
  , resourceType :: ResourceConstant
  , price :: Number
  , totalAmount :: Int
  | r
  )

foreign import createOrderImpl :: forall r. EffectFn1 (Record (CreateOrderParams r)) ReturnCode

-- | Create a market order in your terminal.
createOrder :: forall r rest. Union r rest (roomName :: String) => Record (CreateOrderParams r) -> Effect ReturnCode
createOrder = runEffectFn1 createOrderImpl

-- deal 'orderId, amount, [yourRoomName]' → 1 variant × 1 × (1 optional + 1) = 2 functions
foreign import dealImpl :: EffectFn2 String Int ReturnCode
foreign import dealYourRoomNameImpl :: EffectFn3 String Int String ReturnCode

-- | Execute a trade deal from your Terminal to another player's Terminal using the specified buy/sell order.
deal :: String -> Int -> Effect ReturnCode
deal = runEffectFn2 dealImpl

-- | Execute a trade deal from your Terminal in yourRoomName to another player's Terminal using the specified buy/sell order.
dealYourRoomName :: String -> Int -> String -> Effect ReturnCode
dealYourRoomName = runEffectFn3 dealYourRoomNameImpl
