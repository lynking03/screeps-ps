{% api_method inRangeTo 'x, y, range|target, range' 1 %}

```javascript
if(creep.pos.inRangeTo(target, 3)) {
    creep.rangedAttack(target);
}
```

Check whether this position is in the given range of another position.

{% api_method_params %}
x : number
X position in the same room.
===
y : number
Y position in the same room.
===
target : RoomPosition
The target position.
===
range : number
The range distance.
{% endapi_method_params %}

### Return value

A boolean value.
