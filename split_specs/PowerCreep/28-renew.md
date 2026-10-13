{% api_method renew 'target' A %}

```javascript
let powerBank = Game.getObjectById('XXX');
Game.powerCreeps['PowerCreep1'].renew(powerBank);

```

Instantly restore time to live to the maximum using a Power Spawn or a Power Bank nearby. It has to be at adjacent tile.

{% api_method_params %}
target : StructurePowerBank | StructurePowerSpawn
The target structure.
{% endapi_method_params %}

### Return value

One of the following codes:
{% api_return_codes %}
OK | The operation has been scheduled successfully.
ERR_NOT_OWNER | You are not the owner of this creep.
ERR_BUSY | The power creep is not spawned in the world.
ERR_INVALID_TARGET | The target is not a valid power bank object.
ERR_NOT_IN_RANGE | The target is too far away.
{% endapi_return_codes %}
