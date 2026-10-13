# StructureRoad: part 1 of 1
Module: `Screeps.Internal.StructureRoad.Part1`
Files: `src/Screeps/Internal/StructureRoad/Part1.purs` and `src/Screeps/Internal/StructureRoad/Part1.js`
Bind ONLY these members: ticksToDecay

## About StructureRoad

Decreases movement cost to 1. Using roads allows creating creeps with less `MOVE` body parts. You can also build roads on top of natural terrain walls which are otherwise impassable.

Inherits from Structure: those members are bound elsewhere.

## Members

{% api_property ticksToDecay 'number' %}

The amount of game ticks when this road will lose some hit points.
