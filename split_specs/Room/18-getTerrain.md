{% api_method getTerrain '' 0 %}

```javascript
const terrain = Game.rooms['W1N1'].getTerrain();
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

### Return value

Returns new `Room.Terrain` object.
