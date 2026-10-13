# Game.cpu: part 4 of 4
Module: `Screeps.Internal.Game.Cpu.Part4`
Files: `src/Screeps/Internal/Game/Cpu/Part4.purs` and `src/Screeps/Internal/Game/Cpu/Part4.js`
Bind ONLY these members: Game.cpu.setShardLimits, Game.cpu.unlock, Game.cpu.generatePixel
Other parts bind the rest of Game.cpu. Do not bind anything not listed above.

## About Game.cpu

A global object containing information about your CPU usage.

## Members

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

{% api_method Game.cpu.unlock '' 1 %}

```javascript
if(Game.cpu.unlockedTime && ((Game.cpu.unlockedTime - Date.now()) < 1000*60*60*24)) {
    Game.cpu.unlock();
}
```

Unlock full CPU for your account for additional 24 hours. This method will consume 1 CPU unlock bound to your account (See [`Game.resources`](#Game.resources)).
If full CPU is not currently unlocked for your account, it may take some time (up to 5 minutes) before unlock is applied to your account.

### Return value

One of the following codes:
{% api_return_codes %}
OK | The operation has been scheduled successfully.
ERR_FULL | Your CPU is unlocked with a subscription.
ERR_NOT_ENOUGH_RESOURCES | Your account does not have enough `cpuUnlock` resource.
{% endapi_return_codes %}

{% api_method Game.cpu.generatePixel '' 3 %}

```javascript
if(Game.cpu.bucket == 10000) {
    Game.cpu.generatePixel();
}
```

Generate 1 pixel resource unit for 10000 CPU from your bucket.

### Return value

One of the following codes:
{% api_return_codes %}
OK | The operation has been scheduled successfully.
ERR_NOT_ENOUGH_RESOURCES | Your bucket does not have enough CPU.
{% endapi_return_codes %}
