# RoomPosition: part 4 of 6
Module: `Screeps.Internal.RoomPosition.Part4`
Files: `src/Screeps/Internal/RoomPosition/Part4.purs` and `src/Screeps/Internal/RoomPosition/Part4.js`
Bind ONLY these members: findPathTo, getDirectionTo, getRangeTo
Other parts bind the rest of RoomPosition. Do not bind anything not listed above.

## About RoomPosition

An object representing the specified position in the room. Every `RoomObject` in the room
contains `RoomPosition` as the `pos` property. The position object of a custom location
can be obtained using the [`Room.getPositionAt`](#Room.getPositionAt) method or using the constructor.

## Members

{% api_method findPathTo 'x, y, [opts]|target, [opts]' 3 %}

```javascript
const path = creep.pos.findPathTo(target);
creep.move(path[0].direction);
```

```javascript
let path = creep.pos.findPathTo(target, {maxOps: 200});
if( !path.length || !target.equalsTo(path[path.length - 1]) ) {
    path = creep.pos.findPathTo(target,
        {maxOps: 1000, ignoreDestructibleStructures: true});
}
if( path.length ) {
    creep.move(path[0].direction);
}
```

Find an optimal path to the specified position using Jump Point Search algorithm. This method is a shorthand for Room.findPath. If the target is in another room, then the corresponding exit will be used as a target.

{% api_method_params %}
x : number
X position in the room.
===
y : number
Y position in the room.
===
target : object
Can be a RoomPosition object or any object containing RoomPosition.
===
opts (optional) : object
An object containing pathfinding options flags (see Room.findPath for more details).
{% endapi_method_params %}

### Return value

An array with path steps in the following format:
```javascript-content
[
    { x: 10, y: 5, dx: 1,  dy: 0, direction: RIGHT },
    { x: 10, y: 6, dx: 0,  dy: 1, direction: BOTTOM },
    { x: 9,  y: 7, dx: -1, dy: 1, direction: BOTTOM_LEFT },
    ...
]    
```

{% api_method getDirectionTo 'x,y|target' 1 %}

```javascript
const direction = creep.pos.getDirectionTo(target);
creep.move(direction);
```

Get linear direction to the specified position.

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

A number representing one of the direction constants.

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
