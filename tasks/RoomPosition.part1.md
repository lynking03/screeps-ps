# RoomPosition: part 1 of 6
Module: `Screeps.Internal.RoomPosition.Part1`
Files: `src/Screeps/Internal/RoomPosition/Part1.purs` and `src/Screeps/Internal/RoomPosition/Part1.js`
Bind ONLY these members: constructor, roomName, x
Other parts bind the rest of RoomPosition. Do not bind anything not listed above.

## About RoomPosition

An object representing the specified position in the room. Every `RoomObject` in the room
contains `RoomPosition` as the `pos` property. The position object of a custom location
can be obtained using the [`Room.getPositionAt`](#Room.getPositionAt) method or using the constructor.

## Members

{% api_method constructor 'x, y, roomName' 0 %}

```javascript
const pos = new RoomPosition(10, 25, 'sim');

```

You can create new RoomPosition object using its constructor.

{% api_method_params %}
x : number
X position in the room.
===
y : number
Y position in the room.
===
roomName : string
The room name.
{% endapi_method_params %}

{% api_property roomName 'string' %}

The name of the room.

{% api_property x 'number' %}

X position in the room.
