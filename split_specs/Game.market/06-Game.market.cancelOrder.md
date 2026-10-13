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
