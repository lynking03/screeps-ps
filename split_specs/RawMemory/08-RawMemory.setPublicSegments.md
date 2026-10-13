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
