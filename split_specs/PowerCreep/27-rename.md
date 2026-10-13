{% api_method rename 'name' 0 %}

```javascript
Game.powerCreeps['PC1'].rename('PC1X');
```

Rename the power creep. It must not be spawned in the world.

{% api_method_params %}
name : string
The new name of the power creep.
{% endapi_method_params %}

### Return value

One of the following codes:
{% api_return_codes %}
OK | The operation has been scheduled successfully.
ERR_NOT_OWNER | You are not the owner of the creep.
ERR_BUSY | The power creep is spawned in the world.
ERR_NAME_EXISTS | A power creep with the specified name already exists.
{% endapi_return_codes %}
