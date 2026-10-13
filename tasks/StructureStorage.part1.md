# StructureStorage: part 1 of 1
Module: `Screeps.Internal.StructureStorage.Part1`
Files: `src/Screeps/Internal/StructureStorage/Part1.purs` and `src/Screeps/Internal/StructureStorage/Part1.js`
Bind ONLY these members: store

## About StructureStorage

A structure that can store huge amount of resource units. Only one structure per room is allowed 
that can be addressed by [`Room.storage`](#Room.storage) property.

Inherits from OwnedStructure: those members are bound elsewhere.

## Members

{% api_property store 'Store' %}

A [`Store`](#Store) object that contains cargo of this structure.
