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
