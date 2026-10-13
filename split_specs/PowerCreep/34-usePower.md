{% api_method usePower 'power, [target]' A %}

```javascript
Game.powerCreeps['PowerCreep1'].usePower(PWR_GENERATE_OPS);
```

```javascript
Game.powerCreeps['PowerCreep1'].usePower(PWR_OPERATE_SPAWN, Game.spawns['Spawn1']);
```

Apply one the creep's powers on the specified target.
You can only use powers in rooms either without a controller, or with a [power-enabled](#PowerCreep.enableRoom) controller.
Only one power can be used during the same tick, each `usePower` call will override the previous one.
If the target has the same effect of a lower or equal level, it is overridden. If the existing effect level is higher, an error is returned.

[Full list of available powers](/power.html#Powers)

{% api_method_params %}
power : number
The power ability to use, one of the `PWR_*` constants.
===
target (optional) : RoomObject
A target object in the room.
{% endapi_method_params %}

### Return value

One of the following codes:
{% api_return_codes %}
OK | The operation has been scheduled successfully.
ERR_NOT_OWNER | You are not the owner of the creep.
ERR_BUSY | The creep is not spawned in the world.
ERR_NO_BODYPART | The creep doesn't have the specified power ability.
ERR_TIRED | The power ability is still on cooldown.
ERR_NOT_ENOUGH_RESOURCES | The creep doesn't have enough resources to use the power.
ERR_INVALID_TARGET | The specified target is not valid.
ERR_NOT_IN_RANGE | The specified target is too far away.
ERR_INVALID_ARGS | Using powers is not enabled on the Room Controller.
ERR_FULL | The target has the same active effect of a higher level.
{% endapi_return_codes %}
