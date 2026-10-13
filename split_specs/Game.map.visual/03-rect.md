{% api_method rect 'topLeftPos, width, height, [style]' 0 %}

```javascript
// the max efficiency area of the tower
Game.map.visual.rect(new RoomPosition(tower.pos.x - 5, tower.pos.y - 5, tower.pos.roomName), 
    11, 11,
    {fill: 'transparent', stroke: '#ff0000'});
```

Draw a rectangle.

{% api_method_params %}
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

- fill : string — Fill color in the following format: #ffffff (hex triplet). Default is #ffffff.

- opacity : number — Opacity value, default is 0.5.

- stroke : string — Stroke color in the following format: #ffffff (hex triplet). Default is undefined (no stroke).

- strokeWidth : number — Stroke line width, default is 0.5.

- lineStyle : string — Either undefined (solid line), dashed, or dotted. Default is undefined.

{% endapi_method_params %}

### Return value

The MapVisual object itself, so that you can chain calls.
