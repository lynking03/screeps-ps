# Game.market: part 3 of 5
Module: `Screeps.Internal.Game.Market.Part3`
Files: `src/Screeps/Internal/Game/Market/Part3.purs` and `src/Screeps/Internal/Game/Market/Part3.js`
Bind ONLY these members: Game.market.changeOrderPrice, Game.market.createOrder, Game.market.deal
Other parts bind the rest of Game.market. Do not bind anything not listed above.

## About Game.market

A global object representing the in-game market. You can use this object to track resource transactions to/from your terminals, and your buy/sell orders.

Learn more about the market system from [this article](/market.html).

## Members

{% api_method Game.market.changeOrderPrice 'orderId, newPrice' A %}

```javascript
Game.market.changeOrderPrice('57bec1bf77f4d17c4c011960', 9.95);
```

Change the price of an existing order. If newPrice is greater than old price, you will be charged (newPrice-oldPrice)\*remainingAmount\*0.05 credits.

{% api_method_params %}
orderId : string
The order ID as provided in Game.market.orders.
===
newPrice : number
The new order price.
{% endapi_method_params %}

### Return value

One of the following codes:
{% api_return_codes %}
OK | The operation has been scheduled successfully.
ERR_NOT_OWNER | You are not the owner of the room's terminal or there is no terminal.
ERR_NOT_ENOUGH_RESOURCES | You don't have enough credits to pay a fee.
ERR_INVALID_ARGS | The arguments provided are invalid.
{% endapi_return_codes %}

{% api_method Game.market.createOrder 'params' A %}

```javascript
Game.market.createOrder({
    type: ORDER_SELL,
    resourceType: RESOURCE_GHODIUM,
    price: 9.95,
    totalAmount: 10000,
    roomName: "W1N1"   
});
```

Create a market order in your terminal. You will be charged price\*amount\*0.05 credits when the order is placed. The maximum orders count is 300 per player. You can create an order at any time with any amount, it will be automatically activated and deactivated depending on the resource/credits availability.

{% api_method_params %}
params : object
An object with the following params:

- type : string — The order type, either ORDER_SELL or ORDER\_BUY.

- resourceType : string — Either one of the RESOURCE_* constants or one of account-bound resources (See INTERSHARD_RESOURCES constant). If your Terminal doesn't have the specified resource, the order will be temporary inactive.

- price : number — The price for one resource unit in credits. Can be a decimal number.

- totalAmount : number — The amount of resources to be traded in total.

- roomName (optional) : string — The room where your order will be created. You must have your own Terminal structure in this room, otherwise the created order will be temporary inactive. This argument is not used when resourceType is one of account-bound resources (See INTERSHARD_RESOURCES constant).

{% endapi_method_params %}

### Return value

One of the following codes:
{% api_return_codes %}
OK | The operation has been scheduled successfully.
ERR_NOT_OWNER | You are not the owner of the room's terminal or there is no terminal.
ERR_NOT_ENOUGH_RESOURCES | You don't have enough credits to pay a fee.
ERR_FULL | You cannot create more than 50 orders.
ERR_INVALID_ARGS | The arguments provided are invalid.
{% endapi_return_codes %}

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
