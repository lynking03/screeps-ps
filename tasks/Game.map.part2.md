# Game.map: part 2 of 3
Module: `Screeps.Internal.Game.Map.Part2`
Files: `src/Screeps/Internal/Game/Map/Part2.purs` and `src/Screeps/Internal/Game/Map/Part2.js`
Bind ONLY these members: Game.map.getRoomLinearDistance, Game.map.getRoomTerrain, Game.map.getWorldSize
Other parts bind the rest of Game.map. Do not bind anything not listed above.

## About Game.map

A global object representing world map. Use it to navigate between rooms.

## Members

{% api_method Game.map.getRoomLinearDistance 'roomName1, roomName2, [continuous]' 0 %}

```javascript
Game.map.getRoomLinearDistance('W1N1', 'W4N2'); // 3
Game.map.getRoomLinearDistance('E65S55','W65S55', false) // 131
Game.map.getRoomLinearDistance('E65S55','W65S55', true) // 11
```

Get the linear distance (in rooms) between two rooms. You can use this function to estimate the energy cost of sending resources through terminals, or using observers and nukes.

{% api_method_params %}
roomName1 : string
The name of the first room.
===
roomName2 : string
The name of the second room.
===
continuous (optional) : boolean
Whether to treat the world map continuous on borders. Set to true if you want to calculate the trade or terminal send cost. Default is false.
{% endapi_method_params %}

### Return value

A number of rooms between the given two rooms.

{% api_method Game.map.getRoomTerrain 'roomName' 0 %}

```javascript
const terrain = Game.map.getRoomTerrain("E2S7");
switch(terrain.get(10,15)) {
    case TERRAIN_MASK_WALL:
        break;
    case TERRAIN_MASK_SWAMP:
        break;
    case 0:
        break;
}
```

Get a `Room.Terrain` object which provides fast access to static terrain data. This method works for any room in the world even if you have no access to it.

{% api_method_params %}
roomName : string
The room name.
{% endapi_method_params %}

### Return value

Returns new `Room.Terrain` object.

{% api_method Game.map.getWorldSize 0 %}

Returns the world size as a number of rooms between world corners. For example, for a world with rooms from W50N50
to E50S50 this method will return 102.
