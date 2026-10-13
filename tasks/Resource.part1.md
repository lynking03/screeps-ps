# Resource: part 1 of 1
Module: `Screeps.Internal.Resource.Part1`
Files: `src/Screeps/Internal/Resource/Part1.purs` and `src/Screeps/Internal/Resource/Part1.js`
Bind ONLY these members: amount, id, resourceType

## About Resource

A dropped piece of resource. It will decay after a while if not picked up.
Dropped resource pile decays for `ceil(amount/1000)` units per tick.

Inherits from RoomObject: those members are bound elsewhere.

## Members

{% api_property amount 'number' %}

The amount of resource units containing.

{% api_property id 'string' %}

A unique object identificator. You can use Game.getObjectById method to retrieve an object instance by its id.

{% api_property resourceType 'string' %}

One of the RESOURCE_* constants.
