# StructureFactory: part 2 of 2
Module: `Screeps.Internal.StructureFactory.Part2`
Files: `src/Screeps/Internal/StructureFactory/Part2.purs` and `src/Screeps/Internal/StructureFactory/Part2.js`
Bind ONLY these members: produce
Other parts bind the rest of StructureFactory. Do not bind anything not listed above.

## About StructureFactory

Produces trade commodities from base minerals and other commodities. Learn more about commodities from [this article](/resources.html#Commodities).

Inherits from OwnedStructure: those members are bound elsewhere.

## Members

{% api_method produce 'resourceType' A %}

```javascript
factory.produce(RESOURCE_UTRIUM_BAR);
```

Produces the specified commodity. All ingredients should be available in the factory store.

{% api_method_params %}
resourceType : string
One of the RESOURCE_* constants.
{% endapi_method_params %}

### Return value

One of the following codes:
{% api_return_codes %}
OK | The operation has been scheduled successfully.
ERR_NOT_OWNER | You are not the owner of this structure.
ERR_RCL_NOT_ENOUGH | Your Room Controller level is insufficient to use the factory.
ERR_NOT_ENOUGH_RESOURCES | The structure does not have the required amount of resources.
ERR_INVALID_ARGS | The arguments provided are incorrect.
ERR_INVALID_TARGET | The factory cannot produce the commodity of this level.
ERR_TIRED | The factory is still cooling down.
ERR_BUSY | The factory is not operated by the `PWR_OPERATE_FACTORY` power.
ERR_FULL | The factory cannot contain the produce.
{% endapi_return_codes %}
