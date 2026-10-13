{% api_method observeRoom 'roomName' A %}

Provide visibility into a distant room from your script. The target room object will be available on the next tick.

{% api_method_params %}
roomName : string
The name of the target room.
{% endapi_method_params %}

### Return value

One of the following codes:
{% api_return_codes %}
OK | The operation has been scheduled successfully.
ERR_NOT_OWNER | You are not the owner of this structure.
ERR_INVALID_ARGS | roomName argument is not a valid room name value.
ERR_NOT_IN_RANGE | Room roomName is not in observing range.
ERR_RCL_NOT_ENOUGH | Room Controller Level insufficient to use this structure.
{% endapi_return_codes %}
