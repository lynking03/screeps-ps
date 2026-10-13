# StructureTower: part 2 of 2
Module: `Screeps.Internal.StructureTower.Part2`
Files: `src/Screeps/Internal/StructureTower/Part2.purs` and `src/Screeps/Internal/StructureTower/Part2.js`
Bind ONLY these members: repair
Other parts bind the rest of StructureTower. Do not bind anything not listed above.

## About StructureTower

Remotely attacks or heals creeps, or repairs structures. Can be targeted to any object in
the room. However, its effectiveness linearly depends on the distance. Each action consumes energy.

Inherits from OwnedStructure: those members are bound elsewhere.

## Members

{% api_method repair 'target' A %}

Remotely repair any structure in the room.

{% api_method_params %}
target : Structure
The target structure.
{% endapi_method_params %}

### Return value

One of the following codes:
{% api_return_codes %}
OK | The operation has been scheduled successfully.
ERR_NOT_OWNER | You are not the owner of this structure.
ERR_NOT_ENOUGH_ENERGY | The tower does not have enough energy.
ERR_INVALID_TARGET | The target is not a valid repairable object.
ERR_RCL_NOT_ENOUGH | Room Controller Level insufficient to use this structure.
{% endapi_return_codes %}
