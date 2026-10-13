# RawMemory: part 2 of 3
Module: `Screeps.Internal.RawMemory.Part2`
Files: `src/Screeps/Internal/RawMemory/Part2.purs` and `src/Screeps/Internal/RawMemory/Part2.js`
Bind ONLY these members: RawMemory.set, RawMemory.setActiveSegments, RawMemory.setActiveForeignSegment
Other parts bind the rest of RawMemory. Do not bind anything not listed above.

## About RawMemory

RawMemory object allows to implement your own memory stringifier instead of built-in serializer
based on `JSON.stringify`. It also allows to request up to 10 MB of additional memory
using asynchronous memory segments feature.

You can also access memory segments of other players using methods below.

## Members

{% api_method RawMemory.set 'value' 0 %}

```javascript
RawMemory.set(JSON.stringify(myMemory));
```

Set new Memory value.

{% api_method_params %}
value : string
New memory value as a string.
{% endapi_method_params %}

{% api_method RawMemory.setActiveSegments 'ids' 0 %}

```javascript
RawMemory.setActiveSegments([0,3]);
```

Request memory segments using the list of their IDs. Memory segments will become available on the next tick in [`segments`](#RawMemory.segments) object.

{% api_method_params %}
ids : array
An array of segment IDs. Each ID should be a number from 0 to 99. Maximum 10 segments can be active at the same time. Subsequent calls of setActiveSegments override previous ones.
{% endapi_method_params %}

{% api_method RawMemory.setActiveForeignSegment 'username, [id]' 0 %}

```javascript
RawMemory.setActiveForeignSegment('player');
```
```javascript
RawMemory.setActiveForeignSegment('player', 10);
```
```javascript
RawMemory.setActiveForeignSegment(null);
```

Request a memory segment of another user. The segment should be marked by its owner as public using [`setPublicSegments`](#RawMemory.setPublicSegments).
The segment data will become available on the next tick in [`foreignSegment`](#RawMemory.foreignSegment) object.
You can only have access to one foreign segment at the same time.

{% api_method_params %}
username : string | null
The name of another user. Pass `null` to clear the foreign segment.
===
id (optional) : number
The ID of the requested segment from 0 to 99. If undefined, the user's default public segment is requested as set by [`setDefaultPublicSegment`](#RawMemory.setDefaultPublicSegment).
{% endapi_method_params %}
