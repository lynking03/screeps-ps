# RoomPosition: part 5 of 6
Module: `Screeps.Internal.RoomPosition.Part5`
Files: `src/Screeps/Internal/RoomPosition/Part5.purs` and `src/Screeps/Internal/RoomPosition/Part5.js`
Bind ONLY these members: inRangeTo, isEqualTo, isNearTo
Other parts bind the rest of RoomPosition. Do not bind anything not listed above.

## About RoomPosition

An object representing the specified position in the room. Every `RoomObject` in the room
contains `RoomPosition` as the `pos` property. The position object of a custom location
can be obtained using the [`Room.getPositionAt`](#Room.getPositionAt) method or using the constructor.

## Members

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
