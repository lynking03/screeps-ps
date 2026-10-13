# StructurePowerBank: part 1 of 1
Module: `Screeps.Internal.StructurePowerBank.Part1`
Files: `src/Screeps/Internal/StructurePowerBank/Part1.purs` and `src/Screeps/Internal/StructurePowerBank/Part1.js`
Bind ONLY these members: power, ticksToDecay

## About StructurePowerBank

Non-player structure. Contains power resource which can be obtained by destroying the structure.
Hits the attacker creep back on each attack. Learn more about power
from [this article](/power.html).

Inherits from OwnedStructure: those members are bound elsewhere.

## Members

{% api_property power 'number' %}

The amount of power containing.

{% api_property ticksToDecay 'number' %}

The amount of game ticks when this structure will disappear.
