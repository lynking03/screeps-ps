# StructureSpawn: part 1 of 3
Module: `Screeps.Internal.StructureSpawn.Part1`
Files: `src/Screeps/Internal/StructureSpawn/Part1.purs` and `src/Screeps/Internal/StructureSpawn/Part1.js`
Bind ONLY these members: memory, name, spawning
Other parts bind the rest of StructureSpawn. Do not bind anything not listed above.

## About StructureSpawn

Spawn is your colony center. This structure can create, renew, and recycle creeps.
All your spawns are accessible through [`Game.spawns`](#Game.spawns) hash list. 
Spawns auto-regenerate a little amount of energy each tick, so that you can easily
recover even if all your creeps died.

Inherits from OwnedStructure: those members are bound elsewhere.

## Members

{% api_property memory 'any' %}

```javascript
spawn.memory.queue = [];
```

A shorthand to Memory.spawns[spawn.name]. You can use it for quick access the spawn’s specific memory data object. Learn more about memory

{% api_property name 'string' %}

Spawn’s name. You choose the name upon creating a new spawn, and it cannot be changed later. This name is a hash key to access the spawn via the Game.spawns object.

{% api_property spawning 'StructureSpawn.Spawning' %}

If the spawn is in process of spawning a new creep, this object will contain a [`StructureSpawn.Spawning`](#StructureSpawn-Spawning) object, or null otherwise.
