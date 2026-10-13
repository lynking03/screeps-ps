{% api_method delete '[cancel]' A %}

```javascript
Game.powerCreeps['PowerCreep1'].delete();
```

Delete the power creep permanently from your account. It should NOT be spawned in the world. The creep is not deleted
immediately, but a 24-hours delete timer is started instead (see [`deleteTime`](#PowerCreep.deleteTime)). You can cancel deletion by calling `delete(true)`.

{% api_method_params %}
cancel : boolean
Set this to true to cancel previously scheduled deletion.
{% endapi_method_params %}

### Return value

One of the following codes:
{% api_return_codes %}
OK | The operation has been scheduled successfully.
ERR_NOT_OWNER | You are not the owner of the creep.
ERR_BUSY | The power creep is spawned in the world.
{% endapi_return_codes %}
