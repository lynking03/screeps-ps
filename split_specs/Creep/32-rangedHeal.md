{% api_method rangedHeal 'target' A %}

```javascript
const target = creep.pos.findClosestByRange(FIND_MY_CREEPS, {
    filter: function(object) {
        return object.hits < object.hitsMax;
    }
});
if(target) {
    creep.moveTo(target);
    if(creep.pos.isNearTo(target)) {
        creep.heal(target);
    }
    else {
        creep.rangedHeal(target);
    }
}
```

Heal another creep at a distance. It will restore the target creep’s damaged body parts function and increase the hits counter. Requires the HEAL body part. The target has to be within 3 squares range of the creep.

{% api_method_params %}
target : Creep, PowerCreep
The target creep object.
{% endapi_method_params %}

### Return value

One of the following codes:
{% api_return_codes %}
OK | The operation has been scheduled successfully.
ERR_NOT_OWNER | You are not the owner of this creep.
ERR_BUSY | The creep is still being spawned.
ERR_INVALID_TARGET | The target is not a valid creep object.
ERR_NOT_IN_RANGE | The target is too far away.
ERR_NO_BODYPART | There are no HEAL body parts in this creep’s body.
{% endapi_return_codes %}
