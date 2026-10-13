{% api_method build 'target' A %}

```javascript
const target = creep.pos.findClosestByRange(FIND_CONSTRUCTION_SITES);
if(target) {
    if(creep.build(target) == ERR_NOT_IN_RANGE) {
        creep.moveTo(target);
    }
}

```

Build a structure at the target construction site using carried energy. Requires WORK and CARRY body parts. The target has to be within 3 squares range of the creep.

{% api_method_params %}
target : ConstructionSite
The target construction site to be built.
{% endapi_method_params %}

### Return value

One of the following codes:
{% api_return_codes %}
OK | The operation has been scheduled successfully.
ERR_NOT_OWNER | You are not the owner of this creep.
ERR_BUSY | The creep is still being spawned.
ERR_NOT_ENOUGH_RESOURCES | The creep does not have any carried energy.
ERR_INVALID_TARGET | The target is not a valid construction site object or the structure cannot be built here (probably because of a creep at the same square).
ERR_NOT_IN_RANGE | The target is too far away.
ERR_NO_BODYPART | There are no WORK body parts in this creep’s body.
{% endapi_return_codes %}
