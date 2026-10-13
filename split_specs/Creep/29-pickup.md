{% api_method pickup 'target' A %}

```javascript
const target = creep.pos.findClosestByRange(FIND_DROPPED_RESOURCES);
if(target) {
    if(creep.pickup(target) == ERR_NOT_IN_RANGE) {
        creep.moveTo(target);
    }
}

```

Pick up an item (a dropped piece of energy). Requires the CARRY body part. The target has to be at adjacent square to the creep or at the same square.

{% api_method_params %}
target : Resource
The target object to be picked up.
{% endapi_method_params %}

### Return value

One of the following codes:
{% api_return_codes %}
OK | The operation has been scheduled successfully.
ERR_NOT_OWNER | You are not the owner of this creep.
ERR_BUSY | The creep is still being spawned.
ERR_INVALID_TARGET | The target is not a valid object to pick up.
ERR_FULL | The creep cannot receive any more resource.
ERR_NOT_IN_RANGE | The target is too far away.
{% endapi_return_codes %}
