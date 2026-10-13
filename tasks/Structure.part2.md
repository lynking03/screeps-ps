# Structure: part 2 of 3
Module: `Screeps.Internal.Structure.Part2`
Files: `src/Screeps/Internal/Structure/Part2.purs` and `src/Screeps/Internal/Structure/Part2.js`
Bind ONLY these members: structureType, destroy, isActive
Other parts bind the rest of Structure. Do not bind anything not listed above.

## About Structure

The base prototype object of all structures.

Inherits from RoomObject: those members are bound elsewhere.

## Members

{% api_property structureType 'string' %}

One of the STRUCTURE_* constants.

{% api_method destroy '' A %}

Destroy this structure immediately.

### Return value

One of the following codes:
{% api_return_codes %}
OK | The operation has been scheduled successfully.
ERR_NOT_OWNER | You are not the owner of this structure, and it's not in your room.
ERR_BUSY | Hostile creeps are in the room.
{% endapi_return_codes %}

{% api_method isActive '' 2 %}

Check whether this structure can be used. If room controller level is insufficient, then this method will return false, and the structure will be highlighted with red in the game.

### Return value

A boolean value.
