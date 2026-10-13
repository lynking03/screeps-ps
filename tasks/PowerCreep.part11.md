# PowerCreep: part 11 of 12
Module: `Screeps.Internal.PowerCreep.Part11`
Files: `src/Screeps/Internal/PowerCreep/Part11.purs` and `src/Screeps/Internal/PowerCreep/Part11.js`
Bind ONLY these members: suicide, transfer, upgrade
Other parts bind the rest of PowerCreep. Do not bind anything not listed above.

## About PowerCreep

Power Creeps are immortal "heroes" that are tied to your account and can be respawned in any `PowerSpawn` after death.
You can upgrade their abilities ("powers") up to your account Global Power Level (see [`Game.gpl`](#Game.gpl)).

[Full list of available powers](/power.html#Powers)

Inherits from RoomObject: those members are bound elsewhere.

## Members

{% api_method suicide '' A %}

Kill the power creep immediately. It will not be destroyed permanently, but will become unspawned,
so that you can [`spawn`](#PowerCreep.spawn) it again.

### Return value

One of the following codes:
{% api_return_codes %}
OK | The operation has been scheduled successfully.
ERR_NOT_OWNER | You are not the owner of this creep.
ERR_BUSY | The power creep is not spawned in the world.
{% endapi_return_codes %}

{% api_method transfer 'target, resourceType, [amount]' A %}

```javascript
if(creep.transfer(storage, RESOURCE_ENERGY) == ERR_NOT_IN_RANGE) {
	creep.moveTo(storage);
}
```

```javascript
// transfer all resources
for(const resourceType in creep.carry) {
	creep.transfer(storage, resourceType);
}
```

Transfer resource from the creep to another object. The target has to be at adjacent square to the creep.

{% api_method_params %}
target : Creep, PowerCreep, Structure
The target object.
===
resourceType : string
One of the RESOURCE_* constants.
===
amount (optional) : number
The amount of resources to be transferred. If omitted, all the available carried amount is used.
{% endapi_method_params %}

### Return value

One of the following codes:
{% api_return_codes %}
OK | The operation has been scheduled successfully.
ERR_NOT_OWNER | You are not the owner of this creep.
ERR_BUSY | The power creep is not spawned in the world.
ERR_NOT_ENOUGH_RESOURCES | The creep does not have the given amount of resources.
ERR_INVALID_TARGET | The target is not a valid object which can contain the specified resource.
ERR_FULL | The target cannot receive any more resources.
ERR_NOT_IN_RANGE | The target is too far away.
ERR_INVALID_ARGS | The resourceType is not one of the RESOURCE_* constants, or the amount is incorrect.
{% endapi_return_codes %}

{% api_method upgrade 'power' A %}

```javascript
Game.powerCreeps['PowerCreep1'].upgrade(PWR_GENERATE_OPS);
```

Upgrade the creep, adding a new power ability to it or increasing level of the existing power.
You need one free Power Level in your account to perform this action.

{% api_method_params %}
power : number
The power ability to upgrade, one of the `PWR_*` constants.
{% endapi_method_params %}

### Return value

One of the following codes:
{% api_return_codes %}
OK | The operation has been scheduled successfully.
ERR_NOT_OWNER | You are not the owner of the creep.
ERR_NOT_ENOUGH_RESOURCES | You account Power Level is not enough.
ERR_FULL | The specified power cannot be upgraded on this creep's level, or the creep reached the maximum level.
ERR_INVALID_ARGS | The specified power ID is not valid.
{% endapi_return_codes %}
