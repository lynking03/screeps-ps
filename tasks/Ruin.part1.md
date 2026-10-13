# Ruin: part 1 of 2
Module: `Screeps.Internal.Ruin.Part1`
Files: `src/Screeps/Internal/Ruin/Part1.purs` and `src/Screeps/Internal/Ruin/Part1.js`
Bind ONLY these members: destroyTime, id, store
Other parts bind the rest of Ruin. Do not bind anything not listed above.

## About Ruin

A destroyed structure. This is a walkable object.

Inherits from RoomObject: those members are bound elsewhere.

## Members

{% api_property destroyTime 'number' %}

The time when the structure has been destroyed.

{% api_property id string %}

A unique object identificator. You can use Game.getObjectById method to retrieve an object instance by its id.

{% api_property store 'Store' %}

A [`Store`](#Store) object that contains resources of this structure.
