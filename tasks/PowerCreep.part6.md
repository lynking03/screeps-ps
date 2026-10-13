# PowerCreep: part 6 of 12
Module: `Screeps.Internal.PowerCreep.Part6`
Files: `src/Screeps/Internal/PowerCreep/Part6.purs` and `src/Screeps/Internal/PowerCreep/Part6.js`
Bind ONLY these members: spawnCooldownTime, ticksToLive, cancelOrder
Other parts bind the rest of PowerCreep. Do not bind anything not listed above.

## About PowerCreep

Power Creeps are immortal "heroes" that are tied to your account and can be respawned in any `PowerSpawn` after death.
You can upgrade their abilities ("powers") up to your account Global Power Level (see [`Game.gpl`](#Game.gpl)).

[Full list of available powers](/power.html#Powers)

Inherits from RoomObject: those members are bound elsewhere.

## Members

{% api_property spawnCooldownTime number %}
```javascript
if(!(Game.powerCreeps['PowerCreep1'].spawnCooldownTime > Date.now())) {
    Game.powerCreeps['PowerCreep1'].spawn(powerSpawn);
}
```
The timestamp when spawning or deleting this creep will become available.
Undefined if the power creep is spawned in the world.

{% api_property ticksToLive number %}
The remaining amount of game ticks after which the creep will die and become unspawned. Undefined if the creep
is not spawned in the world.

{% api_method cancelOrder 'methodName' 0 %}

```javascript
creep.move(LEFT);
creep.cancelOrder('move');
//The creep will not move in this game tick
```

Cancel the order given during the current game tick.

{% api_method_params %}
methodName : string
The name of a creep's method to be cancelled.
{% endapi_method_params %}

### Return value

One of the following codes:
{% api_return_codes %}
OK | The operation has been cancelled successfully.
ERR_NOT_OWNER | You are not the owner of the creep.
ERR_BUSY | The power creep is not spawned in the world.
ERR_NOT_FOUND | The order with the specified name is not found.
{% endapi_return_codes %}
