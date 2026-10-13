{% api_method cancel '' A %}

```javascript
Game.spawns['Spawn1'].spawning.cancel();
```

Cancel spawning immediately. Energy spent on spawning is not returned.

### Return value

One of the following codes:
{% api_return_codes %}
OK | The operation has been scheduled successfully.
ERR_NOT_OWNER | You are not the owner of this spawn.
{% endapi_return_codes %}
