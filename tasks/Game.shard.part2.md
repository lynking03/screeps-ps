# Game.shard: part 2 of 2
Module: `Screeps.Internal.Game.Shard.Part2`
Files: `src/Screeps/Internal/Game/Shard/Part2.purs` and `src/Screeps/Internal/Game/Shard/Part2.js`
Bind ONLY these members: Game.shard.access, Game.shard.accessTime, Game.shard.activateAccess
Other parts bind the rest of Game.shard. Do not bind anything not listed above.

## About Game.shard

An object describing the world shard where your script is currently being executed in.

## Members

{% api_property Game.shard.access 'boolean' %}

Whether you currently have access to this shard. Always `true` on non-restricted shards. On restricted shards, requires either an active [`ACCESS_KEY`](#Constants) resource or an unlimited access subscription. Use [`Game.shard.activateAccess`](#Game.shard.activateAccess) to activate access.

{% api_property Game.shard.accessTime 'number' %}

The time in milliseconds since UNIX epoch time until access to this restricted shard is active. This property is not defined when access is unlimited or when access is not currently active.

{% api_method Game.shard.activateAccess '' 1 %}

```javascript
if(Game.shard.access && Game.shard.accessTime && ((Game.shard.accessTime - Date.now()) < 1000*60*60*24*7)) {
    Game.shard.activateAccess();
}
```

Activate access to the current restricted shard for additional 30 days. This method will consume 1 [`ACCESS_KEY`](#Constants) resource bound to your account (See [`Game.resources`](#Game.resources)). This method is only available on restricted shards (when `Game.shard.access` is defined).

### Return value

One of the following codes:
{% api_return_codes %}
OK | The operation has been scheduled successfully.
ERR_INVALID_TARGET | This shard is not restricted.
ERR_FULL | Your access is unlimited.
ERR_NOT_ENOUGH_RESOURCES | Your account does not have enough `accessKey` resource.
{% endapi_return_codes %}
