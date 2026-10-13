{% api_method boostCreep 'creep, [bodyPartsCount]' A %}

Boosts creep body parts using the containing mineral compound. The creep has to be at adjacent square to the lab. 

{% api_method_params %}
creep : Creep
The target creep.
===
bodyPartsCount (optional) : number
The number of body parts of the corresponding type to be boosted. Body parts are always counted left-to-right for TOUGH, and right-to-left for other types. If undefined, all the eligible body parts are boosted.
{% endapi_method_params %}

### Return value

One of the following codes:
{% api_return_codes %}
OK | The operation has been scheduled successfully.
ERR_NOT_OWNER | You are not the owner of this lab.
ERR_NOT_FOUND | The mineral containing in the lab cannot boost any of the creep's body parts.
ERR_NOT_ENOUGH_RESOURCES | The lab does not have enough energy or minerals.
ERR_INVALID_TARGET | The targets is not valid creep object.
ERR_NOT_IN_RANGE | The targets are too far away.
ERR_RCL_NOT_ENOUGH | Room Controller Level insufficient to use this structure.
{% endapi_return_codes %}
