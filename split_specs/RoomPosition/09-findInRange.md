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
