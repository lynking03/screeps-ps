{% api_method PathFinder.CostMatrix.deserialize 'val' 1 %}

```javascript
let costs = PathFinder.CostMatrix.deserialize(Memory.savedMatrix)
```

Static method which deserializes a new CostMatrix using the return value of serialize.

{% api_method_params %}
val : object
Whatever serialize returned
{% endapi_method_params %}

### Return value

Returns new
CostMatrix
instance.
