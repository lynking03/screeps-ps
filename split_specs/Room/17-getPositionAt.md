{% api_method getPositionAt 'x, y' 1 %}

```javascript
const pos = Game.rooms.sim.getPositionAt(5,12);
const source = pos.findClosestByRange(FIND_SOURCES_ACTIVE);
```

Creates a RoomPosition object at the specified location.

{% api_method_params %}
x : number
The X position.
===
y : number
The Y position.
{% endapi_method_params %}

### Return value

A
RoomPosition
object or null if it cannot be obtained.
