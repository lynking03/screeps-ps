{% api_method Game.map.findRoute 'fromRoom, toRoom, [opts]' 3 %}

```javascript
const route = Game.map.findRoute(creep.room, anotherRoomName);
if(route.length > 0) {
    console.log('Now heading to room '+route[0].room);
    const exit = creep.pos.findClosestByRange(route[0].exit);
    creep.moveTo(exit);
}
```

```javascript
const route = Game.map.findRoute(creep.room, anotherRoomName, {
	routeCallback(roomName, fromRoomName) {
		if(roomName == 'W10S10') {	// avoid this room
			return Infinity;
		}
		return 1;
	}});
```

```javascript
let from = new RoomPosition(25, 25, 'E1N1');
let to = new RoomPosition(25, 25, 'E4N1');

// Use `findRoute` to calculate a high-level plan for this path,
// prioritizing highways and owned rooms
let allowedRooms = { [ from.roomName ]: true };
Game.map.findRoute(from.roomName, to.roomName, {
	routeCallback(roomName) {
		let parsed = /^[WE]([0-9]+)[NS]([0-9]+)$/.exec(roomName);
		let isHighway = (parsed[1] % 10 === 0) || 
		                (parsed[2] % 10 === 0);
		let isMyRoom = Game.rooms[roomName] &&
			Game.rooms[roomName].controller &&
			Game.rooms[roomName].controller.my;
		if (isHighway || isMyRoom) {
			return 1;
		} else {
			return 2.5;
		}
	}
}).forEach(function(info) {
	allowedRooms[info.room] = true;
});

// Invoke PathFinder, allowing access only to rooms from `findRoute`
let ret = PathFinder.search(from, to, {
	roomCallback(roomName) {
		if (allowedRooms[roomName] === undefined) {
			return false;
		}
	}
});

console.log(ret.path);
```

Find route from the given room to another room.

{% api_method_params %}
fromRoom : string, Room
Start room name or room object.
===
toRoom : string, Room
Finish room name or room object.
===
opts (optional) : object
An object with the following options:

- routeCallback : function — This callback accepts two arguments: function(roomName, fromRoomName). It can be used to calculate the cost of entering that room. You can use this to do things like prioritize your own rooms, or avoid some rooms. You can return a floating point cost or Infinity to block the room.

{% endapi_method_params %}

### Return value

The route array in the following format:

```javascript-content
[
    { exit: FIND_EXIT_RIGHT, room: 'arena21' },
    { exit: FIND_EXIT_BOTTOM, room: 'arena22' },
    ...
]
```

Or one of the following error codes:
{% api_return_codes %}
ERR_NO_PATH | Path can not be found.
{% endapi_return_codes %}
