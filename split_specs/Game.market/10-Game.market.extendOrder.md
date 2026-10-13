{% api_method Game.market.extendOrder 'orderId, addAmount' A %}

```javascript
Game.market.extendOrder('57bec1bf77f4d17c4c011960', 10000);
```

Add more capacity to an existing order. It will affect remainingAmount and totalAmount properties. You will be charged price\*addAmount\*0.05 credits.

{% api_method_params %}
orderId : string
The order ID as provided in Game.market.orders.
===
addAmount : number
How much capacity to add. Cannot be a negative value.
{% endapi_method_params %}

### Return value

One of the following codes:
{% api_return_codes %}
OK | The operation has been scheduled successfully.
ERR_NOT_ENOUGH_RESOURCES | You don't have enough credits to pay a fee.
ERR_INVALID_ARGS | The arguments provided are invalid.
{% endapi_return_codes %}
