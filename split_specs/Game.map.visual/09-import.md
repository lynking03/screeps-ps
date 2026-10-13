{% api_method import 'val' 0 %}

```javascript
Game.map.visual.import(Memory.MapVisualData);
```

Add previously exported (with Game.map.visual.export) map visuals to the map visual data of the current tick.

{% api_method_params %}
val : string
The string returned from Game.map.visual.export.

{% endapi_method_params %}

### Return value

The MapVisual object itself, so that you can chain calls.
