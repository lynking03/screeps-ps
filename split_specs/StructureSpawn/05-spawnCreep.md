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
