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
