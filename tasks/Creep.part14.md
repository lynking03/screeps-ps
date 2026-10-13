# Creep: part 14 of 14
Module: `Screeps.Internal.Creep.Part14`
Files: `src/Screeps/Internal/Creep/Part14.purs` and `src/Screeps/Internal/Creep/Part14.js`
Bind ONLY these members: upgradeController, withdraw
Other parts bind the rest of Creep. Do not bind anything not listed above.

## About Creep

Creeps are your units. Creeps can move, harvest energy, construct structures, attack another creeps, and perform other actions. Each creep consists of up to 50 body parts with the following possible types:

Inherits from RoomObject: those members are bound elsewhere.

## Members

{% api_method upgradeController 'target' A %}

```javascript
if(creep.room.controller) {
    if(creep.upgradeController(creep.room.controller) == ERR_NOT_IN_RANGE) {
        creep.moveTo(creep.room.controller);
    }
}

```

Upgrade your controller to the next level using carried energy. Upgrading controllers raises your Global Control Level in parallel. Requires WORK and CARRY body parts. The target has to be within 3 squares range of the creep. 

A fully upgraded level 8 controller can't be upgraded over 15 energy units per tick regardless of creeps abilities. The cumulative effect of all the creeps performing upgradeController in the current tick is taken into account. This limit can be increased by using ghodium mineral boost.

Upgrading the controller raises its `ticksToDowngrade` timer by 100. The timer must be full in order for controller to be levelled up.

{% api_method_params %}
target : StructureController
The target controller object to be upgraded.
{% endapi_method_params %}

### Return value

One of the following codes:
{% api_return_codes %}
OK | The operation has been scheduled successfully.
ERR_NOT_OWNER | You are not the owner of this creep or the target controller.
ERR_BUSY | The creep is still being spawned.
ERR_NOT_ENOUGH_RESOURCES | The creep does not have any carried energy.
ERR_INVALID_TARGET | The target is not a valid controller object, or the controller upgrading is blocked.
ERR_NOT_IN_RANGE | The target is too far away.
ERR_NO_BODYPART | There are no WORK body parts in this creep’s body.
ERR_ACCESS_DENIED | You do not have access to this restricted shard. Use [`Game.shard.activateAccess`](#Game.shard.activateAccess) to activate access.
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
ERR_BUSY | The creep is still being spawned.
ERR_NOT_ENOUGH_RESOURCES | The target does not have the given amount of resources.
ERR_INVALID_TARGET | The target is not a valid object which can contain the specified resource.
ERR_FULL | The creep's carry is full.
ERR_NOT_IN_RANGE | The target is too far away.
ERR_INVALID_ARGS | The resourceType is not one of the RESOURCE_* constants, or the amount is incorrect.
{% endapi_return_codes %}
