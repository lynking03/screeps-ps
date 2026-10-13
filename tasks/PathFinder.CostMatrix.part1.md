# PathFinder.CostMatrix: part 1 of 2
Module: `Screeps.Internal.PathFinder.CostMatrix.Part1`
Files: `src/Screeps/Internal/PathFinder/CostMatrix/Part1.purs` and `src/Screeps/Internal/PathFinder/CostMatrix/Part1.js`
Bind ONLY these members: constructor, set, get
Other parts bind the rest of PathFinder.CostMatrix. Do not bind anything not listed above.

## About PathFinder.CostMatrix

Container for custom navigation cost data. By default `PathFinder` will only consider
terrain data (plain, swamp, wall) — if you need to route around obstacles such as buildings
or creeps you must put them into a `CostMatrix`. Generally you will create your `CostMatrix`
from within `roomCallback`. If a non-0 value is found in a room's CostMatrix then that value
will be used instead of the default terrain cost. You should avoid using large values in your
CostMatrix and terrain cost flags. For example, running `PathFinder.search` with
`{ plainCost: 1, swampCost: 5 }` is faster than running it with `{plainCost: 2, swampCost: 10 }`
even though your paths will be the same.

## Members

{% api_method constructor %}

```javascript
let costs = new PathFinder.CostMatrix;
```

Creates a new CostMatrix containing 0's for all positions.

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

{% api_method get 'x, y' 0 %}

Get the cost of a position in this CostMatrix.

{% api_method_params %}
x : number
X position in the room.
===
y : number
Y position in the room.
{% endapi_method_params %}
