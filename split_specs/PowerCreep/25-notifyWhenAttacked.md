{% api_method notifyWhenAttacked 'enabled' A %}

```javascript
Game.powerCreeps['PC1'].notifyWhenAttacked(true);
```

Toggle auto notification when the creep is under attack. The notification will be sent to your account email. Turned on by default.

{% api_method_params %}
enabled : boolean
Whether to enable notification or disable.
{% endapi_method_params %}

### Return value

One of the following codes:
{% api_return_codes %}
OK | The operation has been scheduled successfully.
ERR_NOT_OWNER | You are not the owner of this creep.
ERR_BUSY | The power creep is not spawned in the world.
ERR_INVALID_ARGS | enable argument is not a boolean value.
{% endapi_return_codes %}
