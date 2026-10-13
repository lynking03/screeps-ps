# PowerCreep: part 1 of 12
Module: `Screeps.Internal.PowerCreep.Part1`
Files: `src/Screeps/Internal/PowerCreep/Part1.purs` and `src/Screeps/Internal/PowerCreep/Part1.js`
Bind ONLY these members: PowerCreep.create, className, deleteTime
Other parts bind the rest of PowerCreep. Do not bind anything not listed above.

## About PowerCreep

Power Creeps are immortal "heroes" that are tied to your account and can be respawned in any `PowerSpawn` after death.
You can upgrade their abilities ("powers") up to your account Global Power Level (see [`Game.gpl`](#Game.gpl)).

[Full list of available powers](/power.html#Powers)

Inherits from RoomObject: those members are bound elsewhere.

## Members

{% api_method PowerCreep.create 'name, className' 1 %}

```javascript
PowerCreep.create('PowerCreep1', POWER_CLASS.OPERATOR);
```

A static method to create new Power Creep instance in your account. It will be added in an unspawned state,
use [`spawn`](#PowerCreep.spawn) method to spawn it in the world.

You need one free Power Level in your account to perform this action.

{% api_method_params %}
name : string
The name of the new power creep. The name length limit is 100 characters.
===
className : string
The class of the new power creep, one of the `POWER_CLASS` constants.
{% endapi_method_params %}

### Return value

One of the following codes:
{% api_return_codes %}
OK | The operation has been scheduled successfully.
ERR_NOT_ENOUGH_RESOURCES | You don't have free Power Levels in your account.
ERR_INVALID_ARGS | The provided power creep name is exceeds the limit, or the power creep class is invalid.
ERR_NAME_EXISTS | A power creep with the specified name already exists.
{% endapi_return_codes %}

{% api_property className string %}
The power creep's class, one of the `POWER_CLASS` constants.

{% api_property deleteTime number %}
A timestamp when this creep is marked to be permanently deleted from the account, or undefined otherwise.
