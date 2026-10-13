# StructureSpawn.Spawning: part 3 of 3
Module: `Screeps.Internal.StructureSpawn.Spawning.Part3`
Files: `src/Screeps/Internal/StructureSpawn/Spawning/Part3.purs` and `src/Screeps/Internal/StructureSpawn/Spawning/Part3.js`
Bind ONLY these members: setDirections
Other parts bind the rest of StructureSpawn.Spawning. Do not bind anything not listed above.

## About StructureSpawn.Spawning

Details of the creep being spawned currently that can be addressed by the [`StructureSpawn.spawning`](#StructureSpawn.spawning) property.

## Members

{% api_method setDirections 'directions' A %}

```javascript
Game.spawns['Spawn1'].spawning.setDirections([RIGHT, TOP_RIGHT]);
```

Set desired directions where the creep should move when spawned.

{% api_method_params %}
directions : array<number>
An array with the direction constants:

TOP

TOP_RIGHT

RIGHT

BOTTOM_RIGHT

BOTTOM

BOTTOM_LEFT

LEFT

TOP_LEFT

{% endapi_method_params %}

### Return value

One of the following codes:
{% api_return_codes %}
OK | The operation has been scheduled successfully.
ERR_NOT_OWNER | You are not the owner of this spawn.
ERR_INVALID_ARGS | The directions is array is invalid.
{% endapi_return_codes %}
