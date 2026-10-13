# Mineral: part 2 of 2
Module: `Screeps.Internal.Mineral.Part2`
Files: `src/Screeps/Internal/Mineral/Part2.purs` and `src/Screeps/Internal/Mineral/Part2.js`
Bind ONLY these members: id, ticksToRegeneration
Other parts bind the rest of Mineral. Do not bind anything not listed above.

## About Mineral

A mineral deposit. Can be harvested by creeps with a `WORK` body part using the extractor structure. 
Learn more about minerals from [this article](/resources.html).

Inherits from RoomObject: those members are bound elsewhere.

## Members

{% api_property id 'string' %}

A unique object identificator. You can use Game.getObjectById method to retrieve an object instance by its id.

{% api_property ticksToRegeneration 'number' %}

The remaining time after which the deposit will be refilled.
