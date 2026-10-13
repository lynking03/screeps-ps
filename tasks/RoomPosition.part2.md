# RoomPosition: part 2 of 6
Module: `Screeps.Internal.RoomPosition.Part2`
Files: `src/Screeps/Internal/RoomPosition/Part2.purs` and `src/Screeps/Internal/RoomPosition/Part2.js`
Bind ONLY these members: y, createConstructionSite, createFlag
Other parts bind the rest of RoomPosition. Do not bind anything not listed above.

## About RoomPosition

An object representing the specified position in the room. Every `RoomObject` in the room
contains `RoomPosition` as the `pos` property. The position object of a custom location
can be obtained using the [`Room.getPositionAt`](#Room.getPositionAt) method or using the constructor.

## Members

{% api_property y 'number' %}

Y position in the room.

{% api_method createConstructionSite 'structureType, [name]' A %}

```javascript
Game.flags['Flag1'].pos.createConstructionSite(STRUCTURE_ROAD);
```
```javascript
Game.flags['Flag1'].pos.createConstructionSite(STRUCTURE_SPAWN, 'MySpawn2');
```

Create new ConstructionSite at the specified location.

{% api_method_params %}
structureType : string
One of the STRUCTURE_* constants.
===
name (optional) : string
The name of the structure, for structures that support it (currently only spawns).
{% endapi_method_params %}

### Return value

One of the following codes:
{% api_return_codes %}
OK | The operation has been scheduled successfully.
ERR_INVALID_TARGET | The structure cannot be placed at the specified location.
ERR_FULL | You have too many construction sites. The maximum number of construction sites per player is 100.
ERR_INVALID_ARGS | The location is incorrect.
ERR_RCL_NOT_ENOUGH | Room Controller Level insufficient. Learn more
{% endapi_return_codes %}

{% api_method createFlag '[name], [color], [secondaryColor]' A %}

```javascript
creep.pos.createFlag('Flag1');
```

Create new Flag at the specified location.

{% api_method_params %}
name (optional) : string
The name of a new flag. It should be unique, i.e. the Game.flags object should not contain another flag with the same name (hash key). If not defined, a random name will be generated.
===
color (optional) : string
The color of a new flag. Should be one of the COLOR_* constants. The default value is COLOR_WHITE.
===
secondaryColor (optional) : string
The secondary color of a new flag. Should be one of the COLOR_* constants. The default value is equal to color.
{% endapi_method_params %}

### Return value

The name of a new flag, or one of the following error codes:

{% api_return_codes no_spacer %}
ERR_NAME_EXISTS | There is a flag with the same name already.
ERR_INVALID_ARGS | The location or the color constant is incorrect.
{% endapi_return_codes %}
