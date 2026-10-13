# RoomVisual: part 3 of 4
Module: `Screeps.Internal.RoomVisual.Part3`
Files: `src/Screeps/Internal/RoomVisual/Part3.purs` and `src/Screeps/Internal/RoomVisual/Part3.js`
Bind ONLY these members: text, clear, getSize
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

{% api_method text 'text, x, y, [style]|text, pos, [style]' 0 %}

```javascript
new RoomVisual('W1N1').text("Target💥", 10, 15, {color: 'green', font: 0.8}); 
```

Draw a text label. You can use any valid Unicode characters, including emoji.

{% api_method_params %}
text : string
The text message.
===
x : number
The X coordinate of the label baseline point.
===
y : number
The Y coordinate of the label baseline point.
===
pos : RoomPosition
The position object of the label baseline.
===
style (optional) : object
An object with the following properties:

- color : string — Font color in any web format, default is #ffffff (white).

- font : number, string — Either a number or a string in one of the following forms:

0.7 - relative size in game coordinates

20px - absolute size in pixels

0.7 serif

bold italic 1.5 Times New Roman

- stroke : string — Stroke color in any web format, default is undefined (no stroke).

- strokeWidth : number — Stroke width, default is 0.15.

- backgroundColor : string — Background color in any web format, default is undefined (no background). When background is enabled, text vertical align is set to middle (default is baseline).

- backgroundPadding : number — Background rectangle padding, default is 0.3.

- align : string — Text align, either center, left, or right. Default is center.

- opacity : number — Opacity value, default is 1.0.

{% endapi_method_params %}

### Return value

The
RoomVisual
object itself, so that you can chain calls.

{% api_method clear '' 0 %}

```javascript
new RoomVisual('W1N1').clear();
```

Remove all visuals from the room.

### Return value

The
RoomVisual
object itself, so that you can chain calls.

{% api_method getSize '' 0 %}

```javascript
if(creep.room.visual.getSize() >= 512000) {
    // cannot add more visuals in this tick
}
```

Get the stored size of all visuals added in the room in the current tick. It must not exceed 512,000 (500 KB).

### Return value

The size of the visuals in bytes.
