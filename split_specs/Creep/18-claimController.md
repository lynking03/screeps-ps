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
