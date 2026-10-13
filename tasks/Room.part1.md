# Room: part 1 of 8
Module: `Screeps.Internal.Room.Part1`
Files: `src/Screeps/Internal/Room/Part1.purs` and `src/Screeps/Internal/Room/Part1.js`
Bind ONLY these members: controller, energyAvailable, energyCapacityAvailable
Other parts bind the rest of Room. Do not bind anything not listed above.

## About Room

An object representing the room in which your units and structures are in.
It can be used to look around, find paths, etc. Every `RoomObject` in the room contains
its linked `Room` instance in the `room` property.

## Members

{% api_property controller 'StructureController' %}

The Controller structure of this room, if present, otherwise undefined.

{% api_property energyAvailable 'number' %}

Total amount of energy available in all spawns and extensions in the room.

{% api_property energyCapacityAvailable 'number' %}

Total amount of energyCapacity of all spawns and extensions in the room.
