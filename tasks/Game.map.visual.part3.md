# Game.map.visual: part 3 of 3
Module: `Screeps.Internal.Game.Map.Visual.Part3`
Files: `src/Screeps/Internal/Game/Map/Visual/Part3.purs` and `src/Screeps/Internal/Game/Map/Visual/Part3.js`
Bind ONLY these members: getSize, export, import
Other parts bind the rest of Game.map.visual. Do not bind anything not listed above.

## About Game.map.visual

Map visuals provide a way to show various visual debug info on the game map. You can use the `Game.map.visual` object to draw simple shapes that are visible only to you.

Map visuals are not stored in the database, their only purpose is to display something in your browser. All drawings will persist for one tick and will disappear if not updated. All `Game.map.visual` calls have no added CPU cost (their cost is natural and mostly related to simple `JSON.serialize` calls). However, there is a usage limit: you cannot post more than 1000 KB of serialized data.

All draw coordinates are measured in global game coordinates ([`RoomPosition`](#RoomPosition)).

## Members

{% api_method getSize '' 0 %}

```javascript
if(Game.map.visual.getSize() >= 1024000) {
    // cannot add more visuals in this tick
}
```

Get the stored size of all visuals added on the map in the current tick. It must not exceed 1024,000 (1000 KB).

### Return value

The size of the visuals in bytes.

{% api_method export '' 0 %}

```javascript
Memory.MapVisualData = Game.map.visual.export();
```

Returns a compact representation of all visuals added on the map in the current tick.

### Return value

A string with visuals data. There's not much you can do with the string besides store them for later.

{% api_method import 'val' 0 %}

```javascript
Game.map.visual.import(Memory.MapVisualData);
```

Add previously exported (with Game.map.visual.export) map visuals to the map visual data of the current tick.

{% api_method_params %}
val : string
The string returned from Game.map.visual.export.

{% endapi_method_params %}

### Return value

The MapVisual object itself, so that you can chain calls.
