{% api_method repair 'target' A %}

```javascript
const targets = creep.room.find(FIND_STRUCTURES, {
    filter: object => object.hits < object.hitsMax
});

targets.sort((a,b) => a.hits - b.hits);

if(targets.length > 0) {
    if(creep.repair(targets[0]) == ERR_NOT_IN_RANGE) {
        creep.moveTo(targets[0]);
    }
}
```

Repair a damaged structure using carried energy. Requires the WORK and CARRY body parts. The target has to be within 3 squares range of the creep.

{% api_method_params %}
target : Structure
The target structure to be repaired.
{% endapi_method_params %}

### Return value

One of the following codes:
{% api_return_codes %}
OK | The operation has been scheduled successfully.
ERR_NOT_OWNER | You are not the owner of this creep.
ERR_BUSY | The creep is still being spawned.
ERR_NOT_ENOUGH_RESOURCES | The creep does not carry any energy.
ERR_INVALID_TARGET | The target is not a valid structure object.
ERR_NOT_IN_RANGE | The target is too far away.
ERR_NO_BODYPART | There are no WORK body parts in this creep’s body.
{% endapi_return_codes %}
