# Room: part 3 of 8
Module: `Screeps.Internal.Room.Part3`
Files: `src/Screeps/Internal/Room/Part3.purs` and `src/Screeps/Internal/Room/Part3.js`
Bind ONLY these members: terminal, visual, Room.serializePath
Other parts bind the rest of Room. Do not bind anything not listed above.

## About Room

An object representing the room in which your units and structures are in.
It can be used to look around, find paths, etc. Every `RoomObject` in the room contains
its linked `Room` instance in the `room` property.

## Members

{% api_property terminal 'StructureTerminal' %}

The Terminal structure of this room, if present, otherwise undefined.

{% api_property visual 'RoomVisual' %}

A RoomVisual object for this room. You can use this object to draw simple shapes (lines, circles, text labels) in the room.

{% api_method Room.serializePath 'path' 1 %}

```javascript
const path = spawn.pos.findPathTo(source);
Memory.path = Room.serializePath(path);
creep.moveByPath(Memory.path);
```

Serialize a path array into a short string representation, which is suitable to store in memory.

{% api_method_params %}
path : array
A path array retrieved from Room.findPath.
{% endapi_method_params %}

### Return value

A serialized string form of the given path.
