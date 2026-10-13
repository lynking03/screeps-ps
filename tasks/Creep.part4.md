# Creep: part 4 of 14
Module: `Screeps.Internal.Creep.Part4`
Files: `src/Screeps/Internal/Creep/Part4.purs` and `src/Screeps/Internal/Creep/Part4.js`
Bind ONLY these members: saying, spawning, store
Other parts bind the rest of Creep. Do not bind anything not listed above.

## About Creep

Creeps are your units. Creeps can move, harvest energy, construct structures, attack another creeps, and perform other actions. Each creep consists of up to 50 body parts with the following possible types:

Inherits from RoomObject: those members are bound elsewhere.

## Members

{% api_property saying string %}

The text message that the creep was saying at the last tick.

{% api_property spawning boolean %}

Whether this creep is still being spawned.

{% api_property store 'Store' %}

```javascript
if(creep.store[RESOURCE_ENERGY] < creep.store.getCapacity()) {
    goHarvest(creep);
}
```

A [`Store`](#Store) object that contains cargo of this creep.
