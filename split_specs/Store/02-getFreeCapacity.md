{% api_method getFreeCapacity '[resource]' 0 %}

```javascript
if(structure.store.getFreeCapacity(RESOURCE_ENERGY) > 0) {
    creep.transfer(structure, RESOURCE_ENERGY);
}
```
Returns free capacity for the store. For a limited store, it returns the capacity available for the specified resource if `resource` is defined and valid for this store.

{% api_method_params %}
resource (optional) : string
The type of the resource.
{% endapi_method_params %}

### Return value

Returns available capacity number, or `null` in case of an invalid `resource` for this store type.
