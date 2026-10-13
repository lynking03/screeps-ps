{% api_method text 'text, pos, [style]' 0 %}

```javascript
Game.map.visual.text("Target💥", new RoomPosition(11,14,'E2S7'), {color: '#FF0000', fontSize: 10}); 
```

Draw a text label. You can use any valid Unicode characters, including emoji.

{% api_method_params %}
text : string
The text message.
===
pos : RoomPosition
The position object of the label baseline.
===
style (optional) : object
An object with the following properties:

- color : string — Font color in the following format: #ffffff (hex triplet). Default is #ffffff.

- fontFamily : string — The font family, default is sans-serif

- fontSize : number — The font size in game coordinates, default is 10

- fontStyle : string — The font style ('normal', 'italic' or 'oblique')

- fontVariant : string — The font variant ('normal' or 'small-caps')

- stroke : string — Stroke color in the following format: #ffffff (hex triplet). Default is undefined (no stroke).

- strokeWidth : number — Stroke width, default is 0.15.

- backgroundColor : string — Background color in the following format: #ffffff (hex triplet). Default is undefined (no background). When background is enabled, text vertical align is set to middle (default is baseline).

- backgroundPadding : number — Background rectangle padding, default is 2.

- align : string — Text align, either center, left, or right. Default is center.

- opacity : number — Opacity value, default is 0.5.

{% endapi_method_params %}

### Return value

The MapVisual object itself, so that you can chain calls.
