# StructureLink: part 1 of 1
Module: `Screeps.Internal.StructureLink.Part1`
Files: `src/Screeps/Internal/StructureLink/Part1.purs` and `src/Screeps/Internal/StructureLink/Part1.js`
Bind ONLY these members: cooldown, store, transferEnergy

## About StructureLink

Remotely transfers energy to another Link in the same room.

Inherits from OwnedStructure: those members are bound elsewhere.

## Members

{% api_property cooldown 'number' %}

The amount of game ticks the link has to wait until the next transfer is possible.

{% api_property store 'Store' %}

```javascript
if(structure.store.getFreeCapacity(RESOURCE_ENERGY) > 0) {
    creep.transfer(structure, RESOURCE_ENERGY);
}
```

A [`Store`](#Store) object that contains cargo of this structure.

{% api_method transferEnergy 'target, [amount]' A %}

```javascript
const linkFrom = Game.rooms['W1N1'].lookForAt('structure', 10, 25)[0];

const linkTo = linkFrom.pos.findInRange(FIND_MY_STRUCTURES, 2,
    {filter: {structureType: STRUCTURE_LINK}})[0];

linkFrom.transferEnergy(linkTo);
```

Remotely transfer energy to another link at any location in the same room.

{% api_method_params %}
target : StructureLink
The target object.
===
amount (optional) : number
The amount of energy to be transferred. If omitted, all the available energy is used.
{% endapi_method_params %}

### Return value

One of the following codes:
{% api_return_codes %}
OK | The operation has been scheduled successfully.
ERR_NOT_OWNER | You are not the owner of this link.
ERR_NOT_ENOUGH_RESOURCES | The structure does not have the given amount of energy.
ERR_INVALID_TARGET | The target is not a valid StructureLink object.
ERR_FULL | The target cannot receive any more energy.
ERR_INVALID_ARGS | The energy amount is incorrect.
ERR_TIRED | The link is still cooling down.
ERR_RCL_NOT_ENOUGH | Room Controller Level insufficient to use this link.
ERR_NOT_IN_RANGE | The target is too far away.
{% endapi_return_codes %}
