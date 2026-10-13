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
