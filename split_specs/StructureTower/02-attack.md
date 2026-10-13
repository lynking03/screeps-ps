{% api_method attack 'target' A %}

Remotely attack any creep, power creep or structure in the room.

{% api_method_params %}
target : Creep, PowerCreep, Structure
The target object.
{% endapi_method_params %}

### Return value

One of the following codes:
{% api_return_codes %}
OK | The operation has been scheduled successfully.
ERR_NOT_OWNER | You are not the owner of this structure.
ERR_NOT_ENOUGH_ENERGY | The tower does not have enough energy.
ERR_INVALID_TARGET | The target is not a valid attackable object.
ERR_RCL_NOT_ENOUGH | Room Controller Level insufficient to use this structure.
{% endapi_return_codes %}
