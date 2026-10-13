{% api_method pull 'target' 0 %}

```javascript
creep1.move(TOP);
creep1.pull(creep2);
creep2.move(creep1);
```

```javascript
const target = creep.pos.findClosestByRange(FIND_MY_CREEPS, {
    filter: function(object) {
        return (object.getActiveBodyparts(MOVE) == 0) && 
            object.memory.destinationId &&
            !object.pos.isNearTo(Game.getObjectById(object.memory.destinationId));
    }
});
if(target) {
    if(creep.pull(target) == ERR_NOT_IN_RANGE) {
        creep.moveTo(target);
    } else {
        target.move(creep);
        if(creep.pos.isNearTo(Game.getObjectById(target.memory.destinationId))) {
            creep.move(creep.pos.getDirectionTo(target));
        } else {
            creep.moveTo(Game.getObjectById(target.memory.destinationId));
        }
    }
}
```

Help another creep to follow this creep. The fatigue generated for the target's move will be added to the creep instead of the target. Requires the MOVE body part. The target has to be at adjacent square to the creep. The creep must move elsewhere, and the target must move towards the creep.

{% api_method_params %}
target : Creep
The target creep.
{% endapi_method_params %}

### Return value

One of the following codes:
{% api_return_codes %}
OK | The operation has been scheduled successfully.
ERR_NOT_OWNER | You are not the owner of this creep.
ERR_BUSY | The creep is still being spawned.
ERR_INVALID_TARGET | The target provided is invalid.
ERR_NOT_IN_RANGE | The target is too far away.
{% endapi_return_codes %}
