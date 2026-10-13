{% api_method setColor 'color, [secondaryColor]' A %}

```javascript
Game.flags.Flag1.setColor(COLOR_GREEN, COLOR_WHITE);
```

Set new color of the flag.

{% api_method_params %}
color : number
Primary color of the flag. One of the COLOR_* constants.
===
secondaryColor (optional) : number
Secondary color of the flag. One of the COLOR_* constants.
{% endapi_method_params %}

### Return value

One of the following codes:
{% api_return_codes %}
OK | The operation has been scheduled successfully.
ERR_INVALID_ARGS | color or secondaryColor is not a valid color constant.
{% endapi_return_codes %}
