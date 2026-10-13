{% api_method Game.market.calcTransactionCost 'amount, roomName1, roomName2' 0 %}

```javascript
const cost = Game.market.calcTransactionCost(1000, 'W0N0', 'W10N5');
// -> 284 energy units
```

Estimate the energy transaction cost of StructureTerminal.send and Game.market.deal methods.
The formula:

```javascript-content
Math.ceil( amount * ( 1 - Math.exp(-distanceBetweenRooms/30) ) )
```

{% api_method_params %}
amount : number
Amount of resources to be sent.
===
roomName1 : string
The name of the first room.
===
roomName2 : string
The name of the second room.
{% endapi_method_params %}

### Return value

The amount of energy required to perform the transaction.
