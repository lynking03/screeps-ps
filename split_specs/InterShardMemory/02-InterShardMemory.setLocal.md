{% api_method InterShardMemory.setLocal 'value' 0 %}

```javascript
var data = JSON.parse(InterShardMemory.getLocal() || "{}");
data.message = "hello from another shard!";
InterShardMemory.setLocal(JSON.stringify(data));
```

Replace the current shard's data with the new value.

{% api_method_params %}
value : string
New data value in string format.
{% endapi_method_params %}
