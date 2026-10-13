Map visuals provide a way to show various visual debug info on the game map. You can use the `Game.map.visual` object to draw simple shapes that are visible only to you.

Map visuals are not stored in the database, their only purpose is to display something in your browser. All drawings will persist for one tick and will disappear if not updated. All `Game.map.visual` calls have no added CPU cost (their cost is natural and mostly related to simple `JSON.serialize` calls). However, there is a usage limit: you cannot post more than 1000 KB of serialized data.

All draw coordinates are measured in global game coordinates ([`RoomPosition`](#RoomPosition)).
