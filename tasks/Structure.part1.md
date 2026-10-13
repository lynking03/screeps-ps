# Structure: part 1 of 3
Module: `Screeps.Internal.Structure.Part1`
Files: `src/Screeps/Internal/Structure/Part1.purs` and `src/Screeps/Internal/Structure/Part1.js`
Bind ONLY these members: hits, hitsMax, id
Other parts bind the rest of Structure. Do not bind anything not listed above.

## About Structure

The base prototype object of all structures.

Inherits from RoomObject: those members are bound elsewhere.

## Members

{% api_property hits 'number' %}

The current amount of hit points of the structure.

{% api_property hitsMax 'number' %}

The total amount of hit points of the structure.

{% api_property id 'string' %}

A unique object identificator. You can use Game.getObjectById method to retrieve an object instance by its id.
