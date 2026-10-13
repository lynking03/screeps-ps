{% api_method find 'type, [opts]' 2 %}

```javascript
const targets = creep.room.find(FIND_DROPPED_RESOURCES);
if(targets.length) {
    creep.moveTo(targets[0]);
    creep.pickup(targets[0]);
}
```

```javascript
const extensions = Game.spawns['Spawn1'].room.find(FIND_MY_STRUCTURES, {
    filter: { structureType: STRUCTURE_EXTENSION }
});
console.log('Spawn has '+extensions.length+' extensions available');
```

```javascript
const targets = creep.room.find(FIND_HOSTILE_CREEPS, {
    filter: function(object) {
        return object.getActiveBodyparts(ATTACK) == 0;
    }
});
```

Find all objects of the specified type in the room. Results are cached automatically for the specified room and type before applying any custom filters. This automatic cache lasts until the end of the tick.

{% api_method_params %}
type : number
One of the FIND_* constants.
===
opts (optional) : object
An object with additional options:

- filter : object, function, string — The result list will be filtered using the Lodash.filter method.

{% endapi_method_params %}

### Return value

An array with the objects found.

constant|type|description
| --- | --- | --- |
`FIND_EXIT_TOP` | RoomPosition | Only exit positions located at the top of the room.
`FIND_EXIT_RIGHT` | RoomPosition | Only exit positions located on the right side of the room.
`FIND_EXIT_BOTTOM` | RoomPosition | Only exit positions located at the bottom of the room.
`FIND_EXIT_LEFT` | RoomPosition | Only exit positions located on the left side of the room.
`FIND_EXIT` | RoomPosition | All exit positions.
`FIND_CREEPS` | Creep | All creeps.
`FIND_MY_CREEPS` | Creep | Only creeps owned by you.
`FIND_HOSTILE_CREEPS` | Creep | Only creeps not owned by you.
`FIND_POWER_CREEPS` | PowerCreep | All power creeps.
`FIND_MY_POWER_CREEPS` | PowerCreep | Only power creeps owned by you.
`FIND_HOSTILE_POWER_CREEPS` | PowerCreep | Only power creeps not owned by you.
`FIND_SOURCES_ACTIVE` | Source | Only sources that have energy.
`FIND_SOURCES` | Source | All sources.
`FIND_DROPPED_RESOURCES` | Resource | All dropped resources.
`FIND_STRUCTURES` | Structure | All structures.
`FIND_MY_STRUCTURES` | Structure | Only structures owned by you. Does not include neutral structures.
`FIND_HOSTILE_STRUCTURES` | Structure | Only structures not owned by you. Does not include neutral structures.
`FIND_FLAGS` | Flag | All flags
`FIND_MY_SPAWNS` | StructureSpawn | Only spawns owned by you.
`FIND_HOSTILE_SPAWNS` | StructureSpawn | Spawns not owned by you.
`FIND_CONSTRUCTION_SITES` | ConstructionSite | All construction sites.
`FIND_MY_CONSTRUCTION_SITES` | ConstructionSite | Only construction sites owned by you.
`FIND_HOSTILE_CONSTRUCTION_SITES` | ConstructionSite | Only construction sites not owned by you.
`FIND_MINERALS` | Mineral | All mineral deposits.
`FIND_NUKES` | Nuke | All launched nukes.
`FIND_TOMBSTONES` | Tombstone | All tombstones.
`FIND_RUINS` | Ruin | All ruins
