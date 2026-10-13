{% api_method getSize '' 0 %}

```javascript
if(Game.map.visual.getSize() >= 1024000) {
    // cannot add more visuals in this tick
}
```

Get the stored size of all visuals added on the map in the current tick. It must not exceed 1024,000 (1000 KB).

### Return value

The size of the visuals in bytes.
