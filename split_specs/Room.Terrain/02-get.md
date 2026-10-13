{% api_method get 'x, y' 0 %}

```javascript
switch(terrain.get(10,15)) {
    case TERRAIN_MASK_WALL:
        break;
    case TERRAIN_MASK_SWAMP:
        break;
    case 0:
        break;
}
```

```javascript
const roomName = "E2S7";
const terrain = new Room.Terrain(roomName);
const matrix = new PathFinder.CostMatrix;
const visual = new RoomVisual(roomName);

// Fill CostMatrix with default terrain costs for future analysis:
for(let y = 0; y < 50; y++) {
    for(let x = 0; x < 50; x++) {
        const tile = terrain.get(x, y);
        const weight =
            tile === TERRAIN_MASK_WALL  ? 255 : // wall  => unwalkable
            tile === TERRAIN_MASK_SWAMP ?   5 : // swamp => weight:  5
                                            1 ; // plain => weight:  1
        matrix.set(x, y, weight);
        visual.text(weight, x, y);
    }
}
```

```javascript
// bound to WASM module heap
const heapView = new Uint8Array(wasmModule.HEAPU8.buffer, ...); 
const terrain = new Room.Terrain("E2S7");

// Copy terrain data to binary WASM module heap:
for(let y = 0; y < 50; y++) {
    for(let x = 0; x < 50; x++) {
        heapView[y * 50 + x] = terrain.get(x, y);
    }    
}
```

Get terrain type at the specified room position by `(x,y)` coordinates. Unlike the `Game.map.getTerrainAt(...)` method, this one doesn't perform any string operations and returns integer terrain type values (see below).

{% api_method_params %}
x : number
X position in the room.
===
y : number
Y position in the room.
{% endapi_method_params %}

### Return value

One of the following integer values:

| value | constant (*if exists*) | description |
|-|-|-|
| 0 | *doesn't exist* | terrain is `plain` |
| 1 | `TERRAIN_MASK_WALL` | terrain is `wall`|
| 2 | `TERRAIN_MASK_SWAMP` | terrain is `swamp`|
