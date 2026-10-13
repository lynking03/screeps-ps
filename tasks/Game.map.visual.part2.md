# Game.map.visual: part 2 of 3
Module: `Screeps.Internal.Game.Map.Visual.Part2`
Files: `src/Screeps/Internal/Game/Map/Visual/Part2.purs` and `src/Screeps/Internal/Game/Map/Visual/Part2.js`
Bind ONLY these members: poly, text, clear
Other parts bind the rest of Game.map.visual. Do not bind anything not listed above.

## About Game.map.visual

Map visuals provide a way to show various visual debug info on the game map. You can use the `Game.map.visual` object to draw simple shapes that are visible only to you.

Map visuals are not stored in the database, their only purpose is to display something in your browser. All drawings will persist for one tick and will disappear if not updated. All `Game.map.visual` calls have no added CPU cost (their cost is natural and mostly related to simple `JSON.serialize` calls). However, there is a usage limit: you cannot post more than 1000 KB of serialized data.

All draw coordinates are measured in global game coordinates ([`RoomPosition`](#RoomPosition)).

## Members

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

{% api_method text 'text, pos, [style]' 0 %}

```javascript
Game.map.visual.text("Target💥", new RoomPosition(11,14,'E2S7'), {color: '#FF0000', fontSize: 10}); 
```

Draw a text label. You can use any valid Unicode characters, including emoji.

{% api_method_params %}
text : string
The text message.
===
pos : RoomPosition
The position object of the label baseline.
===
style (optional) : object
An object with the following properties:

- color : string — Font color in the following format: #ffffff (hex triplet). Default is #ffffff.

- fontFamily : string — The font family, default is sans-serif

- fontSize : number — The font size in game coordinates, default is 10

- fontStyle : string — The font style ('normal', 'italic' or 'oblique')

- fontVariant : string — The font variant ('normal' or 'small-caps')

- stroke : string — Stroke color in the following format: #ffffff (hex triplet). Default is undefined (no stroke).

- strokeWidth : number — Stroke width, default is 0.15.

- backgroundColor : string — Background color in the following format: #ffffff (hex triplet). Default is undefined (no background). When background is enabled, text vertical align is set to middle (default is baseline).

- backgroundPadding : number — Background rectangle padding, default is 2.

- align : string — Text align, either center, left, or right. Default is center.

- opacity : number — Opacity value, default is 0.5.

{% endapi_method_params %}

### Return value

The MapVisual object itself, so that you can chain calls.

{% api_method clear '' 0 %}

```javascript
Game.map.visual.clear();
```

Remove all visuals from the map.

### Return value

The MapVisual object itself, so that you can chain calls.
