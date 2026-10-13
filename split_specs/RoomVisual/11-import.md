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
