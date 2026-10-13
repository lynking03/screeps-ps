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
