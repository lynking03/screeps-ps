{% api_method Game.market.deal 'orderId, amount, [yourRoomName]' A %}

```javascript
Game.market.deal('57cd2b12cda69a004ae223a3', 1000, "W1N1");
```

```javascript
const amountToBuy = 2000, maxTransferEnergyCost = 500;
const orders = Game.market.getAllOrders({type: ORDER_SELL, resourceType: RESOURCE_GHODIUM});

for(let i=0; i<orders.length; i++) {
    const transferEnergyCost = Game.market.calcTransactionCost(
        amountToBuy, 'W1N1', orders[i].roomName);

    if(transferEnergyCost < maxTransferEnergyCost) {
        Game.market.deal(orders[i].id, amountToBuy, "W1N1");
        break;
    }
}
```

Execute a trade deal from your Terminal in yourRoomName to another player's Terminal using the specified buy/sell order. Your Terminal will be charged energy units of transfer cost regardless of the order resource type. You can use Game.market.calcTransactionCost method to estimate it. When multiple players try to execute the same deal, the one with the shortest distance takes precedence. You cannot execute more than 10 deals during one tick.

{% api_method_params %}
orderId : string
The order ID as provided in Game.market.getAllOrders.
===
amount : number
The amount of resources to transfer.
===
yourRoomName (optional) : string
The name of your room which has to contain an active Terminal with enough amount of energy. This argument is not used when the order resource type is one of account-bound resources (See INTERSHARD_RESOURCES constant).
{% endapi_method_params %}

### Return value

One of the following codes:
{% api_return_codes %}
OK | The operation has been scheduled successfully.
ERR_NOT_OWNER | You don't have a terminal in the target room.
ERR_NOT_ENOUGH_RESOURCES | You don't have enough credits or resource units.
ERR_FULL | You cannot execute more than 10 deals during one tick.
ERR_INVALID_ARGS | The arguments provided are invalid.
ERR_TIRED | The target terminal is still cooling down.
{% endapi_return_codes %}
