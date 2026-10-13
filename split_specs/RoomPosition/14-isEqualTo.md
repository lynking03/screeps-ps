{% api_method isEqualTo 'x,y|target' 1 %}

```javascript
if(creep.pos.isEqualTo(10,25)) {
    creep.move(RIGHT);
}
```

```javascript
if(creep.pos.isEqualTo(Game.flags.Flag1)) {
    creep.move(RIGHT);
}
```

Check whether this position is the same as the specified position.

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
