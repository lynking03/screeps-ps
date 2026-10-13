# PathFinder.CostMatrix: part 2 of 2
Module: `Screeps.Internal.PathFinder.CostMatrix.Part2`
Files: `src/Screeps/Internal/PathFinder/CostMatrix/Part2.purs` and `src/Screeps/Internal/PathFinder/CostMatrix/Part2.js`
Bind ONLY these members: clone, serialize, PathFinder.CostMatrix.deserialize
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

{% api_method clone '' 1 %}

Copy this CostMatrix into a new CostMatrix with the same data.

### Return value

A new CostMatrix instance.

{% api_method serialize '' 1 %}

```javascript
let costs = new PathFinder.CostMatrix;
Memory.savedMatrix = costs.serialize();
```

Returns a compact representation of this CostMatrix which can be stored via JSON.stringify.

### Return value

An array of numbers. There's not much you can do with the numbers besides store them for later.

{% api_method PathFinder.CostMatrix.deserialize 'val' 1 %}

```javascript
let costs = PathFinder.CostMatrix.deserialize(Memory.savedMatrix)
```

Static method which deserializes a new CostMatrix using the return value of serialize.

{% api_method_params %}
val : object
Whatever serialize returned
{% endapi_method_params %}

### Return value

Returns new
CostMatrix
instance.
