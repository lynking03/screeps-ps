{% api_method runReaction 'lab1, lab2' A %}

Produce mineral compounds using reagents from two other labs. The same input labs can be used by many output labs.

{% api_method_params %}
lab1 : StructureLab (lab)
The first source lab.
===
lab2 : StructureLab (lab)
The second source lab.
{% endapi_method_params %}

### Return value

One of the following codes:
{% api_return_codes %}
OK | The operation has been scheduled successfully.
ERR_NOT_OWNER | You are not the owner of this lab.
ERR_NOT_ENOUGH_RESOURCES | The source lab do not have enough resources.
ERR_INVALID_TARGET | The targets are not valid lab objects.
ERR_FULL | The target cannot receive any more resource.
ERR_NOT_IN_RANGE | The targets are too far away.
ERR_INVALID_ARGS | The reaction cannot be run using this resources.
ERR_TIRED | The lab is still cooling down.
ERR_RCL_NOT_ENOUGH | Room Controller Level insufficient to use this structure.
{% endapi_return_codes %}
