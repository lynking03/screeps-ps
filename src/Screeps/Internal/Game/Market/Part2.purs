module Screeps.Internal.Game.Market.Part2
  ( orders
  , calcTransactionCost
  , cancelOrder
  ) where

import Effect (Effect)
import Effect.Uncurried (EffectFn1, EffectFn3, runEffectFn1, runEffectFn3)
import Foreign (Foreign)
import Foreign.Object (Object)
import Screeps.Constants (ReturnCode)

-- | An object with your active and inactive buy/sell orders on the market, keyed by order ID.
-- NOTE: the order record fields are not listed in the spec (see getAllOrders); values are left as Foreign
foreign import orders :: Effect (Object Foreign)

foreign import calcTransactionCostImpl :: EffectFn3 Int String String Int

-- | Estimate the energy transaction cost of StructureTerminal.send and Game.market.deal methods.
calcTransactionCost :: Int -> String -> String -> Effect Int
calcTransactionCost = runEffectFn3 calcTransactionCostImpl

foreign import cancelOrderImpl :: EffectFn1 String ReturnCode

-- | Cancel a previously created order. The 5% fee is not returned.
cancelOrder :: String -> Effect ReturnCode
cancelOrder = runEffectFn1 cancelOrderImpl
