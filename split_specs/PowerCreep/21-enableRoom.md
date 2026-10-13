{% api_method enableRoom 'controller' A %}

```javascript
powerCreep.enableRoom(powerCreep.room.controller);
```

Enable powers usage in this room. The room controller should be at adjacent tile.

{% api_method_params %}
controller : StructureController
The room controller.
{% endapi_method_params %}

### Return value

One of the following codes:
{% api_return_codes %}
OK | The operation has been scheduled successfully.
ERR_NOT_OWNER | You are not the owner of this creep.
ERR_INVALID_TARGET | The target is not a controller structure.
ERR_NOT_IN_RANGE | The target is too far away.
{% endapi_return_codes %}
