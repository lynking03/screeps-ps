# PowerCreep: part 4 of 12
Module: `Screeps.Internal.PowerCreep.Part4`
Files: `src/Screeps/Internal/PowerCreep/Part4.purs` and `src/Screeps/Internal/PowerCreep/Part4.js`
Bind ONLY these members: name, owner, store
Other parts bind the rest of PowerCreep. Do not bind anything not listed above.

## About PowerCreep

Power Creeps are immortal "heroes" that are tied to your account and can be respawned in any `PowerSpawn` after death.
You can upgrade their abilities ("powers") up to your account Global Power Level (see [`Game.gpl`](#Game.gpl)).

[Full list of available powers](/power.html#Powers)

Inherits from RoomObject: those members are bound elsewhere.

## Members

{% api_property name string %}
Power creep’s name. You can choose the name while creating a new power creep, and it cannot be changed later. This name is a hash key to access the creep via the Game.powerCreeps object.

{% api_property owner object %}
An object with the creep’s owner info containing the following properties:

{% api_property store 'Store' %}

```javascript
if(creep.store[RESOURCE_ENERGY] < creep.store.getCapacity()) {
    goHarvest(creep);
}
```

A [`Store`](#Store) object that contains cargo of this creep.
