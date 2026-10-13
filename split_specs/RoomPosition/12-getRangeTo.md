{% api_method getRangeTo 'x,y|target' 1 %}

```javascript
const range = creep.pos.getRangeTo(target);
if(range <= 3) {
    creep.rangedAttack(target);
}
```

Get linear range to the specified position.

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

A number of squares to the given position.
