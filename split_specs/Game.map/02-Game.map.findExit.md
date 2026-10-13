{% api_method Game.map.findExit 'fromRoom, toRoom, [opts]' 3 %}

```javascript
if(creep.room != anotherRoomName) {
    const exitDir = Game.map.findExit(creep.room, anotherRoomName);
    const exit = creep.pos.findClosestByRange(exitDir);
    creep.moveTo(exit);
}
else {
    // go to some place in another room
}
```

```javascript
creep.moveTo(new RoomPosition(25, 25, anotherRoomName));
```

Find the exit direction from the given room en route to another room.

{% api_method_params %}
fromRoom : string, Room
Start room name or room object.
===
toRoom : string, Room
Finish room name or room object.
===
opts (optional) : object
An object with the pathfinding options. See findRoute.
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
