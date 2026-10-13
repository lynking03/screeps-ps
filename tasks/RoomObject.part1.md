# RoomObject: part 1 of 1
Module: `Screeps.Internal.RoomObject.Part1`
Files: `src/Screeps/Internal/RoomObject/Part1.purs` and `src/Screeps/Internal/RoomObject/Part1.js`
Bind ONLY these members: effects, pos, room

## About RoomObject

Any object with a position in a room. Almost all game objects prototypes are derived from `RoomObject`.

## Members

{% api_property effects array %}
Applied effects, an array of objects with the following properties:

{% api_method_params %}
effect : number
Effect ID of the applied effect. Can be either natural effect ID or Power ID.
===
level (optional) : number
Power level of the applied effect. Absent if the effect is not a Power effect.
===
ticksRemaining : number
How many ticks will the effect last.
{% endapi_method_params %}

{% api_property pos 'RoomPosition' %}

An object representing the position of this object in the room.

{% api_property room 'Room' %}

The link to the Room object. May be undefined in case if an object is a flag or a construction site and is placed in a room that is not visible to you.
