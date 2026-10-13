{% api_method circle 'pos, [style]' 0 %}

```javascript
Game.map.visual.circle(new RoomPosition(25,25,'E2S7'));
```

```javascript
Game.map.visual.circle(nuker.pos, {fill: 'transparent', radius: NUKE_RANGE*50, stroke: '#ff0000'});
```

Draw a circle.

{% api_method_params %}
pos : RoomPosition
The position object of the center.
===
style (optional) : object
An object with the following properties:

- radius : number — Circle radius, default is 10.

- fill : string — Fill color in the following format: #ffffff (hex triplet). Default is #ffffff.

- opacity : number — Opacity value, default is 0.5.

- stroke : string — Stroke color in the following format: #ffffff (hex triplet). Default is undefined (no stroke).

- strokeWidth : number — Stroke line width, default is 0.5.

- lineStyle : string — Either undefined (solid line), dashed, or dotted. Default is undefined.

{% endapi_method_params %}

### Return value

The MapVisual object itself, so that you can chain calls.
