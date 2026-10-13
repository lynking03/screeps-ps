# Creep: part 8 of 14
Module: `Screeps.Internal.Creep.Part8`
Files: `src/Screeps/Internal/Creep/Part8.purs` and `src/Screeps/Internal/Creep/Part8.js`
Bind ONLY these members: getActiveBodyparts, harvest, heal
Other parts bind the rest of Creep. Do not bind anything not listed above.

## About Creep

Creeps are your units. Creeps can move, harvest energy, construct structures, attack another creeps, and perform other actions. Each creep consists of up to 50 body parts with the following possible types:

Inherits from RoomObject: those members are bound elsewhere.

## Members

{% api_method getActiveBodyparts 'type' 0 %}

```javascript
const target = creep.pos.findClosestByRange(FIND_HOSTILE_CREEPS, {
    filter: function(object) {
        return object.getActiveBodyparts(ATTACK) == 0;
    }
});
if(target) {
    creep.moveTo(target);
}
```

Get the quantity of live body parts of the given type. Fully damaged parts do not count.

{% api_method_params %}
type : string
A body part type, one of the following body part constants:

MOVE

WORK

CARRY

ATTACK

RANGED_ATTACK

HEAL

TOUGH

{% endapi_method_params %}

### Return value

A number representing the quantity of body parts.

{% api_method harvest 'target' A %}

```javascript
const target = creep.pos.findClosestByRange(FIND_SOURCES_ACTIVE);
if(target) {
    if(creep.harvest(target) == ERR_NOT_IN_RANGE) {
        creep.moveTo(target);
    }
}

```

Harvest energy from the source or resources from minerals and deposits. Requires the WORK body part. If the creep has an empty CARRY body part, the harvested resource is put into it; otherwise it is dropped on the ground. The target has to be at an adjacent square to the creep.

{% api_method_params %}
target : Source, Mineral, Deposit
The object to be harvested.
{% endapi_method_params %}

### Return value

One of the following codes:
{% api_return_codes %}
OK | The operation has been scheduled successfully.
ERR_NOT_OWNER | You are not the owner of this creep, or the room controller is owned or reserved by another player.
ERR_BUSY | The creep is still being spawned.
ERR_NOT_FOUND | Extractor not found. You must build an extractor structure to harvest minerals. Learn more
ERR_NOT_ENOUGH_RESOURCES | The target does not contain any harvestable energy or mineral.
ERR_INVALID_TARGET | The target is not a valid source or mineral object.
ERR_NOT_IN_RANGE | The target is too far away.
ERR_TIRED | The extractor or the deposit is still cooling down.
ERR_NO_BODYPART | There are no WORK body parts in this creep’s body.
{% endapi_return_codes %}

{% api_method heal 'target' A %}

```javascript
const target = creep.pos.findClosestByRange(FIND_MY_CREEPS, {
    filter: function(object) {
        return object.hits < object.hitsMax;
    }
});
if(target) {
    if(creep.heal(target) == ERR_NOT_IN_RANGE) {
        creep.moveTo(target);
    }
}

```

Heal self or another creep. It will restore the target creep’s damaged body parts function and increase the hits counter. Requires the HEAL body part. The target has to be at adjacent square to the creep.

{% api_method_params %}
target : Creep, PowerCreep
The target creep object.
{% endapi_method_params %}

### Return value

One of the following codes:
{% api_return_codes %}
OK | The operation has been scheduled successfully.
ERR_NOT_OWNER | You are not the owner of this creep.
ERR_BUSY | The creep is still being spawned.
ERR_INVALID_TARGET | The target is not a valid creep object.
ERR_NOT_IN_RANGE | The target is too far away.
ERR_NO_BODYPART | There are no HEAL body parts in this creep’s body.
{% endapi_return_codes %}
