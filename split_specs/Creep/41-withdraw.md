{% api_method withdraw 'target, resourceType, [amount]' A %}

```javascript
if(creep.withdraw(storage, RESOURCE_ENERGY) == ERR_NOT_IN_RANGE) {
	creep.moveTo(storage);
}
```

Withdraw resources from a structure or tombstone. The target has to be at adjacent square to the creep. Multiple creeps can withdraw from the same object in the same tick. Your creeps can withdraw resources from hostile structures/tombstones as well, in case if there is no hostile rampart on top of it.

This method should not be used to transfer resources between creeps. To transfer between creeps, use the [`transfer`](#Creep.transfer) method on the original creep.

{% api_method_params %}
target : Structure, Tombstone, Ruin
The target object.
===
resourceType : string
One of the RESOURCE_* constants.
===
amount (optional) : number
The amount of resources to be transferred. If omitted, all the available amount is used.
{% endapi_method_params %}

### Return value

One of the following codes:
{% api_return_codes %}
OK | The operation has been scheduled successfully.
ERR_NOT_OWNER | You are not the owner of this creep, or there is a hostile rampart on top of the target.
ERR_BUSY | The creep is still being spawned.
ERR_NOT_ENOUGH_RESOURCES | The target does not have the given amount of resources.
ERR_INVALID_TARGET | The target is not a valid object which can contain the specified resource.
ERR_FULL | The creep's carry is full.
ERR_NOT_IN_RANGE | The target is too far away.
ERR_INVALID_ARGS | The resourceType is not one of the RESOURCE_* constants, or the amount is incorrect.
{% endapi_return_codes %}
