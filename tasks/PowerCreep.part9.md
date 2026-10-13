# PowerCreep: part 9 of 12
Module: `Screeps.Internal.PowerCreep.Part9`
Files: `src/Screeps/Internal/PowerCreep/Part9.purs` and `src/Screeps/Internal/PowerCreep/Part9.js`
Bind ONLY these members: notifyWhenAttacked, pickup, rename
Other parts bind the rest of PowerCreep. Do not bind anything not listed above.

## About PowerCreep

Power Creeps are immortal "heroes" that are tied to your account and can be respawned in any `PowerSpawn` after death.
You can upgrade their abilities ("powers") up to your account Global Power Level (see [`Game.gpl`](#Game.gpl)).

[Full list of available powers](/power.html#Powers)

Inherits from RoomObject: those members are bound elsewhere.

## Members

{% api_method notifyWhenAttacked 'enabled' A %}

```javascript
Game.powerCreeps['PC1'].notifyWhenAttacked(true);
```

Toggle auto notification when the creep is under attack. The notification will be sent to your account email. Turned on by default.

{% api_method_params %}
enabled : boolean
Whether to enable notification or disable.
{% endapi_method_params %}

### Return value

One of the following codes:
{% api_return_codes %}
OK | The operation has been scheduled successfully.
ERR_NOT_OWNER | You are not the owner of this creep.
ERR_BUSY | The power creep is not spawned in the world.
ERR_INVALID_ARGS | enable argument is not a boolean value.
{% endapi_return_codes %}

{% api_method pickup 'target' A %}

```javascript
const target = creep.pos.findClosestByRange(FIND_DROPPED_RESOURCES);
if(target) {
    if(creep.pickup(target) == ERR_NOT_IN_RANGE) {
        creep.moveTo(target);
    }
}

```

Pick up an item (a dropped piece of energy). The target has to be at adjacent square to the creep or at the same square.

{% api_method_params %}
target : Resource
The target object to be picked up.
{% endapi_method_params %}

### Return value

One of the following codes:
{% api_return_codes %}
OK | The operation has been scheduled successfully.
ERR_NOT_OWNER | You are not the owner of this creep.
ERR_BUSY | The power creep is not spawned in the world.
ERR_INVALID_TARGET | The target is not a valid object to pick up.
ERR_FULL | The creep cannot receive any more resource.
ERR_NOT_IN_RANGE | The target is too far away.
{% endapi_return_codes %}

{% api_method rename 'name' 0 %}

```javascript
Game.powerCreeps['PC1'].rename('PC1X');
```

Rename the power creep. It must not be spawned in the world.

{% api_method_params %}
name : string
The new name of the power creep.
{% endapi_method_params %}

### Return value

One of the following codes:
{% api_return_codes %}
OK | The operation has been scheduled successfully.
ERR_NOT_OWNER | You are not the owner of the creep.
ERR_BUSY | The power creep is spawned in the world.
ERR_NAME_EXISTS | A power creep with the specified name already exists.
{% endapi_return_codes %}
