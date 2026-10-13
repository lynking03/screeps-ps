{% api_method createConstructionSite 'structureType, [name]' A %}

```javascript
Game.flags['Flag1'].pos.createConstructionSite(STRUCTURE_ROAD);
```
```javascript
Game.flags['Flag1'].pos.createConstructionSite(STRUCTURE_SPAWN, 'MySpawn2');
```

Create new ConstructionSite at the specified location.

{% api_method_params %}
structureType : string
One of the STRUCTURE_* constants.
===
name (optional) : string
The name of the structure, for structures that support it (currently only spawns).
{% endapi_method_params %}

### Return value

One of the following codes:
{% api_return_codes %}
OK | The operation has been scheduled successfully.
ERR_INVALID_TARGET | The structure cannot be placed at the specified location.
ERR_FULL | You have too many construction sites. The maximum number of construction sites per player is 100.
ERR_INVALID_ARGS | The location is incorrect.
ERR_RCL_NOT_ENOUGH | Room Controller Level insufficient. Learn more
{% endapi_return_codes %}
