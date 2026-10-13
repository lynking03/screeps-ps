# StructureExtension: part 1 of 1
Module: `Screeps.Internal.StructureExtension.Part1`
Files: `src/Screeps/Internal/StructureExtension/Part1.purs` and `src/Screeps/Internal/StructureExtension/Part1.js`
Bind ONLY these members: store

## About StructureExtension

Contains energy which can be spent on spawning bigger creeps. Extensions can be placed anywhere in the room, any spawns will be able to use them regardless of distance.

Inherits from OwnedStructure: those members are bound elsewhere.

## Members

{% api_property store 'Store' %}

```javascript
if(structure.store.getFreeCapacity(RESOURCE_ENERGY) > 0) {
    creep.transfer(structure, RESOURCE_ENERGY);
}
```

A [`Store`](#Store) object that contains cargo of this structure.
