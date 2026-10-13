{% api_method getCapacity '[resource]' 0 %}

```javascript
if(creep.store[RESOURCE_ENERGY] < creep.store.getCapacity()) {
    goHarvest(creep);
}
```

Returns capacity of this store for the specified resource. For a general purpose store, it returns total capacity if `resource` is undefined.

{% api_method_params %}
resource (optional) : string
The type of the resource.
{% endapi_method_params %}

### Return value

Returns capacity number, or `null` in case of an invalid `resource` for this store type.
