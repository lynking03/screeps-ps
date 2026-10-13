# Game.map.visual: part 1 of 3
Module: `Screeps.Internal.Game.Map.Visual.Part1`
Files: `src/Screeps/Internal/Game/Map/Visual/Part1.purs` and `src/Screeps/Internal/Game/Map/Visual/Part1.js`
Bind ONLY these members: line, circle, rect
Other parts bind the rest of Game.map.visual. Do not bind anything not listed above.

## About Game.map.visual

Map visuals provide a way to show various visual debug info on the game map. You can use the `Game.map.visual` object to draw simple shapes that are visible only to you.

Map visuals are not stored in the database, their only purpose is to display something in your browser. All drawings will persist for one tick and will disappear if not updated. All `Game.map.visual` calls have no added CPU cost (their cost is natural and mostly related to simple `JSON.serialize` calls). However, there is a usage limit: you cannot post more than 1000 KB of serialized data.

All draw coordinates are measured in global game coordinates ([`RoomPosition`](#RoomPosition)).

## Members

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
