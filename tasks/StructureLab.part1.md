# StructureLab: part 1 of 3
Module: `Screeps.Internal.StructureLab.Part1`
Files: `src/Screeps/Internal/StructureLab/Part1.purs` and `src/Screeps/Internal/StructureLab/Part1.js`
Bind ONLY these members: cooldown, mineralType, store
Other parts bind the rest of StructureLab. Do not bind anything not listed above.

## About StructureLab

Produces mineral compounds from base minerals, boosts and unboosts creeps.
Learn more about minerals from [this article](/resources.html).

Inherits from OwnedStructure: those members are bound elsewhere.

## Members

{% api_property cooldown 'number' %}

The amount of game ticks the lab has to wait until the next reaction or unboost operation is possible.

{% api_property mineralType 'string' %}

The type of minerals containing in the lab. Labs can contain only one mineral type at the same time.

{% api_property store 'Store' %}

```javascript
if(structure.store.getFreeCapacity(RESOURCE_ENERGY) > 0) {
    creep.transfer(structure, RESOURCE_ENERGY);
}
```

A [`Store`](#Store) object that contains cargo of this structure.
