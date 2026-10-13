{% api_method getRawBuffer '[destinationArray]' 1 %}

```javascript
function myPrintRawTerain(raw) {
    const visual = new RoomVisual();
    for(let y = 0; y < 50; y++) {
        for(let x = 0; x < 50; x++) {
            const code = raw[y * 50 + x];
            const color =
                (code & TERRAIN_MASK_WALL ) ? "gray"  :
                (code & TERRAIN_MASK_SWAMP) ? "green" : "white" ;
            visual.circle(x, y, {fill: color, radius: 0.5});
        }
    }
}

const raw = (new Room.Terrain("E2S7")).getRawBuffer();
myPrintRawTerain(raw);
```

```javascript
// bound to WASM module heap
const heapView = new Uint8Array(wasmModule.HEAPU8.buffer, ...); 
const terrain = new Room.Terrain("E2S7");

// Fast direct copy terrain data to binary WASM module heap:
const t = Game.cpu.getUsed();
const result = terrain.getRawBuffer(heapView);
if(result !== ERR_INVALID_ARGS) {
    // Copy succeeded, call WASM functions here:
    // wasmModule.myFunc(...); // modifies raw memory of "heapView"
    console.log("Distance transform done in", Game.cpu.getUsed() - t);
    myPrintRawTerain(heapView);
}
```

```cpp
// Somewhere inside binary module source code...
void myFunc(void* ptr) {
    auto u8ptr = static_cast<uint8_t*>(ptr);
    // computations here...
}
```

Get copy of underlying static terrain buffer. **Current underlying representation is `Uint8Array`**.

{% api_method_params %}
destinationArray (optional) : Uint8Array
A typed array view in which terrain will be copied to.
{% endapi_method_params %}

***WARNING:*** *this method relies on underlying representation of terrain data. This is the fastest way to obtain terrain data of the whole room (2500 tiles), but users should keep in mind that it can be marked as deprecated anytime in the future, or return value type can be changed due to underlying data representation changing.*

See usage examples. Learn more about _binary modules_.

### Return value

Copy of underlying room terrain representations as a new `Uint8Array` [typed array](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/TypedArray) of size 2500.

Each element is an integer number, terrain type can be obtained by applying bitwise AND (`&`) operator with appropriate `TERRAIN_MASK_*` constant. Room tiles are stored **row by row**.

If `destinationArray` is specified, function returns reference to this filled `destinationArray` if coping succeeded, or error code otherwise:

{% api_return_codes no_spacer %}
ERR_INVALID_ARGS | `destinationArray` type is incompatible.
{% endapi_return_codes %}
