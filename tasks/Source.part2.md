# Source: part 2 of 2
Module: `Screeps.Internal.Source.Part2`
Files: `src/Screeps/Internal/Source/Part2.purs` and `src/Screeps/Internal/Source/Part2.js`
Bind ONLY these members: ticksToRegeneration
Other parts bind the rest of Source. Do not bind anything not listed above.

## About Source

An energy source object. Can be harvested by creeps with a `WORK` body part.

Inherits from RoomObject: those members are bound elsewhere.

## Members

{% api_property ticksToRegeneration 'number' %}

The remaining time after which the source will be refilled.
