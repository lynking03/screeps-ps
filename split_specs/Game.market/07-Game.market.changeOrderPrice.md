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
