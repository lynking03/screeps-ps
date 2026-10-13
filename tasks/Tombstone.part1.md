# Tombstone: part 1 of 2
Module: `Screeps.Internal.Tombstone.Part1`
Files: `src/Screeps/Internal/Tombstone/Part1.purs` and `src/Screeps/Internal/Tombstone/Part1.js`
Bind ONLY these members: creep, deathTime, id
Other parts bind the rest of Tombstone. Do not bind anything not listed above.

## About Tombstone

A remnant of dead creeps. This is a walkable object.

Inherits from RoomObject: those members are bound elsewhere.

## Members

{% api_property creep 'Creep | PowerCreep' %}

```javascript
room.find(FIND_TOMBSTONES).forEach(tombstone => {
    if(tombstone.creep.my) {
        console.log(`My creep died with ID=${tombstone.creep.id} ` +
             `and role=${Memory.creeps[tombstone.creep.name].role}`);   
    }    
});
```
```javascript
room.find(FIND_TOMBSTONES).forEach(tombstone => {
    if(tombstone.creep instanceof PowerCreep) {
        console.log(`Power creep died here`);   
    }    
});
````

An object containing the deceased creep or power creep.

{% api_property deathTime 'number' %}

Time of death.

{% api_property id string %}

A unique object identificator. You can use Game.getObjectById method to retrieve an object instance by its id.
