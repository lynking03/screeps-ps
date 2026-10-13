# PowerCreep: part 7 of 12
Module: `Screeps.Internal.PowerCreep.Part7`
Files: `src/Screeps/Internal/PowerCreep/Part7.purs` and `src/Screeps/Internal/PowerCreep/Part7.js`
Bind ONLY these members: delete, drop, enableRoom
Other parts bind the rest of PowerCreep. Do not bind anything not listed above.

## About PowerCreep

Power Creeps are immortal "heroes" that are tied to your account and can be respawned in any `PowerSpawn` after death.
You can upgrade their abilities ("powers") up to your account Global Power Level (see [`Game.gpl`](#Game.gpl)).

[Full list of available powers](/power.html#Powers)

Inherits from RoomObject: those members are bound elsewhere.

## Members

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

{% api_method drop 'resourceType, [amount]' A %}

```javascript
creep.drop(RESOURCE_ENERGY);
```

```javascript
// drop all resources
for(const resourceType in creep.carry) {
	creep.drop(resourceType);
}
```

Drop this resource on the ground.

{% api_method_params %}
resourceType : string
One of the RESOURCE_* constants.
===
amount (optional) : number
The amount of resource units to be dropped. If omitted, all the available carried amount is used.
{% endapi_method_params %}

### Return value

One of the following codes:
{% api_return_codes %}
OK | The operation has been scheduled successfully.
ERR_NOT_OWNER | You are not the owner of this creep.
ERR_BUSY | The power creep is not spawned in the world.
ERR_INVALID_ARGS | The resourceType is not a valid RESOURCE_* constants.
ERR_NOT_ENOUGH_RESOURCES | The creep does not have the given amount of energy.
{% endapi_return_codes %}

```javascript
Game.powerCreeps['PowerCreep1'].usePower(PWR_GENERATE_OPS);
```

{% api_method enableRoom 'controller' A %}

```javascript
powerCreep.enableRoom(powerCreep.room.controller);
```

Enable powers usage in this room. The room controller should be at adjacent tile.

{% api_method_params %}
controller : StructureController
The room controller.
{% endapi_method_params %}

### Return value

One of the following codes:
{% api_return_codes %}
OK | The operation has been scheduled successfully.
ERR_NOT_OWNER | You are not the owner of this creep.
ERR_INVALID_TARGET | The target is not a controller structure.
ERR_NOT_IN_RANGE | The target is too far away.
{% endapi_return_codes %}
