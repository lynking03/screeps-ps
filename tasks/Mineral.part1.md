# Mineral: part 1 of 2
Module: `Screeps.Internal.Mineral.Part1`
Files: `src/Screeps/Internal/Mineral/Part1.purs` and `src/Screeps/Internal/Mineral/Part1.js`
Bind ONLY these members: density, mineralAmount, mineralType
Other parts bind the rest of Mineral. Do not bind anything not listed above.

## About Mineral

A mineral deposit. Can be harvested by creeps with a `WORK` body part using the extractor structure. 
Learn more about minerals from [this article](/resources.html).

Inherits from RoomObject: those members are bound elsewhere.

## Members

{% api_property density 'number' %}

The density that this mineral deposit will be refilled to once ticksToRegeneration reaches 0. This is one of the DENSITY_* constants.

{% api_property mineralAmount 'number' %}

The remaining amount of resources.

{% api_property mineralType 'string' %}

The resource type, one of the RESOURCE_* constants.
