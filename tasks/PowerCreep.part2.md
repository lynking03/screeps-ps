# PowerCreep: part 2 of 12
Module: `Screeps.Internal.PowerCreep.Part2`
Files: `src/Screeps/Internal/PowerCreep/Part2.purs` and `src/Screeps/Internal/PowerCreep/Part2.js`
Bind ONLY these members: hits, hitsMax, id
Other parts bind the rest of PowerCreep. Do not bind anything not listed above.

## About PowerCreep

Power Creeps are immortal "heroes" that are tied to your account and can be respawned in any `PowerSpawn` after death.
You can upgrade their abilities ("powers") up to your account Global Power Level (see [`Game.gpl`](#Game.gpl)).

[Full list of available powers](/power.html#Powers)

Inherits from RoomObject: those members are bound elsewhere.

## Members

{% api_property hits number %}
The current amount of hit points of the creep.

{% api_property hitsMax number %}
The maximum amount of hit points of the creep.

{% api_property id string %}
A unique object identificator. You can use Game.getObjectById method to retrieve an object instance by its id.
