{% api_method text 'text, x, y, [style]|text, pos, [style]' 0 %}

```javascript
new RoomVisual('W1N1').text("Target💥", 10, 15, {color: 'green', font: 0.8}); 
```

Draw a text label. You can use any valid Unicode characters, including emoji.

{% api_method_params %}
text : string
The text message.
===
x : number
The X coordinate of the label baseline point.
===
y : number
The Y coordinate of the label baseline point.
===
pos : RoomPosition
The position object of the label baseline.
===
style (optional) : object
An object with the following properties:

- color : string — Font color in any web format, default is #ffffff (white).

- font : number, string — Either a number or a string in one of the following forms:

0.7 - relative size in game coordinates

20px - absolute size in pixels

0.7 serif

bold italic 1.5 Times New Roman

- stroke : string — Stroke color in any web format, default is undefined (no stroke).

- strokeWidth : number — Stroke width, default is 0.15.

- backgroundColor : string — Background color in any web format, default is undefined (no background). When background is enabled, text vertical align is set to middle (default is baseline).

- backgroundPadding : number — Background rectangle padding, default is 0.3.

- align : string — Text align, either center, left, or right. Default is center.

- opacity : number — Opacity value, default is 1.0.

{% endapi_method_params %}

### Return value

The
RoomVisual
object itself, so that you can chain calls.
