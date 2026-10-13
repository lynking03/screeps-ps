{% api_method poly 'points, [style]' 0 %}

```javascript
const points = [];
points.push(creep1.pos);
points.push([10,15]);
points.push(new RoomPosition(20,21,'W1N1'));
new RoomVisual('W1N1').poly(points, {fill: 'aqua'}); 
```

```javascript
// visualize the path
const path = Game.rooms['W1N1'].findPath(from, to);
new RoomVisual('W1N1').poly(path, {stroke: '#fff', strokeWidth: .15,
	opacity: .2, lineStyle: 'dashed'}); 
```

Draw a polyline.

{% api_method_params %}
points : array
An array of points. Every item should be either an array with 2 numbers (i.e. [10,15]), or a RoomPosition object.
===
style (optional) : object
An object with the following properties:

- fill : string — Fill color in any web format, default is undefined (no fill).

- opacity : number — Opacity value, default is 0.5.

- stroke : string — Stroke color in any web format, default is #ffffff (white).

- strokeWidth : number — Stroke line width, default is 0.1.

- lineStyle : string — Either undefined (solid line), dashed, or dotted. Default is undefined.

{% endapi_method_params %}

### Return value

The
RoomVisual
object itself, so that you can chain calls.
