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
