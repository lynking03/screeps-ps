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
