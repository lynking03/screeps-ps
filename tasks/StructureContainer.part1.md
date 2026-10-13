# StructureContainer: part 1 of 1
Module: `Screeps.Internal.StructureContainer.Part1`
Files: `src/Screeps/Internal/StructureContainer/Part1.purs` and `src/Screeps/Internal/StructureContainer/Part1.js`
Bind ONLY these members: store, ticksToDecay

## About StructureContainer

A small container that can be used to store resources. This is a walkable structure. All dropped resources automatically goes to the container at the same tile.

Inherits from Structure: those members are bound elsewhere.

## Members

{% api_property store 'Store' %}

```javascript
const containersWithEnergy = room.find(FIND_STRUCTURES, {
    filter: (i) => i.structureType == STRUCTURE_CONTAINER &&
                   i.store[RESOURCE_ENERGY] > 0
});
```

A [`Store`](#Store) object that contains cargo of this structure.

{% api_property ticksToDecay 'number' %}

The amount of game ticks when this container will lose some hit points.
