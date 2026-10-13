# RoomVisual: part 2 of 4
Module: `Screeps.Internal.RoomVisual.Part2`
Files: `src/Screeps/Internal/RoomVisual/Part2.purs` and `src/Screeps/Internal/RoomVisual/Part2.js`
Bind ONLY these members: circle, rect, poly
Other parts bind the rest of RoomVisual. Do not bind anything not listed above.

## About RoomVisual

Room visuals provide a way to show various visual debug info in game rooms.
You can use the `RoomVisual` object to draw simple shapes that are visible only to you.
Every existing `Room` object already contains the
[`visual`](#Room.visual) property,
but you also can create new `RoomVisual` objects for any room (even without visibility)
using the [constructor](#RoomVisual.constructor).

Room visuals are not stored in the database, their only purpose is to display something in
your browser. All drawings will persist for one tick and will disappear if not updated. All
`RoomVisual` API calls have no added CPU cost (their cost is natural and mostly related to simple
`JSON.serialize` calls). However, there is a usage limit: you cannot post more than 500 KB
of serialized data per one room (see [`getSize`](#RoomVisual.getSize) method).

All draw coordinates are measured in game coordinates and centered to tile centers, i.e. (10,10)
will point to the center of the creep at `x:10; y:10` position. Fractional coordinates are allowed.

## Members

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
