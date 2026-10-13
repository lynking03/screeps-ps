{% api_method rect 'x, y, width, height, [style]|topLeftPos, width, height, [style]' 0 %}

```javascript
// 9x9 area from (2,2) to (10,10)
new RoomVisual('W1N1').rect(1.5, 1.5, 9, 9); 
```

```javascript
// a rectangle border on creep
creep.room.visual.rect(creep.pos.x - 0.6, creep.pos.y - 0.6, 
    1.2, 1.2,
    {fill: 'transparent', stroke: '#f00'});
```

Draw a rectangle.

{% api_method_params %}
x : number
The X coordinate of the top-left corner.
===
y : number
The Y coordinate of the top-left corner.
===
topLeftPos : RoomPosition
The position object of the top-left corner.
===
width : number
The width of the rectangle.
===
height : number
The height of the rectangle.
===
style (optional) : object
An object with the following properties:

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
