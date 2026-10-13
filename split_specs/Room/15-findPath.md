{% api_method findPath 'fromPos, toPos, [opts]' 3 %}

```javascript
const path = creep.room.findPath(creep.pos, targetPos);
creep.move(path[0].direction);
```

```javascript
PathFinder.use(true);
const path = creep.room.findPath(creep.pos, targetPos, {
    costCallback: function(roomName, costMatrix) {
	    if(roomName == 'W1N5') {
		    // set anotherCreep's location as walkable
			costMatrix.set(anotherCreep.pos.x, anotherCreep.pos.y, 0);
			// set flag location as an obstacle
			costMatrix.set(flag.pos.x, flag.pos.y, 255);
			// increase cost for (25,20) location to 50
			costMatrix.set(25, 20, 50);
		}
	}
});

```

```javascript
let path = creep.room.findPath(creep.pos, targetPos, {maxOps: 200});
if( !path.length || !targetPos.isEqualTo(path[path.length - 1]) ) {
    path = creep.room.findPath(creep.pos, targetPos, {
		maxOps: 1000, ignoreDestructibleStructures: true
	});
}
if( path.length ) {
    creep.move(path[0].direction);
}
```

Find an optimal path inside the room between fromPos and toPos using Jump Point Search algorithm.

{% api_method_params %}
fromPos : RoomPosition
The start position.
===
toPos : RoomPosition
The end position.
===
opts (optional) : object
An object containing additonal pathfinding flags:

- ignoreCreeps : boolean — Treat squares with creeps as walkable. Can be useful with too many moving creeps around or in some other cases. The default value is false.

- ignoreDestructibleStructures : boolean — Treat squares with destructible structures (constructed walls, ramparts, spawns, extensions) as walkable. The default value is false.

- ignoreRoads : boolean — Ignore road structures. Enabling this option can speed up the search. The default value is false. This is only used when the new PathFinder is enabled.

- costCallback : function(string, CostMatrix) — You can use this callback to modify a CostMatrix for any room during the search. The callback accepts two arguments, roomName and costMatrix. Use the costMatrix instance to make changes to the positions costs. If you return a new matrix from this callback, it will be used instead of the built-in cached one. This option is only used when the new PathFinder is enabled.

- ignore : array — An array of the room's objects or RoomPosition objects which should be treated as walkable tiles during the search. This option cannot be used when the new PathFinder is enabled (use costCallback option instead).

- avoid : array — An array of the room's objects or RoomPosition objects which should be treated as obstacles during the search. This option cannot be used when the new PathFinder is enabled (use costCallback option instead).

- maxOps : number — The maximum limit of possible pathfinding operations. You can limit CPU time used for the search based on ratio 1 op ~ 0.001 CPU. The default value is 2000.

- heuristicWeight : number — Weight to apply to the heuristic in the A* formula F = G + weight * H. Use this option only if you understand the underlying A* algorithm mechanics! The default value is 1.2.

- serialize : boolean — If true, the result path will be serialized using Room.serializePath. The default is false.

- maxRooms : number — The maximum allowed rooms to search. The default (and maximum) is 16. This is only used when the new PathFinder is enabled.

- range : number — Find a path to a position in specified linear range of target. The default is 0.

- plainCost : number — Cost for walking on plain positions. The default is 1.

- swampCost : number — Cost for walking on swamp positions. The default is 5.

{% endapi_method_params %}

### Return value

An array with path steps in the following format:

```javascript-content
[
    { x: 10, y: 5, dx: 1,  dy: 0, direction: RIGHT },
    { x: 10, y: 6, dx: 0,  dy: 1, direction: BOTTOM },
    { x: 9,  y: 7, dx: -1, dy: 1, direction: BOTTOM_LEFT },
    ...
]
```
