{% api_method createFlag 'x, y, [name], [color], [secondaryColor]|pos, [name], [color], [secondaryColor]' A %}

```javascript
Game.rooms.sim.createFlag(5, 12, 'Flag1');
```

Create new Flag at the specified location.

{% api_method_params %}
x : number
The X position.
===
y : number
The Y position.
===
pos : object
Can be a RoomPosition object or any object containing RoomPosition.
===
name (optional) : string
The name of a new flag. It should be unique, i.e. the Game.flags object should not contain another flag with the same name (hash key). If not defined, a random name will be generated. The maximum length is 100 characters.
===
color (optional) : number
The color of a new flag. Should be one of the COLOR_* constants. The default value is COLOR_WHITE.
===
secondaryColor (optional) : string
The secondary color of a new flag. Should be one of the COLOR_* constants. The default value is equal to color.
{% endapi_method_params %}

### Return value

The name of a new flag, or one of the following error codes:
{% api_return_codes %}
ERR_NAME_EXISTS | There is a flag with the same name already.
ERR_INVALID_ARGS | The location or the name or the color constant is incorrect.
ERR_FULL | You have too many flags. The maximum number of flags per player is 10000.
{% endapi_return_codes %}
