{% api_property RawMemory.segments 'object' %}

```javascript
RawMemory.setActiveSegments([0,3]);
// on the next tick
console.log(RawMemory.segments[0]);
console.log(RawMemory.segments[3]);
RawMemory.segments[3] = '{"foo": "bar", "counter": 15}';
```

An object with asynchronous memory segments available on this tick. Each object key is the segment ID with data in string values. Use [`setActiveSegments`](#RawMemory.setActiveSegments) to fetch segments on the next tick. Segments data is saved automatically in the end of the tick. The maximum size per segment is 100 KB.
