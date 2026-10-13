# PowerCreep: part 12 of 12
Module: `Screeps.Internal.PowerCreep.Part12`
Files: `src/Screeps/Internal/PowerCreep/Part12.purs` and `src/Screeps/Internal/PowerCreep/Part12.js`
Bind ONLY these members: usePower, withdraw
Other parts bind the rest of PowerCreep. Do not bind anything not listed above.

## About PowerCreep

Power Creeps are immortal "heroes" that are tied to your account and can be respawned in any `PowerSpawn` after death.
You can upgrade their abilities ("powers") up to your account Global Power Level (see [`Game.gpl`](#Game.gpl)).

[Full list of available powers](/power.html#Powers)

Inherits from RoomObject: those members are bound elsewhere.

## Members

{% api_method usePower 'power, [target]' A %}

```javascript
Game.powerCreeps['PowerCreep1'].usePower(PWR_GENERATE_OPS);
```

```javascript
Game.powerCreeps['PowerCreep1'].usePower(PWR_OPERATE_SPAWN, Game.spawns['Spawn1']);
```

Apply one the creep's powers on the specified target.
You can only use powers in rooms either without a controller, or with a [power-enabled](#PowerCreep.enableRoom) controller.
Only one power can be used during the same tick, each `usePower` call will override the previous one.
If the target has the same effect of a lower or equal level, it is overridden. If the existing effect level is higher, an error is returned.

[Full list of available powers](/power.html#Powers)

{% api_method_params %}
power : number
The power ability to use, one of the `PWR_*` constants.
===
target (optional) : RoomObject
A target object in the room.
{% endapi_method_params %}

### Return value

One of the following codes:
{% api_return_codes %}
OK | The operation has been scheduled successfully.
ERR_NOT_OWNER | You are not the owner of the creep.
ERR_BUSY | The creep is not spawned in the world.
ERR_NO_BODYPART | The creep doesn't have the specified power ability.
ERR_TIRED | The power ability is still on cooldown.
ERR_NOT_ENOUGH_RESOURCES | The creep doesn't have enough resources to use the power.
ERR_INVALID_TARGET | The specified target is not valid.
ERR_NOT_IN_RANGE | The specified target is too far away.
ERR_INVALID_ARGS | Using powers is not enabled on the Room Controller.
ERR_FULL | The target has the same active effect of a higher level.
{% endapi_return_codes %}

{% api_method withdraw 'target, resourceType, [amount]' A %}

```javascript
if(creep.withdraw(storage, RESOURCE_ENERGY) == ERR_NOT_IN_RANGE) {
	creep.moveTo(storage);
}
```

Withdraw resources from a structure or tombstone. The target has to be at adjacent square to the creep. Multiple creeps can withdraw from the same object in the same tick. Your creeps can withdraw resources from hostile structures/tombstones as well, in case if there is no hostile rampart on top of it.

This method should not be used to transfer resources between creeps. To transfer between creeps, use the [`transfer`](#Creep.transfer) method on the original creep.

{% api_method_params %}
target : Structure, Tombstone, Ruin
The target object.
===
resourceType : string
One of the RESOURCE_* constants.
===
amount (optional) : number
The amount of resources to be transferred. If omitted, all the available amount is used.
{% endapi_method_params %}

### Return value

One of the following codes:
{% api_return_codes %}
OK | The operation has been scheduled successfully.
ERR_NOT_OWNER | You are not the owner of this creep, or there is a hostile rampart on top of the target.
ERR_BUSY | The power creep is not spawned in the world.
ERR_NOT_ENOUGH_RESOURCES | The target does not have the given amount of resources.
ERR_INVALID_TARGET | The target is not a valid object which can contain the specified resource.
ERR_FULL | The creep's carry is full.
ERR_NOT_IN_RANGE | The target is too far away.
ERR_INVALID_ARGS | The resourceType is not one of the RESOURCE_* constants, or the amount is incorrect.
{% endapi_return_codes %}
