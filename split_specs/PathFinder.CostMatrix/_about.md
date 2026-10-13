Container for custom navigation cost data. By default `PathFinder` will only consider
terrain data (plain, swamp, wall) — if you need to route around obstacles such as buildings
or creeps you must put them into a `CostMatrix`. Generally you will create your `CostMatrix`
from within `roomCallback`. If a non-0 value is found in a room's CostMatrix then that value
will be used instead of the default terrain cost. You should avoid using large values in your
CostMatrix and terrain cost flags. For example, running `PathFinder.search` with
`{ plainCost: 1, swampCost: 5 }` is faster than running it with `{plainCost: 2, swampCost: 10 }`
even though your paths will be the same.
