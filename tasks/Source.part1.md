# Source: part 1 of 2
Module: `Screeps.Internal.Source.Part1`
Files: `src/Screeps/Internal/Source/Part1.purs` and `src/Screeps/Internal/Source/Part1.js`
Bind ONLY these members: energy, energyCapacity, id
Other parts bind the rest of Source. Do not bind anything not listed above.

## About Source

An energy source object. Can be harvested by creeps with a `WORK` body part.

Inherits from RoomObject: those members are bound elsewhere.

## Members

{% api_property energy 'number' %}

The remaining amount of energy.

{% api_property energyCapacity 'number' %}

The total amount of energy in the source.

{% api_property id 'string' %}

A unique object identificator. You can use Game.getObjectById method to retrieve an object instance by its id.
