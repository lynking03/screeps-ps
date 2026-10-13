{% api_method recycleCreep 'target' A %}

Kill the creep and drop up to 100% of resources spent on its spawning and boosting depending on remaining life time. The target should be at adjacent square. Energy return is limited to 125 units per body part.

{% api_method_params %}
target : Creep
The target creep object.
{% endapi_method_params %}

### Return value

One of the following codes:
{% api_return_codes %}
OK | The operation has been scheduled successfully.
ERR_NOT_OWNER | You are not the owner of this spawn or the target creep.
ERR_INVALID_TARGET | The specified target object is not a creep.
ERR_NOT_IN_RANGE | The target creep is too far away.
ERR_RCL_NOT_ENOUGH | Your Room Controller level is insufficient to use this spawn.
{% endapi_return_codes %}
