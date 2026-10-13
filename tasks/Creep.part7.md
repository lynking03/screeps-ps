# Creep: part 7 of 14
Module: `Screeps.Internal.Creep.Part7`
Files: `src/Screeps/Internal/Creep/Part7.purs` and `src/Screeps/Internal/Creep/Part7.js`
Bind ONLY these members: dismantle, drop, generateSafeMode
Other parts bind the rest of Creep. Do not bind anything not listed above.

## About Creep

Creeps are your units. Creeps can move, harvest energy, construct structures, attack another creeps, and perform other actions. Each creep consists of up to 50 body parts with the following possible types:

Inherits from RoomObject: those members are bound elsewhere.

## Members

{% api_method dismantle 'target' A %}

```javascript
const target = creep.pos.findClosestByRange(FIND_STRUCTURES,
	{filter: {structureType: STRUCTURE_WALL}});
if(target) {
    if(creep.dismantle(target) == ERR_NOT_IN_RANGE) {
        creep.moveTo(target);
    }
}

```

Dismantles any structure that can be constructed (even hostile) returning 50% of the energy spent on its repair. Requires the WORK body part. If the creep has an empty CARRY body part, the energy is put into it; otherwise it is dropped on the ground. The target has to be at adjacent square to the creep.

{% api_method_params %}
target : Structure
The target structure.
{% endapi_method_params %}

### Return value

One of the following codes:
{% api_return_codes %}
OK | The operation has been scheduled successfully.
ERR_NOT_OWNER | You are not the owner of this creep.
ERR_BUSY | The creep is still being spawned.
ERR_INVALID_TARGET | The target is not a valid structure object.
ERR_NOT_IN_RANGE | The target is too far away.
ERR_NO_BODYPART | There are no WORK body parts in this creep’s body.
{% endapi_return_codes %}

{% api_method drop 'resourceType, [amount]' A %}

```javascript
creep.drop(RESOURCE_ENERGY);
```

```javascript
// drop all resources
for(const resourceType in creep.carry) {
	creep.drop(resourceType);
}
```

Drop this resource on the ground.

{% api_method_params %}
resourceType : string
One of the RESOURCE_* constants.
===
amount (optional) : number
The amount of resource units to be dropped. If omitted, all the available carried amount is used.
{% endapi_method_params %}

### Return value

One of the following codes:
{% api_return_codes %}
OK | The operation has been scheduled successfully.
ERR_NOT_OWNER | You are not the owner of this creep.
ERR_BUSY | The creep is still being spawned.
ERR_INVALID_ARGS | The resourceType is not a valid RESOURCE_* constants.
ERR_NOT_ENOUGH_RESOURCES | The creep does not have the given amount of resources.
{% endapi_return_codes %}

{% api_method generateSafeMode 'target' A %}

```javascript
if(creep.generateSafeMode(creep.room.controller) == ERR_NOT_IN_RANGE) {
    creep.moveTo(creep.room.controller);
}

```

Add one more available safe mode activation to a room controller. The creep has to be at adjacent square to the target room controller and have 1000 ghodium resource.

{% api_method_params %}
target : StructureController
The target room controller.
{% endapi_method_params %}

### Return value

One of the following codes:
{% api_return_codes %}
OK | The operation has been scheduled successfully.
ERR_NOT_OWNER | You are not the owner of this creep.
ERR_BUSY | The creep is still being spawned.
ERR_NOT_ENOUGH_RESOURCES | The creep does not have enough ghodium.
ERR_INVALID_TARGET | The target is not a valid controller object.
ERR_NOT_IN_RANGE | The target is too far away.
{% endapi_return_codes %}
