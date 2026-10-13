# Room: part 2 of 8
Module: `Screeps.Internal.Room.Part2`
Files: `src/Screeps/Internal/Room/Part2.purs` and `src/Screeps/Internal/Room/Part2.js`
Bind ONLY these members: memory, name, storage
Other parts bind the rest of Room. Do not bind anything not listed above.

## About Room

An object representing the room in which your units and structures are in.
It can be used to look around, find paths, etc. Every `RoomObject` in the room contains
its linked `Room` instance in the `room` property.

## Members

{% api_property memory 'any' %}

```javascript
room.memory.stage = 2;
```

A shorthand to Memory.rooms[room.name]. You can use it for quick access the room’s specific memory data object. Learn more about memory

{% api_property name 'string' %}

The name of the room.

{% api_property storage 'StructureStorage' %}

The Storage structure of this room, if present, otherwise undefined.
