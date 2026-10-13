# PowerCreep: part 10 of 12
Module: `Screeps.Internal.PowerCreep.Part10`
Files: `src/Screeps/Internal/PowerCreep/Part10.purs` and `src/Screeps/Internal/PowerCreep/Part10.js`
Bind ONLY these members: renew, say, spawn
Other parts bind the rest of PowerCreep. Do not bind anything not listed above.

## About PowerCreep

Power Creeps are immortal "heroes" that are tied to your account and can be respawned in any `PowerSpawn` after death.
You can upgrade their abilities ("powers") up to your account Global Power Level (see [`Game.gpl`](#Game.gpl)).

[Full list of available powers](/power.html#Powers)

Inherits from RoomObject: those members are bound elsewhere.

## Members

{% api_method renew 'target' A %}

```javascript
let powerBank = Game.getObjectById('XXX');
Game.powerCreeps['PowerCreep1'].renew(powerBank);

```

Instantly restore time to live to the maximum using a Power Spawn or a Power Bank nearby. It has to be at adjacent tile.

{% api_method_params %}
target : StructurePowerBank | StructurePowerSpawn
The target structure.
{% endapi_method_params %}

### Return value

One of the following codes:
{% api_return_codes %}
OK | The operation has been scheduled successfully.
ERR_NOT_OWNER | You are not the owner of this creep.
ERR_BUSY | The power creep is not spawned in the world.
ERR_INVALID_TARGET | The target is not a valid power bank object.
ERR_NOT_IN_RANGE | The target is too far away.
{% endapi_return_codes %}

{% api_method say 'message, [public]' 0 %}

```javascript
const hostiles = creep.pos.findInRange(FIND_HOSTILE_CREEPS, 10);
if(hostiles.length > 0) {
    creep.say('OMG!😨');
    creep.moveTo(Game.spawns['Spawn1']);
}
else {
    doWork(creep);
}
```

Display a visual speech balloon above the creep with the specified message. The message will be available for one tick. You can read the last message using the saying property. Any valid Unicode characters are allowed, including emoji.

{% api_method_params %}
message : string
The message to be displayed. Maximum length is 10 characters.
===
public (optional) : boolean
Set to true to allow other players to see this message. Default is false.
{% endapi_method_params %}

### Return value

One of the following codes:
{% api_return_codes %}
OK | The operation has been scheduled successfully.
ERR_NOT_OWNER | You are not the owner of this creep.
ERR_BUSY | The power creep is not spawned in the world.
{% endapi_return_codes %}

{% api_method spawn 'powerSpawn' A %}

```javascript
Game.powerCreeps['PowerCreep1'].spawn(Game.getObjectById('XXX'));
```

Spawn this power creep in the specified Power Spawn.

{% api_method_params %}
powerSpawn : StructurePowerSpawn
Your Power Spawn structure.
{% endapi_method_params %}

### Return value

One of the following codes:
{% api_return_codes %}
OK | The operation has been scheduled successfully.
ERR_NOT_OWNER | You are not the owner of the creep or the spawn.
ERR_BUSY | The power creep is already spawned in the world.
ERR_RCL_NOT_ENOUGH | Room Controller Level insufficient to use the spawn.
ERR_INVALID_TARGET | The specified object is not a Power Spawn.
ERR_TIRED | The power creep cannot be spawned because of the cooldown.
{% endapi_return_codes %}
