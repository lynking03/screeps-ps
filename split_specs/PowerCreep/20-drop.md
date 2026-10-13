{% api_method drop 'resourceType, [amount]' A %}

```javascript
creep.drop(RESOURCE_ENERGY);
```

```javascript
// drop all resources
for(const resourceType in creep.carry) {
	creep.drop(resourceType);
}
```

Drop this resource on the ground.

{% api_method_params %}
resourceType : string
One of the RESOURCE_* constants.
===
amount (optional) : number
The amount of resource units to be dropped. If omitted, all the available carried amount is used.
{% endapi_method_params %}

### Return value

One of the following codes:
{% api_return_codes %}
OK | The operation has been scheduled successfully.
ERR_NOT_OWNER | You are not the owner of this creep.
ERR_BUSY | The power creep is not spawned in the world.
ERR_INVALID_ARGS | The resourceType is not a valid RESOURCE_* constants.
ERR_NOT_ENOUGH_RESOURCES | The creep does not have the given amount of energy.
{% endapi_return_codes %}

```javascript
Game.powerCreeps['PowerCreep1'].usePower(PWR_GENERATE_OPS);
```
