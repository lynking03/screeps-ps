# Creep: part 2 of 14
Module: `Screeps.Internal.Creep.Part2`
Files: `src/Screeps/Internal/Creep/Part2.purs` and `src/Screeps/Internal/Creep/Part2.js`
Bind ONLY these members: hitsMax, id, memory
Other parts bind the rest of Creep. Do not bind anything not listed above.

## About Creep

Creeps are your units. Creeps can move, harvest energy, construct structures, attack another creeps, and perform other actions. Each creep consists of up to 50 body parts with the following possible types:

Inherits from RoomObject: those members are bound elsewhere.

## Members

{% api_property hitsMax number %}

The maximum amount of hit points of the creep.

{% api_property id string %}

A unique object identificator. You can use Game.getObjectById method to retrieve an object instance by its id.

{% api_property memory any %}

```javascript
creep.memory.task = 'building';
```

A shorthand to Memory.creeps[creep.name]. You can use it for quick access the creep’s specific memory data object. Learn more about memory
