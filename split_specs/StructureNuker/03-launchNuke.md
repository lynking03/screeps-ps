{% api_method launchNuke 'pos' A %}

```javascript
nuker.launchNuke(new RoomPosition(20,30, 'W1N1'));
```

Launch a nuke to the specified position.

{% api_method_params %}
pos : RoomPosition
The target room position.
{% endapi_method_params %}

### Return value

One of the following codes:
{% api_return_codes %}
OK | The operation has been scheduled successfully.
ERR_NOT_OWNER | You are not the owner of this structure.
ERR_NOT_ENOUGH_RESOURCES | The structure does not have enough energy and/or ghodium.
ERR_INVALID_ARGS | The target is not a valid RoomPosition.
ERR_INVALID_TARGET | The nuke can't be launched to the specified RoomPosition (see [Start Areas](/start-areas.html)).
ERR_NOT_IN_RANGE | The target room is out of range.
ERR_TIRED | This structure is still cooling down.
ERR_RCL_NOT_ENOUGH | Room Controller Level insufficient to use this structure.
{% endapi_return_codes %}
