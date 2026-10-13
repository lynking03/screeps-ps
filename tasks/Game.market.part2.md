# Game.market: part 2 of 5
Module: `Screeps.Internal.Game.Market.Part2`
Files: `src/Screeps/Internal/Game/Market/Part2.purs` and `src/Screeps/Internal/Game/Market/Part2.js`
Bind ONLY these members: Game.market.orders, Game.market.calcTransactionCost, Game.market.cancelOrder
Other parts bind the rest of Game.market. Do not bind anything not listed above.

## About Game.market

A global object representing the in-game market. You can use this object to track resource transactions to/from your terminals, and your buy/sell orders.

Learn more about the market system from [this article](/market.html).

## Members

{% api_property Game.market.orders 'object' %}

```javascript
{
	"55c34a6b5be41a0a6e80c68b": {
		id : "55c34a6b5be41a0a6e80c68b",
		created : 13131117,
		active: true,
		type : "sell"
		resourceType : "OH",
		roomName : "W1N1",
		amount : 15821,
		remainingAmount : 30000,
		totalAmount : 50000,
		price : 2.95
	},
	"55c34a6b52411a0a6e80693a": {
		id : "55c34a6b52411a0a6e80693a",
		created : 13134122,
		active: true,
		type : "buy"
		resourceType : "energy",
		roomName : "W1N1",
		amount : 94000,
		remainingAmount : 94000,
		totalAmount : 94000
		price : 0.45
	},
	"55c34a6b5be41a0a6e80c123": {
		id : "55c34a6b5be41a0a6e80c123",
		created : 13105123,
		active: false,
		type : "sell"
		resourceType : "token",
		amount : 0,
		remainingAmount : 10,
		totalAmount : 10,
		price : 50000
	}
}
```

An object with your active and inactive buy/sell orders on the market.
See
getAllOrders
for properties explanation.

{% api_method Game.market.calcTransactionCost 'amount, roomName1, roomName2' 0 %}

```javascript
const cost = Game.market.calcTransactionCost(1000, 'W0N0', 'W10N5');
// -> 284 energy units
```

Estimate the energy transaction cost of StructureTerminal.send and Game.market.deal methods.
The formula:

```javascript-content
Math.ceil( amount * ( 1 - Math.exp(-distanceBetweenRooms/30) ) )
```

{% api_method_params %}
amount : number
Amount of resources to be sent.
===
roomName1 : string
The name of the first room.
===
roomName2 : string
The name of the second room.
{% endapi_method_params %}

### Return value

The amount of energy required to perform the transaction.

{% api_method Game.market.cancelOrder 'orderId' A %}

```javascript
for(const id in Game.market.orders) {
    Game.market.cancelOrder(id);
}
```

Cancel a previously created order. The 5% fee is not returned.

{% api_method_params %}
orderId : string
The order ID as provided in Game.market.orders.
{% endapi_method_params %}

### Return value

One of the following codes:
{% api_return_codes %}
OK | The operation has been scheduled successfully.
ERR_INVALID_ARGS | The order ID is not valid.
{% endapi_return_codes %}
