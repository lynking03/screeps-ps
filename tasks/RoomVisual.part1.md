# RoomVisual: part 1 of 4
Module: `Screeps.Internal.RoomVisual.Part1`
Files: `src/Screeps/Internal/RoomVisual/Part1.purs` and `src/Screeps/Internal/RoomVisual/Part1.js`
Bind ONLY these members: constructor, roomName, line
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

{% api_method constructor '[roomName]' 0 %}

```javascript
Game.rooms['W10N10'].visual.circle(10,20).line(0,0,10,20);
// the same as:
new RoomVisual('W10N10').circle(10,20).line(0,0,10,20);
```

```javascript
// this text will be displayed in all rooms
new RoomVisual().text('Some text', 1, 1, {align: 'left'}); 
```

You can directly create new RoomVisual object in any room, even if it's invisible to your script.

{% api_method_params %}
roomName (optional) : string
The room name. If undefined, visuals will be posted to all rooms simultaneously.
{% endapi_method_params %}

{% api_property roomName 'string' %}

The name of the room.

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
