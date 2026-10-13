{% api_method setPublic 'isPublic' A %}

Make this rampart public to allow other players' creeps to pass through.

{% api_method_params %}
isPublic : boolean
Whether this rampart should be public or non-public.
{% endapi_method_params %}

### Return value

One of the following codes:
{% api_return_codes %}
OK | The operation has been scheduled successfully.
ERR_NOT_OWNER | You are not the owner of this structure.
{% endapi_return_codes %}
