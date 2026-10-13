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
