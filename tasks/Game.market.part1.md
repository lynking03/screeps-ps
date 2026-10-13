# Game.market: part 1 of 5
Module: `Screeps.Internal.Game.Market.Part1`
Files: `src/Screeps/Internal/Game/Market/Part1.purs` and `src/Screeps/Internal/Game/Market/Part1.js`
Bind ONLY these members: Game.market.credits, Game.market.incomingTransactions, Game.market.outgoingTransactions
Other parts bind the rest of Game.market. Do not bind anything not listed above.

## About Game.market

A global object representing the in-game market. You can use this object to track resource transactions to/from your terminals, and your buy/sell orders.

Learn more about the market system from [this article](/market.html).

## Members

{% api_property Game.market.credits 'number' %}

Your current credits balance.

{% api_property Game.market.incomingTransactions 'array' %}

```javascript
[{
    transactionId : "56dec546a180ce641dd65960",
    time : 10390687,
    sender : {username: "Sender"},
    recipient : {username: "Me"},
    resourceType : "U",
    amount : 100,
    from : "W0N0",
    to : "W10N10",
    description : "trade contract #1",
	order: {		// optional
		id : "55c34a6b5be41a0a6e80c68b",
		type : "sell",
		price : 2.95
	}
}]
```

An array of the last 100 incoming transactions to your terminals with the following format:

{% api_property Game.market.outgoingTransactions 'array' %}

```javascript
[{
    transactionId : "56dec546a180ce641dd65960",
    time : 10390687,
    sender : {username: "Me"},
    recipient : {username: "Recipient"},
    resourceType : "U",
    amount : 100,
    from : "W0N0",
    to : "W10N10",
    description : "trade contract #1",
	order: {		// optional
		id : "55c34a6b5be41a0a6e80c68b",
		type : "sell",
		price : 2.95
	}
}]
```

An array of the last 100 outgoing transactions from your terminals with the following format:
