# PowerCreep: part 3 of 12
Module: `Screeps.Internal.PowerCreep.Part3`
Files: `src/Screeps/Internal/PowerCreep/Part3.purs` and `src/Screeps/Internal/PowerCreep/Part3.js`
Bind ONLY these members: level, memory, my
Other parts bind the rest of PowerCreep. Do not bind anything not listed above.

## About PowerCreep

Power Creeps are immortal "heroes" that are tied to your account and can be respawned in any `PowerSpawn` after death.
You can upgrade their abilities ("powers") up to your account Global Power Level (see [`Game.gpl`](#Game.gpl)).

[Full list of available powers](/power.html#Powers)

Inherits from RoomObject: those members are bound elsewhere.

## Members

{% api_property level number %}
The power creep's level.

{% api_property memory any %}

```javascript
creep.memory.task = 'building';
```

A shorthand to Memory.powerCreeps[creep.name]. You can use it for quick access the creep’s specific memory data object. Learn more about memory

{% api_property my boolean %}
Whether it is your creep or foe.
