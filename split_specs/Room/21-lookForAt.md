{% api_method lookForAt 'type, x, y|type, target' 1 %}

```javascript
const found = creep.room.lookForAt(LOOK_CREEPS, target);
if(found.length && found[0].getActiveBodyparts(ATTACK) == 0) {
    creep.moveTo(found[0]);
}
```

Get an object with the given type at the specified room position.

{% api_method_params %}
type : string
One of the LOOK_* constants.
===
x : number
X position in the room.
===
y : number
Y position in the room.
===
target : object
Can be a RoomPosition object or any object containing RoomPosition.
{% endapi_method_params %}

### Return value

An array of objects of the given type at the specified position if found.
