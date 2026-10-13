# Ruin: part 2 of 2
Module: `Screeps.Internal.Ruin.Part2`
Files: `src/Screeps/Internal/Ruin/Part2.purs` and `src/Screeps/Internal/Ruin/Part2.js`
Bind ONLY these members: structure, ticksToDecay
Other parts bind the rest of Ruin. Do not bind anything not listed above.

## About Ruin

A destroyed structure. This is a walkable object.

Inherits from RoomObject: those members are bound elsewhere.

## Members

{% api_property structure 'Structure | OwnedStructure' %}

An object containing basic data of the destroyed structure.

{% api_property ticksToDecay 'number' %}

The amount of game ticks before this ruin decays.
