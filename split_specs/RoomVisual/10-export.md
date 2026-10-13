{% api_method export '' 0 %}

```javascript
Memory.RoomVisualData['E2S7'] = Game.rooms.E2S7.visual.export();
```

Returns a compact representation of all visuals added in the room in the current tick.

### Return value

A string with visuals data. There's not much you can do with the string besides store them for later.
