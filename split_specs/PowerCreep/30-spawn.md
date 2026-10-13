{% api_method spawn 'powerSpawn' A %}

```javascript
Game.powerCreeps['PowerCreep1'].spawn(Game.getObjectById('XXX'));
```

Spawn this power creep in the specified Power Spawn.

{% api_method_params %}
powerSpawn : StructurePowerSpawn
Your Power Spawn structure.
{% endapi_method_params %}

### Return value

One of the following codes:
{% api_return_codes %}
OK | The operation has been scheduled successfully.
ERR_NOT_OWNER | You are not the owner of the creep or the spawn.
ERR_BUSY | The power creep is already spawned in the world.
ERR_RCL_NOT_ENOUGH | Room Controller Level insufficient to use the spawn.
ERR_INVALID_TARGET | The specified object is not a Power Spawn.
ERR_TIRED | The power creep cannot be spawned because of the cooldown.
{% endapi_return_codes %}
