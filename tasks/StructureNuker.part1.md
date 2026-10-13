# StructureNuker: part 1 of 1
Module: `Screeps.Internal.StructureNuker.Part1`
Files: `src/Screeps/Internal/StructureNuker/Part1.purs` and `src/Screeps/Internal/StructureNuker/Part1.js`
Bind ONLY these members: cooldown, store, launchNuke

## About StructureNuker

Launches a nuke to another room dealing huge damage to the landing area. Each launch has a
cooldown and requires energy and ghodium resources. Launching creates a
[Nuke](#Nuke) object at the target room position which is visible to any player until it is landed.
Incoming nuke cannot be moved or cancelled. Nukes cannot be launched from or to novice rooms. Resources placed into a StructureNuker cannot be withdrawn.

Inherits from OwnedStructure: those members are bound elsewhere.

## Members

{% api_property cooldown 'number' %}

The amount of game ticks until the next launch is possible.

{% api_property store 'Store' %}

```javascript
if(structure.store.getFreeCapacity(RESOURCE_ENERGY) > 0) {
    creep.transfer(structure, RESOURCE_ENERGY);
}
```

A [`Store`](#Store) object that contains cargo of this structure.

{% api_method launchNuke 'pos' A %}

```javascript
nuker.launchNuke(new RoomPosition(20,30, 'W1N1'));
```

Launch a nuke to the specified position.

{% api_method_params %}
pos : RoomPosition
The target room position.
{% endapi_method_params %}

### Return value

One of the following codes:
{% api_return_codes %}
OK | The operation has been scheduled successfully.
ERR_NOT_OWNER | You are not the owner of this structure.
ERR_NOT_ENOUGH_RESOURCES | The structure does not have enough energy and/or ghodium.
ERR_INVALID_ARGS | The target is not a valid RoomPosition.
ERR_INVALID_TARGET | The nuke can't be launched to the specified RoomPosition (see [Start Areas](/start-areas.html)).
ERR_NOT_IN_RANGE | The target room is out of range.
ERR_TIRED | This structure is still cooling down.
ERR_RCL_NOT_ENOUGH | Room Controller Level insufficient to use this structure.
{% endapi_return_codes %}
