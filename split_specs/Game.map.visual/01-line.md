{% api_method line 'pos1, pos2, [style]' 0 %}

```javascript
Game.map.visual.line(creep.pos, target.pos,
    {color: '#ff0000', lineStyle: 'dashed'});
```

Draw a line.

{% api_method_params %}
pos1 : RoomPosition
The start position object.
===
pos2 : RoomPosition
The finish position object.
===
style (optional) : object
An object with the following properties:

- width : number — Line width, default is 0.1.

- color : string — Line color in the following format: #ffffff (hex triplet). Default is #ffffff.

- opacity : number — Opacity value, default is 0.5.

- lineStyle : string — Either undefined (solid line), dashed, or dotted. Default is undefined.

{% endapi_method_params %}

### Return value

The MapVisual object itself, so that you can chain calls.
