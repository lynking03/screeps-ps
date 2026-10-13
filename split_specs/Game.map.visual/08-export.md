{% api_method export '' 0 %}

```javascript
Memory.MapVisualData = Game.map.visual.export();
```

Returns a compact representation of all visuals added on the map in the current tick.

### Return value

A string with visuals data. There's not much you can do with the string besides store them for later.
