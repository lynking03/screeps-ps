{% api_method getSize '' 0 %}

```javascript
if(creep.room.visual.getSize() >= 512000) {
    // cannot add more visuals in this tick
}
```

Get the stored size of all visuals added in the room in the current tick. It must not exceed 512,000 (500 KB).

### Return value

The size of the visuals in bytes.
