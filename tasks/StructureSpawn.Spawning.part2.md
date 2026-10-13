# StructureSpawn.Spawning: part 2 of 3
Module: `Screeps.Internal.StructureSpawn.Spawning.Part2`
Files: `src/Screeps/Internal/StructureSpawn/Spawning/Part2.purs` and `src/Screeps/Internal/StructureSpawn/Spawning/Part2.js`
Bind ONLY these members: remainingTime, spawn, cancel
Other parts bind the rest of StructureSpawn.Spawning. Do not bind anything not listed above.

## About StructureSpawn.Spawning

Details of the creep being spawned currently that can be addressed by the [`StructureSpawn.spawning`](#StructureSpawn.spawning) property.

## Members

{% api_property remainingTime 'number ' %}

Remaining time to go.

{% api_property spawn 'StructureSpawn' %}

A link to the spawn.

{% api_method cancel '' A %}

```javascript
Game.spawns['Spawn1'].spawning.cancel();
```

Cancel spawning immediately. Energy spent on spawning is not returned.

### Return value

One of the following codes:
{% api_return_codes %}
OK | The operation has been scheduled successfully.
ERR_NOT_OWNER | You are not the owner of this spawn.
{% endapi_return_codes %}
