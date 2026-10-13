{% api_method circle 'x, y, [style]|pos, [style]' 0 %}

```javascript
new RoomVisual('W1N1').circle(10,15);
```

```javascript
creep.room.visual.circle(creep.pos,
    {fill: 'transparent', radius: 0.55, stroke: 'red'});
```

Draw a circle.

{% api_method_params %}
x : number
The X coordinate of the center.
===
y : number
The Y coordinate of the center.
===
pos : RoomPosition
The position object of the center.
===
style (optional) : object
An object with the following properties:

- radius : number — Circle radius, default is 0.15.

- fill : string — Fill color in any web format, default is #ffffff (white).

- opacity : number — Opacity value, default is 0.5.

- stroke : string — Stroke color in any web format, default is undefined (no stroke).

- strokeWidth : number — Stroke line width, default is 0.1.

- lineStyle : string — Either undefined (solid line), dashed, or dotted. Default is undefined.

{% endapi_method_params %}

### Return value

The
RoomVisual
object itself, so that you can chain calls.
