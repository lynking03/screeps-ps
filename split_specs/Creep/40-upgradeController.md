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
