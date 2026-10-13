{% api_method attackController 'target' A %}

```javascript
if(creep.room.controller && !creep.room.controller.my) {
    if(creep.attackController(creep.room.controller) == ERR_NOT_IN_RANGE) {
        creep.moveTo(creep.room.controller);
    }
}

```

Decreases the controller's downgrade timer by 300 ticks per every CLAIM body part, or reservation timer by 1 tick per every CLAIM body part. If the controller under attack is owned, it cannot be upgraded or attacked again for the next 1,000 ticks. The target has to be at adjacent square to the creep.

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
ERR_INVALID_TARGET | The target is not a valid owned or reserved controller object.
ERR_NOT_IN_RANGE | The target is too far away.
ERR_NO_BODYPART | There are not enough CLAIM body parts in this creep’s body.
ERR_TIRED | You have to wait until the next attack is possible.
{% endapi_return_codes %}
