# StructureSpawn.Spawning: part 1 of 3
Module: `Screeps.Internal.StructureSpawn.Spawning.Part1`
Files: `src/Screeps/Internal/StructureSpawn/Spawning/Part1.purs` and `src/Screeps/Internal/StructureSpawn/Spawning/Part1.js`
Bind ONLY these members: directions, name, needTime
Other parts bind the rest of StructureSpawn.Spawning. Do not bind anything not listed above.

## About StructureSpawn.Spawning

Details of the creep being spawned currently that can be addressed by the [`StructureSpawn.spawning`](#StructureSpawn.spawning) property.

## Members

{% api_property directions 'array' %}

An array with the spawn directions, see [`StructureSpawn.Spawning.setDirections`](#StructureSpawn.Spawning.setDirections).

{% api_property name 'string' %}

The name of a new creep.

{% api_property needTime 'number' %}

Time needed in total to complete the spawning.
