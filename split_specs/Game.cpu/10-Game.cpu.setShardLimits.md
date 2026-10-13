{% api_method Game.cpu.setShardLimits 'limits' 1 %}

```javascript
Game.cpu.setShardLimits({shard0: 20, shard1: 10});
```

Allocate CPU limits to different shards. Total amount of CPU should remain equal to
[`Game.cpu.shardLimits`](#Game.cpu.shardLimits). This method can be used only once per 12 hours.

{% api_method_params %}
limits : object<string, number>
An object with CPU values for each shard in the same format as `Game.cpu.shardLimits`.
{% endapi_method_params %}

### Return value

One of the following codes:
{% api_return_codes %}
OK | The operation has been scheduled successfully.
ERR_BUSY | 12-hours cooldown period is not over yet.
ERR_INVALID_ARGS | The argument is not a valid shard limits object.
{% endapi_return_codes %}
