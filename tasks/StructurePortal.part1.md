# StructurePortal: part 1 of 1
Module: `Screeps.Internal.StructurePortal.Part1`
Files: `src/Screeps/Internal/StructurePortal/Part1.purs` and `src/Screeps/Internal/StructurePortal/Part1.js`
Bind ONLY these members: destination, ticksToDecay

## About StructurePortal

A non-player structure. Instantly teleports your creeps to a distant room acting as a room exit tile.
Portals appear randomly in the central room of each sector.

Inherits from Structure: those members are bound elsewhere.

## Members

{% api_property destination 'RoomPosition | object' %}

If this is an **inter-room** portal, then this property contains a `RoomPosition` object
leading to the point in the destination room.

If this is an **inter-shard** portal, then this property contains an object with `shard` and `room` string properties.
Exact coordinates are undetermined, the creep will appear at any free spot in the destination room.

{% api_property ticksToDecay 'number' %}

The amount of game ticks when the portal disappears, or undefined when the portal is stable.
