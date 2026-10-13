# RawMemory: part 1 of 3
Module: `Screeps.Internal.RawMemory.Part1`
Files: `src/Screeps/Internal/RawMemory/Part1.purs` and `src/Screeps/Internal/RawMemory/Part1.js`
Bind ONLY these members: RawMemory.segments, RawMemory.foreignSegment, RawMemory.get
Other parts bind the rest of RawMemory. Do not bind anything not listed above.

## About RawMemory

RawMemory object allows to implement your own memory stringifier instead of built-in serializer
based on `JSON.stringify`. It also allows to request up to 10 MB of additional memory
using asynchronous memory segments feature.

You can also access memory segments of other players using methods below.

## Members

{% api_property RawMemory.segments 'object' %}

```javascript
RawMemory.setActiveSegments([0,3]);
// on the next tick
console.log(RawMemory.segments[0]);
console.log(RawMemory.segments[3]);
RawMemory.segments[3] = '{"foo": "bar", "counter": 15}';
```

An object with asynchronous memory segments available on this tick. Each object key is the segment ID with data in string values. Use [`setActiveSegments`](#RawMemory.setActiveSegments) to fetch segments on the next tick. Segments data is saved automatically in the end of the tick. The maximum size per segment is 100 KB.

{% api_property RawMemory.foreignSegment 'object' %}

```javascript
RawMemory.setActiveForeignSegment('player');
// on the next tick
console.log(RawMemory.foreignSegment); 
// --> {"username": "player", "id": 40, "data": "Hello!"} 

```

An object with a memory segment of another player available on this tick. Use [`setActiveForeignSegment`](#RawMemory.setActiveForeignSegment) to fetch segments on the next tick.
The object consists of the following properties:

{% api_method_params %}
username : string
Another player's name.
===
id : number
The ID of the requested memory segment.
===
data : string
The segment contents.
{% endapi_method_params %}

{% api_method RawMemory.get '' 0 %}

```javascript
const myMemory = JSON.parse(RawMemory.get());
```

Get a raw string representation of the Memory object.

### Return value

Returns a string value.
