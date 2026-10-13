# StructureTower: part 1 of 2
Module: `Screeps.Internal.StructureTower.Part1`
Files: `src/Screeps/Internal/StructureTower/Part1.purs` and `src/Screeps/Internal/StructureTower/Part1.js`
Bind ONLY these members: store, attack, heal
Other parts bind the rest of StructureTower. Do not bind anything not listed above.

## About StructureTower

Remotely attacks or heals creeps, or repairs structures. Can be targeted to any object in
the room. However, its effectiveness linearly depends on the distance. Each action consumes energy.

Inherits from OwnedStructure: those members are bound elsewhere.

## Members

{% api_property store 'Store' %}

```javascript
if(structure.store.getFreeCapacity(RESOURCE_ENERGY) > 0) {
    creep.transfer(structure, RESOURCE_ENERGY);
}
```

A [`Store`](#Store) object that contains cargo of this structure.

{% api_method attack 'target' A %}

Remotely attack any creep, power creep or structure in the room.

{% api_method_params %}
target : Creep, PowerCreep, Structure
The target object.
{% endapi_method_params %}

### Return value

One of the following codes:
{% api_return_codes %}
OK | The operation has been scheduled successfully.
ERR_NOT_OWNER | You are not the owner of this structure.
ERR_NOT_ENOUGH_ENERGY | The tower does not have enough energy.
ERR_INVALID_TARGET | The target is not a valid attackable object.
ERR_RCL_NOT_ENOUGH | Room Controller Level insufficient to use this structure.
{% endapi_return_codes %}

{% api_method heal 'target' A %}

Remotely heal any creep or power creep in the room.

{% api_method_params %}
target : Creep, PowerCreep
The target object.
{% endapi_method_params %}

### Return value

One of the following codes:
{% api_return_codes %}
OK | The operation has been scheduled successfully.
ERR_NOT_OWNER | You are not the owner of this structure.
ERR_NOT_ENOUGH_ENERGY | The tower does not have enough energy.
ERR_INVALID_TARGET | The target is not a valid creep object.
ERR_RCL_NOT_ENOUGH | Room Controller Level insufficient to use this structure.
{% endapi_return_codes %}
