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
