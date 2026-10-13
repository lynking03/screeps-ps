# RoomPosition: part 3 of 6
Module: `Screeps.Internal.RoomPosition.Part3`
Files: `src/Screeps/Internal/RoomPosition/Part3.purs` and `src/Screeps/Internal/RoomPosition/Part3.js`
Bind ONLY these members: findClosestByPath, findClosestByRange, findInRange
Other parts bind the rest of RoomPosition. Do not bind anything not listed above.

## About RoomPosition

An object representing the specified position in the room. Every `RoomObject` in the room
contains `RoomPosition` as the `pos` property. The position object of a custom location
can be obtained using the [`Room.getPositionAt`](#Room.getPositionAt) method or using the constructor.

## Members

{% api_method findClosestByPath 'type, [opts]|objects, [opts]' 3 %}

```javascript
const target = creep.pos.findClosestByPath(FIND_MY_SPAWNS);
creep.moveTo(target);
```

```javascript
const target = creep.pos.findClosestByPath(FIND_MY_SPAWNS, {maxOps: 500});
creep.moveTo(target);
```

```javascript
const target = creep.pos.findClosestByPath(FIND_HOSTILE_CREEPS, {
    filter: function(object) {
        return object.getActiveBodyparts(ATTACK) == 0;
    }
});
```

```javascript
const target = creep.pos.findClosestByPath(FIND_HOSTILE_CREEPS, {
    filter: { owner: { username: 'Invader' } }
});
```

```javascript
const targets = [
    Game.creeps.John,
    Game.creeps.Mike,
    room.getPositionAt(10,10)
];
const closest = creep.pos.findClosestByPath(targets);
```

Find an object with the shortest path from the given position. Uses Jump Point Search algorithm and Dijkstra's algorithm.

{% api_method_params %}
type : number
See Room.find.
===
objects : array
An array of room's objects or RoomPosition objects that the search should be executed against.
===
opts (optional) : object
An object containing pathfinding options (see Room.findPath), or one of the following:

- filter : object, function, string — Only the objects which pass the filter using the Lodash.filter method will be used.

- algorithm : string — One of the following constants:

astar is faster when there are relatively few possible targets;

dijkstra is faster when there are a lot of possible targets or when the closest target is nearby.

The default value is determined automatically using heuristics.

{% endapi_method_params %}

### Return value

The closest object if found, null otherwise.

{% api_method findClosestByRange 'type, [opts]|objects, [opts]' 2 %}

```javascript
const target = creep.pos.findClosestByRange(FIND_MY_SPAWNS);
creep.moveTo(target);
```

```javascript
const target = creep.pos.findClosestByRange(FIND_HOSTILE_CREEPS, {
    filter: function(object) {
        return object.getActiveBodyparts(ATTACK) == 0;
    }
});
```

```javascript
const target = creep.pos.findClosestByRange(FIND_HOSTILE_CREEPS, {
    filter: { owner: { username: 'Invader' } }
});
```

```javascript
const targets = [
    Game.creeps.John,
    Game.creeps.Mike,
    room.getPositionAt(10,10)
];
const closest = creep.pos.findClosestByRange(targets);
```

Find an object with the shortest linear distance from the given position.

{% api_method_params %}
type : number
See Room.find.
===
objects : array
An array of room's objects or RoomPosition objects that the search should be executed against.
===
opts (optional) : object
An object containing one of the following options:

- filter : object, function, string — Only the objects which pass the filter using the Lodash.filter method will be used.

{% endapi_method_params %}

### Return value

The closest object if found, null otherwise.

{% api_method findInRange 'type, range, [opts]|objects, range, [opts]' 2 %}

```javascript
const targets = creep.pos.findInRange(FIND_HOSTILE_CREEPS, 3);
if(targets.length > 0) {
    creep.rangedAttack(targets[0]);
}
```

```javascript
const targets = [
    Game.creeps.John,
    Game.creeps.Mike,
    room.getPositionAt(10,10)
];
const inRangeTargets = creep.pos.findInRange(targets, 3);
```

Find all objects in the specified linear range.

{% api_method_params %}
type : number
See Room.find.
===
objects : array
An array of room's objects or RoomPosition objects that the search should be executed against.
===
range : number
The range distance.
===
opts (optional) : object
See Room.find.
{% endapi_method_params %}

### Return value

An array with the objects found.
