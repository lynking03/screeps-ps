{% api_method unboostCreep 'creep' A %}

Immediately remove boosts from the creep and drop 50% of the mineral compounds used to boost it onto the ground regardless of the creep's remaining time to live. The creep has to be at adjacent square to the lab. Unboosting requires cooldown time equal to the total sum of the reactions needed to produce all the compounds applied to the creep.

{% api_method_params %}
creep : Creep
The target creep.
{% endapi_method_params %}

### Return value

One of the following codes:
{% api_return_codes %}
OK | The operation has been scheduled successfully.
ERR_NOT_OWNER | You are not the owner of this lab, or the target creep.
ERR_INVALID_TARGET | The target is not a valid Creep object.
ERR_TIRED | The lab is still cooling down.
ERR_NOT_IN_RANGE | The target is too far away.
ERR_NOT_FOUND | The target has no boosted parts.
ERR_RCL_NOT_ENOUGH | Room Controller Level insufficient to use this structure.
{% endapi_return_codes %}
