# Tombstone: part 2 of 2
Module: `Screeps.Internal.Tombstone.Part2`
Files: `src/Screeps/Internal/Tombstone/Part2.purs` and `src/Screeps/Internal/Tombstone/Part2.js`
Bind ONLY these members: store, ticksToDecay
Other parts bind the rest of Tombstone. Do not bind anything not listed above.

## About Tombstone

A remnant of dead creeps. This is a walkable object.

Inherits from RoomObject: those members are bound elsewhere.

## Members

{% api_property store 'Store' %}

A [`Store`](#Store) object that contains cargo of this structure.

{% api_property ticksToDecay 'number' %}

The amount of game ticks before this tombstone decays.
