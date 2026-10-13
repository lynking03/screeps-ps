{% api_method InterShardMemory.getRemote 'shard' 0 %}

```javascript
var data = JSON.parse(InterShardMemory.getRemote('shard0') || "{}");
console.log(data.message);
```

Returns the string contents of another shard's data.

{% api_method_params %}
shard : string
Shard name.
{% endapi_method_params %}
