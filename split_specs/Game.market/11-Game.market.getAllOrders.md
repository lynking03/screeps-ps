{% api_method Game.market.getAllOrders '[filter]' 3 %}

```javascript
Game.market.getAllOrders(); // slow
```

```javascript
Game.market.getAllOrders({type: ORDER_SELL, resourceType: RESOURCE_GHODIUM}); // fast
```

```javascript
const targetRoom = "W1N1";
Game.market.getAllOrders(order => order.resourceType == RESOURCE_GHODIUM &&
	order.type == ORDER_SELL &&
    Game.market.calcTransactionCost(1000, targetRoom, order.roomName) < 500); // slow
```

```javascript
// Output:

[{
	id : "55c34a6b5be41a0a6e80c68b",
	created : 13131117,
	type : "sell",
	resourceType : "OH",
	roomName : "W1N1",
	amount : 15821,
	remainingAmount : 30000,
	price : 2.95
}, {
    createdTimestamp: 1543253147522,
    type: "sell",
    amount: 1000,
    remainingAmount: 1000,
    resourceType: "O",
    price: 1,
    roomName: "E2S7",
    created: 12010056,
    id: "5bfc2c9bd719fb605037c06d"
}, {
	id : "55c34a6b5be41a0a6e80c123",
	createdTimestamp: 1543253155580,
	type : "sell",
	resourceType : "token",
	amount : 3,
	remainingAmount : 10,
	price : 50000
}]
```

Get other players' orders currently active on the market. This method supports internal indexing by `resourceType`.

{% api_method_params %}
filter (optional) : object, function
An object or function that will filter the resulting list using the lodash.filter method.
{% endapi_method_params %}

### Return value

An orders array in the following form:

property | description
| --- | --- |
`id` | The unique order ID.
`created` | The order creation time in game ticks. This property is absent for orders of the inter-shard market.
`createdTimestamp` | The order creation time in milliseconds since UNIX epoch time. This property is absent for old orders.
`type` | Either ORDER_SELL or ORDER_BUY.
`resourceType` | Either one of the RESOURCE_* constants or one of account-bound resources (See INTERSHARD_RESOURCES constant).
`roomName` | The room where this order is placed.
`amount` | Currently available amount to trade.
`remainingAmount` | How many resources are left to trade via this order. 
`price` | The current price per unit.
