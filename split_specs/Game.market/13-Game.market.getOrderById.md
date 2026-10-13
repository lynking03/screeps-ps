{% api_method Game.market.getOrderById 'id' 1 %}

```javascript
const order = Game.market.getOrderById('55c34a6b5be41a0a6e80c123');
```

Retrieve info for specific market order.

{% api_method_params %}
id : string
The order ID.
{% endapi_method_params %}

### Return value

An object with the order info. See
getAllOrders
for properties explanation.
