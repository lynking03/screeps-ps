{% api_method getUsedCapacity '[resource]' 0 %}

```javascript
if(Game.rooms['W1N1'].terminal.store.getUsedCapacity() == 0) {
    // terminal is empty
}
```

Returns the capacity used by the specified resource. For a general purpose store, it returns total used capacity if `resource` is undefined.

{% api_method_params %}
resource (optional) : string
The type of the resource.
{% endapi_method_params %}

### Return value

Returns used capacity number, or `null` in case of a not valid `resource` for this store type.
