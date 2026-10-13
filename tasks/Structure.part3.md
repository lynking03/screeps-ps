# Structure: part 3 of 3
Module: `Screeps.Internal.Structure.Part3`
Files: `src/Screeps/Internal/Structure/Part3.purs` and `src/Screeps/Internal/Structure/Part3.js`
Bind ONLY these members: notifyWhenAttacked
Other parts bind the rest of Structure. Do not bind anything not listed above.

## About Structure

The base prototype object of all structures.

Inherits from RoomObject: those members are bound elsewhere.

## Members

{% api_method notifyWhenAttacked 'enabled' A %}

Toggle auto notification when the structure is under attack. The notification will be sent to your account email. Turned on by default.

{% api_method_params %}
enabled : boolean
Whether to enable notification or disable.
{% endapi_method_params %}

### Return value

One of the following codes:
{% api_return_codes %}
OK | The operation has been scheduled successfully.
ERR_NOT_OWNER | You are not the owner of this structure.
ERR_INVALID_ARGS | enable argument is not a boolean value.
{% endapi_return_codes %}
