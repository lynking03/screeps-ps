# RoomVisual: part 4 of 4
Module: `Screeps.Internal.RoomVisual.Part4`
Files: `src/Screeps/Internal/RoomVisual/Part4.purs` and `src/Screeps/Internal/RoomVisual/Part4.js`
Bind ONLY these members: export, import
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

{% api_method export '' 0 %}

```javascript
Memory.RoomVisualData['E2S7'] = Game.rooms.E2S7.visual.export();
```

Returns a compact representation of all visuals added in the room in the current tick.

### Return value

A string with visuals data. There's not much you can do with the string besides store them for later.

{% api_method import 'val' 0 %}

```javascript
if(Memory.RoomVisualData['E2S7']) {
    Game.rooms.E2S7.visual.import(Memory.RoomVisualData['E2S7']);
}
```

Add previously exported (with RoomVisual.export) room visuals to the room visual data of the current tick.

{% api_method_params %}
val : string
The string returned from RoomVisual.export.

{% endapi_method_params %}

### Return value

The RoomVisual object itself, so that you can chain calls.
