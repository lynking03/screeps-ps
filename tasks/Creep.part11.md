# Creep: part 11 of 14
Module: `Screeps.Internal.Creep.Part11`
Files: `src/Screeps/Internal/Creep/Part11.purs` and `src/Screeps/Internal/Creep/Part11.js`
Bind ONLY these members: rangedAttack, rangedHeal, rangedMassAttack
Other parts bind the rest of Creep. Do not bind anything not listed above.

## About Creep

Creeps are your units. Creeps can move, harvest energy, construct structures, attack another creeps, and perform other actions. Each creep consists of up to 50 body parts with the following possible types:

Inherits from RoomObject: those members are bound elsewhere.

## Members

{% api_method rangedAttack 'target' A %}

```javascript
const targets = creep.pos.findInRange(FIND_HOSTILE_CREEPS, 3);
if(targets.length > 0) {
    creep.rangedAttack(targets[0]);
}

```

A ranged attack against another creep or structure. Requires the RANGED_ATTACK body part. If the target is inside a rampart, the rampart is attacked instead. The target has to be within 3 squares range of the creep.

{% api_method_params %}
target : Creep, PowerCreep, Structure
The target object to be attacked.
{% endapi_method_params %}

### Return value

One of the following codes:
{% api_return_codes %}
OK | The operation has been scheduled successfully.
ERR_NOT_OWNER | You are not the owner of this creep.
ERR_BUSY | The creep is still being spawned.
ERR_INVALID_TARGET | The target is not a valid attackable object.
ERR_NOT_IN_RANGE | The target is too far away.
ERR_NO_BODYPART | There are no RANGED_ATTACK body parts in this creep’s body.
{% endapi_return_codes %}

{% api_method rangedHeal 'target' A %}

```javascript
const target = creep.pos.findClosestByRange(FIND_MY_CREEPS, {
    filter: function(object) {
        return object.hits < object.hitsMax;
    }
});
if(target) {
    creep.moveTo(target);
    if(creep.pos.isNearTo(target)) {
        creep.heal(target);
    }
    else {
        creep.rangedHeal(target);
    }
}
```

Heal another creep at a distance. It will restore the target creep’s damaged body parts function and increase the hits counter. Requires the HEAL body part. The target has to be within 3 squares range of the creep.

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

{% api_method rangedMassAttack '' A %}

```javascript
const targets = creep.pos.findInRange(FIND_HOSTILE_CREEPS, 3);
if(targets.length > 0) {
    creep.rangedMassAttack();
}
```

A ranged attack against all hostile creeps or structures within 3 squares range. Requires the RANGED_ATTACK body part. The attack power depends on the range to each target. Friendly units are not affected.

### Return value

One of the following codes:
{% api_return_codes %}
OK | The operation has been scheduled successfully.
ERR_NOT_OWNER | You are not the owner of this creep.
ERR_BUSY | The creep is still being spawned.
ERR_NO_BODYPART | There are no RANGED_ATTACK body parts in this creep’s body.
{% endapi_return_codes %}
