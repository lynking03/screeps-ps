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
