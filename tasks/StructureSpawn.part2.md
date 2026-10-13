# StructureSpawn: part 2 of 3
Module: `Screeps.Internal.StructureSpawn.Part2`
Files: `src/Screeps/Internal/StructureSpawn/Part2.purs` and `src/Screeps/Internal/StructureSpawn/Part2.js`
Bind ONLY these members: store, spawnCreep, recycleCreep
Other parts bind the rest of StructureSpawn. Do not bind anything not listed above.

## About StructureSpawn

Spawn is your colony center. This structure can create, renew, and recycle creeps.
All your spawns are accessible through [`Game.spawns`](#Game.spawns) hash list. 
Spawns auto-regenerate a little amount of energy each tick, so that you can easily
recover even if all your creeps died.

Inherits from OwnedStructure: those members are bound elsewhere.

## Members

{% api_property store 'Store' %}

```javascript
if(structure.store.getFreeCapacity(RESOURCE_ENERGY) > 0) {
    creep.transfer(structure, RESOURCE_ENERGY);
}
```

A [`Store`](#Store) object that contains cargo of this structure.

{% api_method spawnCreep 'body, name, [opts]' A %}

```javascript
Game.spawns['Spawn1'].spawnCreep([WORK, CARRY, MOVE], 'Worker1');
```

```javascript
Game.spawns['Spawn1'].spawnCreep([WORK, CARRY, MOVE], 'Worker1', {
    memory: {role: 'harvester'}
});
```

```javascript
Game.spawns['Spawn1'].spawnCreep([WORK, CARRY, MOVE], 'Worker1', { 
    energyStructures: [
        Game.spawns['Spawn1'], 
        Game.getObjectById('anExtensionId')
    ]
});
```

```javascript
var testIfCanSpawn = Game.spawns['Spawn1'].spawnCreep([WORK, CARRY, MOVE], 
    'Worker1', { dryRun: true });
```

Start the creep spawning process. The required energy amount can be withdrawn from all spawns and extensions in the room.

{% api_method_params %}
body : array<string>
An array describing the new creep’s body. Should contain 1 to 50 elements with one of these constants:

* `WORK`
* `MOVE`
* `CARRY`
* `ATTACK`
* `RANGED_ATTACK`
* `HEAL`
* `TOUGH`
* `CLAIM`

===
name : string
The name of a new creep. The name length limit is 100 characters. It must be a unique creep name, i.e. the Game.creeps object should not contain another creep with the same name (hash key).
===
opts (optional) : object
An object with additional options for the spawning process.

- memory : any — Memory of the new creep. If provided, it will be immediately stored into Memory.creeps[name].

- energyStructures : array — Array of spawns/extensions from which to draw energy for the spawning process. Structures will be used according to the array order.

- dryRun : boolean — If `dryRun` is true, the operation will only check if it is possible to create a creep.

- directions : array — Set desired directions where the creep should move when spawned. An array with the direction constants:

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
ERR_NAME_EXISTS | There is a creep with the same name already.
ERR_BUSY | The spawn is already in process of spawning another creep.
ERR_NOT_ENOUGH_ENERGY | The spawn and its extensions contain not enough energy to create a creep with the given body.
ERR_INVALID_ARGS | Body is not properly described or name was not provided.
ERR_RCL_NOT_ENOUGH | Your Room Controller level is insufficient to use this spawn.
{% endapi_return_codes %}

{% api_method recycleCreep 'target' A %}

Kill the creep and drop up to 100% of resources spent on its spawning and boosting depending on remaining life time. The target should be at adjacent square. Energy return is limited to 125 units per body part.

{% api_method_params %}
target : Creep
The target creep object.
{% endapi_method_params %}

### Return value

One of the following codes:
{% api_return_codes %}
OK | The operation has been scheduled successfully.
ERR_NOT_OWNER | You are not the owner of this spawn or the target creep.
ERR_INVALID_TARGET | The specified target object is not a creep.
ERR_NOT_IN_RANGE | The target creep is too far away.
ERR_RCL_NOT_ENOUGH | Your Room Controller level is insufficient to use this spawn.
{% endapi_return_codes %}
