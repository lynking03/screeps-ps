{% api_method Room.deserializePath 'path' 1 %}

```javascript
const path = Room.deserializePath(Memory.path);
creep.moveByPath(path);
```

Deserialize a short string path representation into an array form.

{% api_method_params %}
path : string
A serialized path string.
{% endapi_method_params %}

### Return value

A path array.
