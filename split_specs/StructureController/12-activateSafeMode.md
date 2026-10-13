{% api_method activateSafeMode '' A %}

```javascript
room.controller.activateSafeMode();
```

Activate safe mode if available.

### Return value

One of the following codes:
{% api_return_codes %}
OK | The operation has been scheduled successfully.
ERR_NOT_OWNER | You are not the owner of this controller.
ERR_BUSY | There is another room in safe mode already.
ERR_NOT_ENOUGH_RESOURCES | There is no safe mode activations available.
ERR_TIRED | The previous safe mode is still cooling down, or the controller is `upgradeBlocked`, or the controller is downgraded for 50% plus 5000 ticks or more.
{% endapi_return_codes %}
