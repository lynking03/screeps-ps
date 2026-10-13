{% api_method setDirections 'directions' A %}

```javascript
Game.spawns['Spawn1'].spawning.setDirections([RIGHT, TOP_RIGHT]);
```

Set desired directions where the creep should move when spawned.

{% api_method_params %}
directions : array<number>
An array with the direction constants:

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
ERR_NOT_OWNER | You are not the owner of this spawn.
ERR_INVALID_ARGS | The directions is array is invalid.
{% endapi_return_codes %}
