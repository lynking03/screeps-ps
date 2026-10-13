{% api_method poly 'points, [style]' 0 %}

```javascript
const points = [];
points.push(creep1.pos);
points.push(Game.rooms.E2S7.storage.pos);
points.push(new RoomPosition(20,21,'W1N1'));
Game.map.visual.poly(points, {fill: 'aqua'}); 
```

```javascript
// visualize the path
const path = PathFinder.search(creep.pos, creep.room.storage.pos).path;
Game.map.visual.poly(path, {stroke: '#ffffff', strokeWidth: .8, opacity: .2, lineStyle: 'dashed'});
```

Draw a polyline.

{% api_method_params %}
points : array
An array of points. Every item should be a RoomPosition object.
===
style (optional) : object
An object with the following properties:

- fill : string — Fill color in the following format: #ffffff (hex triplet). Default is undefined (no fill).

- opacity : number — Opacity value, default is 0.5.

- stroke : string — Stroke color in the following format: #ffffff (hex triplet). Default is #ffffff.

- strokeWidth : number — Stroke line width, default is 0.5.

- lineStyle : string — Either undefined (solid line), dashed, or dotted. Default is undefined.

{% endapi_method_params %}

### Return value

The MapVisual object itself, so that you can chain calls.
