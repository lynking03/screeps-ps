An object that can contain resources in its cargo.

There are two types of stores in the game: general purpose stores and limited stores.

* General purpose stores can contain any resource within its capacity (e.g. creeps, containers, storages, terminals).

* Limited stores can contain only a few types of resources needed for that particular object (e.g. spawns, extensions, labs, nukers).

The `Store` prototype is the same for both types of stores, but they have different behavior depending on the `resource` argument in its methods.

You can get specific resources from the store by addressing them as object properties:

```javascript-content
console.log(creep.store[RESOURCE_ENERGY]);
```
