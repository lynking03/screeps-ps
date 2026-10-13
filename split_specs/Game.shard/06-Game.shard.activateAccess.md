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
