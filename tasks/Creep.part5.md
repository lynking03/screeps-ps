# Creep: part 5 of 14
Module: `Screeps.Internal.Creep.Part5`
Files: `src/Screeps/Internal/Creep/Part5.purs` and `src/Screeps/Internal/Creep/Part5.js`
Bind ONLY these members: ticksToLive, attack, attackController
Other parts bind the rest of Creep. Do not bind anything not listed above.

## About Creep

Creeps are your units. Creeps can move, harvest energy, construct structures, attack another creeps, and perform other actions. Each creep consists of up to 50 body parts with the following possible types:

Inherits from RoomObject: those members are bound elsewhere.

## Members

{% api_property ticksToLive number %}

The remaining amount of game ticks after which the creep will die.

{% api_method attack 'target' A %}

```javascript
const target = creep.pos.findClosestByRange(FIND_HOSTILE_CREEPS);
if(target) {
    if(creep.attack(target) == ERR_NOT_IN_RANGE) {
        creep.moveTo(target);
    }
}

```

Attack another creep, power creep, or structure in a short-ranged attack. Requires the ATTACK body part. If the target is inside a rampart, then the rampart is attacked instead. The target has to be at adjacent square to the creep. If the target is a creep with ATTACK body parts and is not inside a rampart, it will automatically hit back at the attacker.

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
ERR_NO_BODYPART | There are no ATTACK body parts in this creep’s body.
{% endapi_return_codes %}

{% api_method attackController 'target' A %}

```javascript
if(creep.room.controller && !creep.room.controller.my) {
    if(creep.attackController(creep.room.controller) == ERR_NOT_IN_RANGE) {
        creep.moveTo(creep.room.controller);
    }
}

```

Decreases the controller's downgrade timer by 300 ticks per every CLAIM body part, or reservation timer by 1 tick per every CLAIM body part. If the controller under attack is owned, it cannot be upgraded or attacked again for the next 1,000 ticks. The target has to be at adjacent square to the creep.

{% api_method_params %}
target : StructureController
The target controller object.
{% endapi_method_params %}

### Return value

One of the following codes:
{% api_return_codes %}
OK | The operation has been scheduled successfully.
ERR_NOT_OWNER | You are not the owner of this creep.
ERR_BUSY | The creep is still being spawned.
ERR_INVALID_TARGET | The target is not a valid owned or reserved controller object.
ERR_NOT_IN_RANGE | The target is too far away.
ERR_NO_BODYPART | There are not enough CLAIM body parts in this creep’s body.
ERR_TIRED | You have to wait until the next attack is possible.
{% endapi_return_codes %}
