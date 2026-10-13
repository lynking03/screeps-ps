# Game.map: part 3 of 3
Module: `Screeps.Internal.Game.Map.Part3`
Files: `src/Screeps/Internal/Game/Map/Part3.purs` and `src/Screeps/Internal/Game/Map/Part3.js`
Bind ONLY these members: Game.map.getRoomStatus
Other parts bind the rest of Game.map. Do not bind anything not listed above.

## About Game.map

A global object representing world map. Use it to navigate between rooms.

## Members

{% api_method Game.map.getRoomStatus 'roomName' 2 %}

```javascript
if(Game.map.getRoomStatus(room.name).status == 'normal') {
    nuker.launchNuke(room.getPositionAt(25,25));
}
```

Gets availablity status of the room with the specified name. Learn more about starting areas from [this article](/start-areas.html).

{% api_method_params %}
roomName : string
The room name.
{% endapi_method_params %}

### Return value

An object containing the following properties:

property | type | description
| --- | --- | --- |
`status` | string | One of the following string values:

normal – the room has no restrictions

closed – the room is not available

novice – the room is part of a novice area

respawn – the room is part of a respawn area

`timestamp` | number | Status expiration time in milliseconds since UNIX epoch time. This property is null if the status is permanent.
