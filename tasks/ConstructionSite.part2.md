# ConstructionSite: part 2 of 3
Module: `Screeps.Internal.ConstructionSite.Part2`
Files: `src/Screeps/Internal/ConstructionSite/Part2.purs` and `src/Screeps/Internal/ConstructionSite/Part2.js`
Bind ONLY these members: progress, progressTotal, structureType
Other parts bind the rest of ConstructionSite. Do not bind anything not listed above.

## About ConstructionSite

A site of a structure which is currently under construction. A construction site can be created using the 'Construct' button at the left of the game field or the [`Room.createConstructionSite`](#Room.createConstructionSite) method.

To build a structure on the construction site, give a worker creep some amount of energy and perform [`Creep.build`](#Creep.build) action.

You can remove enemy construction sites by moving a creep on it.

Inherits from RoomObject: those members are bound elsewhere.

## Members

{% api_property progress number %}

The current construction progress.

{% api_property progressTotal number %}

The total construction progress needed for the structure to be built.

{% api_property structureType string %}

One of the STRUCTURE_* constants.
