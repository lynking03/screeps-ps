{% api_method set 'x, y, cost' 0 %}

```javascript
let costs = new PathFinder.CostMatrix;
let pos = Game.spawns['Spawn1'].pos;
costs.set(pos.x, pos.y, 255); // Can't walk over a building
```

Set the cost of a position in this CostMatrix.

{% api_method_params %}
x : number
X position in the room.
===
y : number
Y position in the room.
===
cost : number
Cost of this position. Must be a whole number. A cost of 0 will use the terrain cost for that tile. A cost greater than or equal to 255 will be treated as unwalkable.
{% endapi_method_params %}
