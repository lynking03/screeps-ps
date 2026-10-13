# Room: part 5 of 8
Module: `Screeps.Internal.Room.Part5`
Files: `src/Screeps/Internal/Room/Part5.purs` and `src/Screeps/Internal/Room/Part5.js`
Bind ONLY these members: find, findExitTo, findPath
Other parts bind the rest of Room. Do not bind anything not listed above.

## About Room

An object representing the room in which your units and structures are in.
It can be used to look around, find paths, etc. Every `RoomObject` in the room contains
its linked `Room` instance in the `room` property.

## Members

{% api_method find 'type, [opts]' 2 %}

```javascript
const targets = creep.room.find(FIND_DROPPED_RESOURCES);
if(targets.length) {
    creep.moveTo(targets[0]);
    creep.pickup(targets[0]);
}
```

```javascript
const extensions = Game.spawns['Spawn1'].room.find(FIND_MY_STRUCTURES, {
    filter: { structureType: STRUCTURE_EXTENSION }
});
console.log('Spawn has '+extensions.length+' extensions available');
```

```javascript
const targets = creep.room.find(FIND_HOSTILE_CREEPS, {
    filter: function(object) {
        return object.getActiveBodyparts(ATTACK) == 0;
    }
});
```

Find all objects of the specified type in the room. Results are cached automatically for the specified room and type before applying any custom filters. This automatic cache lasts until the end of the tick.

{% api_method_params %}
type : number
One of the FIND_* constants.
===
opts (optional) : object
An object with additional options:

- filter : object, function, string — The result list will be filtered using the Lodash.filter method.

{% endapi_method_params %}

### Return value

An array with the objects found.

constant|type|description
| --- | --- | --- |
`FIND_EXIT_TOP` | RoomPosition | Only exit positions located at the top of the room.
`FIND_EXIT_RIGHT` | RoomPosition | Only exit positions located on the right side of the room.
`FIND_EXIT_BOTTOM` | RoomPosition | Only exit positions located at the bottom of the room.
`FIND_EXIT_LEFT` | RoomPosition | Only exit positions located on the left side of the room.
`FIND_EXIT` | RoomPosition | All exit positions.
`FIND_CREEPS` | Creep | All creeps.
`FIND_MY_CREEPS` | Creep | Only creeps owned by you.
`FIND_HOSTILE_CREEPS` | Creep | Only creeps not owned by you.
`FIND_POWER_CREEPS` | PowerCreep | All power creeps.
`FIND_MY_POWER_CREEPS` | PowerCreep | Only power creeps owned by you.
`FIND_HOSTILE_POWER_CREEPS` | PowerCreep | Only power creeps not owned by you.
`FIND_SOURCES_ACTIVE` | Source | Only sources that have energy.
`FIND_SOURCES` | Source | All sources.
`FIND_DROPPED_RESOURCES` | Resource | All dropped resources.
`FIND_STRUCTURES` | Structure | All structures.
`FIND_MY_STRUCTURES` | Structure | Only structures owned by you. Does not include neutral structures.
`FIND_HOSTILE_STRUCTURES` | Structure | Only structures not owned by you. Does not include neutral structures.
`FIND_FLAGS` | Flag | All flags
`FIND_MY_SPAWNS` | StructureSpawn | Only spawns owned by you.
`FIND_HOSTILE_SPAWNS` | StructureSpawn | Spawns not owned by you.
`FIND_CONSTRUCTION_SITES` | ConstructionSite | All construction sites.
`FIND_MY_CONSTRUCTION_SITES` | ConstructionSite | Only construction sites owned by you.
`FIND_HOSTILE_CONSTRUCTION_SITES` | ConstructionSite | Only construction sites not owned by you.
`FIND_MINERALS` | Mineral | All mineral deposits.
`FIND_NUKES` | Nuke | All launched nukes.
`FIND_TOMBSTONES` | Tombstone | All tombstones.
`FIND_RUINS` | Ruin | All ruins

{% api_method findExitTo 'room' 3 %}

```javascript
const exitDir = creep.room.findExitTo(anotherCreep.room);
const exit = creep.pos.findClosestByRange(exitDir);
creep.moveTo(exit);

// or simply:
creep.moveTo(anotherCreep);
creep.moveTo(new RoomPosition(25,25, anotherCreep.pos.roomName));
```

Find the exit direction en route to another room. Please note that this method is not required for inter-room movement, you can simply pass the target in another room into Creep.moveTo method.

{% api_method_params %}
room : string, Room
Another room name or room object.
{% endapi_method_params %}

### Return value

The room direction constant, one of the following:

* `FIND_EXIT_TOP`
* `FIND_EXIT_RIGHT`
* `FIND_EXIT_BOTTOM`
* `FIND_EXIT_LEFT`

Or one of the following error codes:
{% api_return_codes %}
ERR_NO_PATH | Path can not be found.
ERR_INVALID_ARGS | The location is incorrect.
{% endapi_return_codes %}

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
