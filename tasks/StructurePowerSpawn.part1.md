# StructurePowerSpawn: part 1 of 1
Module: `Screeps.Internal.StructurePowerSpawn.Part1`
Files: `src/Screeps/Internal/StructurePowerSpawn/Part1.purs` and `src/Screeps/Internal/StructurePowerSpawn/Part1.js`
Bind ONLY these members: store, processPower

## About StructurePowerSpawn

Processes power into your account, and spawns power creeps with special unique powers (in development).
Learn more about power from [this article](/power.html).

Inherits from OwnedStructure: those members are bound elsewhere.

## Members

{% api_property store 'Store' %}

```javascript
if(structure.store.getFreeCapacity(RESOURCE_ENERGY) > 0) {
    creep.transfer(structure, RESOURCE_ENERGY);
}
```

A [`Store`](#Store) object that contains cargo of this structure.

{% api_method processPower '' A %}

Register power resource units into your account. Registered power allows to develop power creeps skills. 

### Return value

One of the following codes:
{% api_return_codes %}
OK | The operation has been scheduled successfully.
ERR_NOT_OWNER | You are not the owner of this structure.
ERR_NOT_ENOUGH_RESOURCES | The structure does not have enough energy or power resource units.
ERR_RCL_NOT_ENOUGH | Room Controller Level insufficient to use this structure.
{% endapi_return_codes %}
