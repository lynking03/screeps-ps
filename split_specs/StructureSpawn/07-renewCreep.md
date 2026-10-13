{% api_method renewCreep 'target' A %}

Increase the remaining time to live of the target creep. The target should be at adjacent square.
The target should not have CLAIM body parts.
The spawn should not be busy with the spawning process. Each execution increases the creep's timer
by amount of ticks according to this formula:

```javascript-content
floor(600/body_size)
```

Energy required for each execution is determined using this formula:

```javascript-content
ceil(creep_cost/2.5/body_size)
```

Renewing a creep removes all of its boosts.

{% api_method_params %}
target : Creep
The target creep object.
{% endapi_method_params %}

### Return value

One of the following codes:
{% api_return_codes %}
OK | The operation has been scheduled successfully.
ERR_NOT_OWNER | You are not the owner of the spawn, or the creep.
ERR_BUSY | The spawn is spawning another creep.
ERR_NOT_ENOUGH_ENERGY | The spawn does not have enough energy.
ERR_INVALID_TARGET | The specified target object is not a creep, or the creep has CLAIM body part.
ERR_FULL | The target creep's time to live timer is full.
ERR_NOT_IN_RANGE | The target creep is too far away.
ERR_RCL_NOT_ENOUGH | Your Room Controller level is insufficient to use this spawn.
{% endapi_return_codes %}
