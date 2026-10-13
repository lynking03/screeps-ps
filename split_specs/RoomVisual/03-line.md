{% api_method line 'x1, y1, x2, y2, [style]|pos1, pos2, [style]' 0 %}

```javascript
new RoomVisual('W1N1').line(10,15, 20,20);
```

```javascript
creep.room.visual.line(creep.pos, target.pos,
    {color: 'red', lineStyle: 'dashed'});
```

Draw a line.

{% api_method_params %}
x1 : number
The start X coordinate.
===
y1 : number
The start Y coordinate.
===
x2 : number
The finish X coordinate.
===
y2 : number
The finish Y coordinate.
===
pos1 : RoomPosition
The start position object.
===
pos2 : RoomPosition
The finish position object.
===
style (optional) : object
An object with the following properties:

- width : number — Line width, default is 0.1.

- color : string — Line color in any web format, default is #ffffff (white).

- opacity : number — Opacity value, default is 0.5.

- lineStyle : string — Either undefined (solid line), dashed, or dotted. Default is undefined.

{% endapi_method_params %}

### Return value

The
RoomVisual
object itself, so that you can chain calls.
