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
