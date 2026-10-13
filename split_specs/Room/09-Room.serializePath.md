{% api_method Room.serializePath 'path' 1 %}

```javascript
const path = spawn.pos.findPathTo(source);
Memory.path = Room.serializePath(path);
creep.moveByPath(Memory.path);
```

Serialize a path array into a short string representation, which is suitable to store in memory.

{% api_method_params %}
path : array
A path array retrieved from Room.findPath.
{% endapi_method_params %}

### Return value

A serialized string form of the given path.
