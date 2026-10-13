{% api_method move 'direction' A %}

```javascript
creep.move(RIGHT);
```

```javascript
const path = creep.pos.findPathTo(Game.flags.Flag1);
if(path.length > 0) {
	creep.move(path[0].direction);
}
```

```javascript
creep1.move(TOP);
creep1.pull(creep2);
creep2.move(creep1);
```

Move the creep one square in the specified direction. Requires the MOVE body part, or another creep nearby pulling the creep. In case if you call move on a creep nearby, the ERR_TIRED and the ERR_NO_BODYPART checks will be bypassed; otherwise, the ERR_NOT_IN_RANGE check will be bypassed.

{% api_method_params %}
direction : Creep|number
A creep nearby, or one of the following constants:

TOP

TOP_RIGHT

RIGHT

BOTTOM_RIGHT

BOTTOM

BOTTOM_LEFT

LEFT

TOP_LEFT

{% endapi_method_params %}

### Return value

One of the following codes:
{% api_return_codes %}
OK | The operation has been scheduled successfully.
ERR_NOT_OWNER | You are not the owner of this creep.
ERR_BUSY | The creep is still being spawned.
ERR_TIRED | The fatigue indicator of the creep is non-zero.
ERR_NO_BODYPART | There are no MOVE body parts in this creep’s body.
ERR_INVALID_ARGS | The provided direction is incorrect.
ERR_NOT_IN_RANGE | The target creep is too far away
{% endapi_return_codes %}
