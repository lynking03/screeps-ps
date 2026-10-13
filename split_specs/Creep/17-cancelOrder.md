{% api_method cancelOrder 'methodName' 0 %}

```javascript
creep.move(LEFT);
creep.cancelOrder('move');
//The creep will not move in this game tick
```

Cancel the order given during the current game tick.

{% api_method_params %}
methodName : string
The name of a creep's method to be cancelled.
{% endapi_method_params %}

### Return value

One of the following codes:
{% api_return_codes %}
OK | The operation has been cancelled successfully.
ERR_NOT_FOUND | The order with the specified name is not found.
{% endapi_return_codes %}
