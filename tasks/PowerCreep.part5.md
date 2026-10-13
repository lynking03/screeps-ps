# PowerCreep: part 5 of 12
Module: `Screeps.Internal.PowerCreep.Part5`
Files: `src/Screeps/Internal/PowerCreep/Part5.purs` and `src/Screeps/Internal/PowerCreep/Part5.js`
Bind ONLY these members: powers, saying, shard
Other parts bind the rest of PowerCreep. Do not bind anything not listed above.

## About PowerCreep

Power Creeps are immortal "heroes" that are tied to your account and can be respawned in any `PowerSpawn` after death.
You can upgrade their abilities ("powers") up to your account Global Power Level (see [`Game.gpl`](#Game.gpl)).

[Full list of available powers](/power.html#Powers)

Inherits from RoomObject: those members are bound elsewhere.

## Members

{% api_property powers object %}
Available powers, an object with power ID as a key, and the following properties:

{% api_method_params %}
level : number
Current level of the power.
===
cooldown : number
Cooldown ticks remaining, or undefined if the power creep is not spawned in the world.
{% endapi_method_params %}

{% api_property saying string %}
The text message that the creep was saying at the last tick.

{% api_property shard string %}
The name of the shard where the power creep is spawned, or undefined.
