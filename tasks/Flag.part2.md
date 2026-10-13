# Flag: part 2 of 3
Module: `Screeps.Internal.Flag.Part2`
Files: `src/Screeps/Internal/Flag/Part2.purs` and `src/Screeps/Internal/Flag/Part2.js`
Bind ONLY these members: secondaryColor, remove, setColor
Other parts bind the rest of Flag. Do not bind anything not listed above.

## About Flag

A flag. Flags can be used to mark particular spots in a room. Flags are visible to their owners only. You cannot have more than 10,000 flags.

Inherits from RoomObject: those members are bound elsewhere.

## Members

{% api_property secondaryColor number %}

Flag secondary color. One of the COLOR_* constants.

{% api_method remove '' A %}

Remove the flag.

### Return value

Always returns
OK
.

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
