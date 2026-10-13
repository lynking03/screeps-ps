{% api_method serialize '' 1 %}

```javascript
let costs = new PathFinder.CostMatrix;
Memory.savedMatrix = costs.serialize();
```

Returns a compact representation of this CostMatrix which can be stored via JSON.stringify.

### Return value

An array of numbers. There's not much you can do with the numbers besides store them for later.
