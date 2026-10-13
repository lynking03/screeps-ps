# StructureRampart: part 1 of 1
Module: `Screeps.Internal.StructureRampart.Part1`
Files: `src/Screeps/Internal/StructureRampart/Part1.purs` and `src/Screeps/Internal/StructureRampart/Part1.js`
Bind ONLY these members: isPublic, ticksToDecay, setPublic

## About StructureRampart

Blocks movement of hostile creeps, and defends your creeps and structures on the same tile.
Can be used as a controllable gate.

Inherits from OwnedStructure: those members are bound elsewhere.

## Members

{% api_property isPublic 'boolean' %}

If false (default), only your creeps can step on the same square. If true, any hostile creeps can pass through.

{% api_property ticksToDecay 'number' %}

The amount of game ticks when this rampart will lose some hit points.

{% api_method setPublic 'isPublic' A %}

Make this rampart public to allow other players' creeps to pass through.

{% api_method_params %}
isPublic : boolean
Whether this rampart should be public or non-public.
{% endapi_method_params %}

### Return value

One of the following codes:
{% api_return_codes %}
OK | The operation has been scheduled successfully.
ERR_NOT_OWNER | You are not the owner of this structure.
{% endapi_return_codes %}
