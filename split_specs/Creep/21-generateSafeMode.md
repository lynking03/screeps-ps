{% api_method generateSafeMode 'target' A %}

```javascript
if(creep.generateSafeMode(creep.room.controller) == ERR_NOT_IN_RANGE) {
    creep.moveTo(creep.room.controller);
}

```

Add one more available safe mode activation to a room controller. The creep has to be at adjacent square to the target room controller and have 1000 ghodium resource.

{% api_method_params %}
target : StructureController
The target room controller.
{% endapi_method_params %}

### Return value

One of the following codes:
{% api_return_codes %}
OK | The operation has been scheduled successfully.
ERR_NOT_OWNER | You are not the owner of this creep.
ERR_BUSY | The creep is still being spawned.
ERR_NOT_ENOUGH_RESOURCES | The creep does not have enough ghodium.
ERR_INVALID_TARGET | The target is not a valid controller object.
ERR_NOT_IN_RANGE | The target is too far away.
{% endapi_return_codes %}
