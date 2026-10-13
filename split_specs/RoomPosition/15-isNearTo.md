{% api_method isNearTo 'x,y|target' 1 %}

```javascript
if(creep.pos.isNearTo(target)) {
    creep.transfer(target, RESOURCE_ENERGY);
}
```

Check whether this position is on the adjacent square to the specified position. The same as inRangeTo(target, 1).

{% api_method_params %}
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

A boolean value.
