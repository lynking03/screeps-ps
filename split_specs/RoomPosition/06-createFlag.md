{% api_method createFlag '[name], [color], [secondaryColor]' A %}

```javascript
creep.pos.createFlag('Flag1');
```

Create new Flag at the specified location.

{% api_method_params %}
name (optional) : string
The name of a new flag. It should be unique, i.e. the Game.flags object should not contain another flag with the same name (hash key). If not defined, a random name will be generated.
===
color (optional) : string
The color of a new flag. Should be one of the COLOR_* constants. The default value is COLOR_WHITE.
===
secondaryColor (optional) : string
The secondary color of a new flag. Should be one of the COLOR_* constants. The default value is equal to color.
{% endapi_method_params %}

### Return value

The name of a new flag, or one of the following error codes:

{% api_return_codes no_spacer %}
ERR_NAME_EXISTS | There is a flag with the same name already.
ERR_INVALID_ARGS | The location or the color constant is incorrect.
{% endapi_return_codes %}
