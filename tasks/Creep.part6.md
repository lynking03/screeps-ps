# Creep: part 6 of 14
Module: `Screeps.Internal.Creep.Part6`
Files: `src/Screeps/Internal/Creep/Part6.purs` and `src/Screeps/Internal/Creep/Part6.js`
Bind ONLY these members: build, cancelOrder, claimController
Other parts bind the rest of Creep. Do not bind anything not listed above.

## About Creep

Creeps are your units. Creeps can move, harvest energy, construct structures, attack another creeps, and perform other actions. Each creep consists of up to 50 body parts with the following possible types:

Inherits from RoomObject: those members are bound elsewhere.

## Members

{% api_method build 'target' A %}

```javascript
const target = creep.pos.findClosestByRange(FIND_CONSTRUCTION_SITES);
if(target) {
    if(creep.build(target) == ERR_NOT_IN_RANGE) {
        creep.moveTo(target);
    }
}

```

Build a structure at the target construction site using carried energy. Requires WORK and CARRY body parts. The target has to be within 3 squares range of the creep.

{% api_method_params %}
target : ConstructionSite
The target construction site to be built.
{% endapi_method_params %}

### Return value

One of the following codes:
{% api_return_codes %}
OK | The operation has been scheduled successfully.
ERR_NOT_OWNER | You are not the owner of this creep.
ERR_BUSY | The creep is still being spawned.
ERR_NOT_ENOUGH_RESOURCES | The creep does not have any carried energy.
ERR_INVALID_TARGET | The target is not a valid construction site object or the structure cannot be built here (probably because of a creep at the same square).
ERR_NOT_IN_RANGE | The target is too far away.
ERR_NO_BODYPART | There are no WORK body parts in this creep’s body.
{% endapi_return_codes %}

{% api_method cancelOrder 'methodName' 0 %}

```javascript
creep.move(LEFT);
creep.cancelOrder('move');
//The creep will not move in this game tick
```

Cancel the order given during the current game tick.

{% api_method_params %}
methodName : string
The name of a creep's method to be cancelled.
{% endapi_method_params %}

### Return value

One of the following codes:
{% api_return_codes %}
OK | The operation has been cancelled successfully.
ERR_NOT_FOUND | The order with the specified name is not found.
{% endapi_return_codes %}

{% api_method claimController 'target' A %}

```javascript
if(creep.room.controller) {
    if(creep.claimController(creep.room.controller) == ERR_NOT_IN_RANGE) {
        creep.moveTo(creep.room.controller);
    }
}

```

Claims a neutral controller under your control. Requires the CLAIM body part. The target has to be at adjacent square to the creep. You need to have the corresponding Global Control Level in order to claim a new room. If you don't have enough GCL, consider reserving this room instead. Learn more

{% api_method_params %}
target : StructureController
The target controller object.
{% endapi_method_params %}

### Return value

One of the following codes:
{% api_return_codes %}
OK | The operation has been scheduled successfully.
ERR_NOT_OWNER | You are not the owner of this creep.
ERR_BUSY | The creep is still being spawned.
ERR_INVALID_TARGET | The target is not a valid neutral controller object.
ERR_FULL | You cannot claim more than 3 rooms in the Novice Area.
ERR_NOT_IN_RANGE | The target is too far away.
ERR_NO_BODYPART | There are no CLAIM body parts in this creep’s body.
ERR_GCL_NOT_ENOUGH | Your Global Control Level is not enough.
ERR_ACCESS_DENIED | You do not have access to this restricted shard. Use [`Game.shard.activateAccess`](#Game.shard.activateAccess) to activate access.
{% endapi_return_codes %}
