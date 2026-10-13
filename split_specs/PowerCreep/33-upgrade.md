{% api_method upgrade 'power' A %}

```javascript
Game.powerCreeps['PowerCreep1'].upgrade(PWR_GENERATE_OPS);
```

Upgrade the creep, adding a new power ability to it or increasing level of the existing power.
You need one free Power Level in your account to perform this action.

{% api_method_params %}
power : number
The power ability to upgrade, one of the `PWR_*` constants.
{% endapi_method_params %}

### Return value

One of the following codes:
{% api_return_codes %}
OK | The operation has been scheduled successfully.
ERR_NOT_OWNER | You are not the owner of the creep.
ERR_NOT_ENOUGH_RESOURCES | You account Power Level is not enough.
ERR_FULL | The specified power cannot be upgraded on this creep's level, or the creep reached the maximum level.
ERR_INVALID_ARGS | The specified power ID is not valid.
{% endapi_return_codes %}
