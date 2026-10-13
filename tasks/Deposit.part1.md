# Deposit: part 1 of 2
Module: `Screeps.Internal.Deposit.Part1`
Files: `src/Screeps/Internal/Deposit/Part1.purs` and `src/Screeps/Internal/Deposit/Part1.js`
Bind ONLY these members: cooldown, depositType, id
Other parts bind the rest of Deposit. Do not bind anything not listed above.

## About Deposit

A rare resource deposit needed for producing commodities. Can be harvested by creeps with a `WORK` body part.
Each harvest operation triggers a cooldown period, which becomes longer and longer over time.

Learn more about deposits from [this article](/resources.html).

Inherits from RoomObject: those members are bound elsewhere.

## Members

{% api_property cooldown 'number' %}

The amount of game ticks until the next harvest action is possible.

{% api_property depositType 'string' %}

The deposit type, one of the following constants:

```javascript-content
RESOURCE_MIST
RESOURCE_BIOMASS
RESOURCE_METAL
RESOURCE_SILICON
```

{% api_property id 'string' %}

A unique object identificator. You can use Game.getObjectById method to retrieve an object instance by its id.
