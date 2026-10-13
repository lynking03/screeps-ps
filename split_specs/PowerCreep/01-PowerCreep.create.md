{% api_method PowerCreep.create 'name, className' 1 %}

```javascript
PowerCreep.create('PowerCreep1', POWER_CLASS.OPERATOR);
```

A static method to create new Power Creep instance in your account. It will be added in an unspawned state,
use [`spawn`](#PowerCreep.spawn) method to spawn it in the world.

You need one free Power Level in your account to perform this action.

{% api_method_params %}
name : string
The name of the new power creep. The name length limit is 100 characters.
===
className : string
The class of the new power creep, one of the `POWER_CLASS` constants.
{% endapi_method_params %}

### Return value

One of the following codes:
{% api_return_codes %}
OK | The operation has been scheduled successfully.
ERR_NOT_ENOUGH_RESOURCES | You don't have free Power Levels in your account.
ERR_INVALID_ARGS | The provided power creep name is exceeds the limit, or the power creep class is invalid.
ERR_NAME_EXISTS | A power creep with the specified name already exists.
{% endapi_return_codes %}
