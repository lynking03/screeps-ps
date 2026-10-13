{% api_method reverseReaction 'lab1, lab2' A %}

Breaks mineral compounds back into reagents. The same output labs can be used by many source labs.

{% api_method_params %}
lab1 : StructureLab
The first result lab.
===
lab2 : StructureLab
The second result lab.
{% endapi_method_params %}

### Return value

One of the following codes:
{% api_return_codes %}
OK | The operation has been scheduled successfully.
ERR_NOT_OWNER | You are not the owner of this lab.
ERR_NOT_ENOUGH_RESOURCES | The source lab do not have enough resources.
ERR_INVALID_TARGET | The targets are not valid lab objects.
ERR_FULL | One of targets cannot receive any more resource.
ERR_NOT_IN_RANGE | The targets are too far away.
ERR_INVALID_ARGS | The reaction cannot be reversed into this resources.
ERR_TIRED | The lab is still cooling down.
ERR_RCL_NOT_ENOUGH | Room Controller Level insufficient to use this structure.
{% endapi_return_codes %}
