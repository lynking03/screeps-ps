{% api_method moveByPath 'path' A %}

```javascript
const path = spawn.room.findPath(spawn, source);
creep.moveByPath(path);
```

```javascript
if(!creep.memory.path) {
    creep.memory.path = creep.pos.findPathTo(target);
}
creep.moveByPath(creep.memory.path);
```

Move the creep using the specified predefined path.

{% api_method_params %}
path : array|string
A path value as returned from Room.findPath, RoomPosition.findPathTo, or PathFinder.search methods. Both array form and serialized string form are accepted.
{% endapi_method_params %}

### Return value

One of the following codes:
{% api_return_codes %}
OK | The operation has been scheduled successfully.
ERR_NOT_OWNER | You are not the owner of this creep.
ERR_BUSY | The power creep is not spawned in the world.
ERR_NOT_FOUND | The specified path doesn't match the creep's location.
ERR_INVALID_ARGS | path is not a valid path array.
ERR_TIRED | The fatigue indicator of the creep is non-zero.
{% endapi_return_codes %}
