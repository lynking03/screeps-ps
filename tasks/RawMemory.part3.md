# RawMemory: part 3 of 3
Module: `Screeps.Internal.RawMemory.Part3`
Files: `src/Screeps/Internal/RawMemory/Part3.purs` and `src/Screeps/Internal/RawMemory/Part3.js`
Bind ONLY these members: RawMemory.setDefaultPublicSegment, RawMemory.setPublicSegments
Other parts bind the rest of RawMemory. Do not bind anything not listed above.

## About RawMemory

RawMemory object allows to implement your own memory stringifier instead of built-in serializer
based on `JSON.stringify`. It also allows to request up to 10 MB of additional memory
using asynchronous memory segments feature.

You can also access memory segments of other players using methods below.

## Members

{% api_method RawMemory.setDefaultPublicSegment 'id' 0 %}

```javascript
RawMemory.setPublicSegments([5,20,21]);
RawMemory.setDefaultPublicSegment(5);
```
```javascript
RawMemory.setDefaultPublicSegment(null);
```

Set the specified segment as your default public segment. It will be returned if no `id` parameter is passed to [`setActiveForeignSegment`](#RawMemory.setActiveForeignSegment) by another user.

{% api_method_params %}
id : number | null
The ID of the memory segment from 0 to 99. Pass `null` to remove your default public segment.
{% endapi_method_params %}

{% api_method RawMemory.setPublicSegments 'ids' 0 %}

```javascript
RawMemory.setPublicSegments([5,3]);
```
```javascript
RawMemory.setPublicSegments([]);
```

Set specified segments as public. Other users will be able to request access to them using [`setActiveForeignSegment`](#RawMemory.setActiveForeignSegment).

{% api_method_params %}
ids : array
An array of segment IDs. Each ID should be a number from 0 to 99. Subsequent calls of setPublicSegments override previous ones.
{% endapi_method_params %}
