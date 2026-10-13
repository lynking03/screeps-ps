module Screeps.Internal.Game.Market.Part5
  ( getOrderById
  ) where

import Effect (Effect)
import Effect.Uncurried (EffectFn1, runEffectFn1)
import Foreign (Foreign)

foreign import getOrderByIdImpl :: EffectFn1 String Foreign

-- | Retrieve info for specific market order.
-- NOTE: return record fields are described under getAllOrders, not bound here
getOrderById :: String -> Effect Foreign
getOrderById = runEffectFn1 getOrderByIdImpl
