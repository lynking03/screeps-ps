{% api_property store 'Store' %}

```javascript
if(creep.store[RESOURCE_ENERGY] < creep.store.getCapacity()) {
    goHarvest(creep);
}
```

A [`Store`](#Store) object that contains cargo of this creep.
