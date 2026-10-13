{% api_method RawMemory.setActiveSegments 'ids' 0 %}

```javascript
RawMemory.setActiveSegments([0,3]);
```

Request memory segments using the list of their IDs. Memory segments will become available on the next tick in [`segments`](#RawMemory.segments) object.

{% api_method_params %}
ids : array
An array of segment IDs. Each ID should be a number from 0 to 99. Maximum 10 segments can be active at the same time. Subsequent calls of setActiveSegments override previous ones.
{% endapi_method_params %}
