# Game.market: part 5 of 5
Module: `Screeps.Internal.Game.Market.Part5`
Files: `src/Screeps/Internal/Game/Market/Part5.purs` and `src/Screeps/Internal/Game/Market/Part5.js`
Bind ONLY these members: Game.market.getOrderById
Other parts bind the rest of Game.market. Do not bind anything not listed above.

## About Game.market

A global object representing the in-game market. You can use this object to track resource transactions to/from your terminals, and your buy/sell orders.

Learn more about the market system from [this article](/market.html).

## Members

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
