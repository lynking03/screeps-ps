module Screeps.Internal.Game.Market.Part1
  ( credits
  , MarketUser
  , MarketTransactionOrder
  , MarketTransaction
  , incomingTransactions
  , outgoingTransactions
  ) where

import Data.Nullable (Nullable)
import Effect (Effect)
import Screeps.Constants (ResourceConstant)

-- | Your current credits balance.
foreign import credits :: Effect Number

type MarketUser = { username :: String }

type MarketTransactionOrder =
  { id :: String
  , "type" :: String
  , price :: Number
  }

-- | A transaction record from `Game.market.incomingTransactions` or `outgoingTransactions`.
-- NOTE: `order` is optional in the docs; modelled as Nullable.
type MarketTransaction =
  { transactionId :: String
  , time :: Int
  , sender :: MarketUser
  , recipient :: MarketUser
  , resourceType :: ResourceConstant
  , amount :: Int
  , from :: String
  , to :: String
  , description :: String
  , order :: Nullable MarketTransactionOrder
  }

-- | An array of the last 100 incoming transactions to your terminals.
foreign import incomingTransactions :: Effect (Array MarketTransaction)

-- | An array of the last 100 outgoing transactions from your terminals.
foreign import outgoingTransactions :: Effect (Array MarketTransaction)
