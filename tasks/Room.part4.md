# Room: part 4 of 8
Module: `Screeps.Internal.Room.Part4`
Files: `src/Screeps/Internal/Room/Part4.purs` and `src/Screeps/Internal/Room/Part4.js`
Bind ONLY these members: Room.deserializePath, createConstructionSite, createFlag
Other parts bind the rest of Room. Do not bind anything not listed above.

## About Room

An object representing the room in which your units and structures are in.
It can be used to look around, find paths, etc. Every `RoomObject` in the room contains
its linked `Room` instance in the `room` property.

## Members

{% api_method Room.deserializePath 'path' 1 %}

```javascript
const path = Room.deserializePath(Memory.path);
creep.moveByPath(path);
```

Deserialize a short string path representation into an array form.

{% api_method_params %}
path : string
A serialized path string.
{% endapi_method_params %}

### Return value

A path array.

{% api_method createConstructionSite 'x, y, structureType, [name]|pos, structureType, [name]' A %}

```javascript
Game.rooms.sim.createConstructionSite(10, 15, STRUCTURE_ROAD);
```

```javascript
Game.rooms.sim.createConstructionSite(10, 15, STRUCTURE_SPAWN, 
    'MySpawn2');
```

Create new ConstructionSite at the specified location.

{% api_method_params %}
x : number
The X position.
===
y : number
The Y position.
===
pos : object
Can be a RoomPosition object or any object containing RoomPosition.
===
structureType : string
One of the STRUCTURE_* constants.
===
name (optional) : string
The name of the structure, for structures that support it (currently only spawns). The name length limit is 100 characters.
{% endapi_method_params %}

### Return value

One of the following codes:
{% api_return_codes %}
OK | The operation has been scheduled successfully.
ERR_INVALID_TARGET | The structure cannot be placed at the specified location.
ERR_FULL | You have too many construction sites. The maximum number of construction sites per player is 100.
ERR_INVALID_ARGS | The location is incorrect.
ERR_NOT_OWNER | The room is claimed or reserved by a hostile player.
ERR_RCL_NOT_ENOUGH | Room Controller Level insufficient. Learn more
{% endapi_return_codes %}

{% api_method createFlag 'x, y, [name], [color], [secondaryColor]|pos, [name], [color], [secondaryColor]' A %}

```javascript
Game.rooms.sim.createFlag(5, 12, 'Flag1');
```

Create new Flag at the specified location.

{% api_method_params %}
x : number
The X position.
===
y : number
The Y position.
===
pos : object
Can be a RoomPosition object or any object containing RoomPosition.
===
name (optional) : string
The name of a new flag. It should be unique, i.e. the Game.flags object should not contain another flag with the same name (hash key). If not defined, a random name will be generated. The maximum length is 100 characters.
===
color (optional) : number
The color of a new flag. Should be one of the COLOR_* constants. The default value is COLOR_WHITE.
===
secondaryColor (optional) : string
The secondary color of a new flag. Should be one of the COLOR_* constants. The default value is equal to color.
{% endapi_method_params %}

### Return value

The name of a new flag, or one of the following error codes:
{% api_return_codes %}
ERR_NAME_EXISTS | There is a flag with the same name already.
ERR_INVALID_ARGS | The location or the name or the color constant is incorrect.
ERR_FULL | You have too many flags. The maximum number of flags per player is 10000.
{% endapi_return_codes %}
