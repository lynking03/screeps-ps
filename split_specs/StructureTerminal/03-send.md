{% api_method send 'resourceType, amount, destination, [description]' A %}

```javascript
Game.rooms['W1N1'].terminal.send(RESOURCE_UTRIUM, 100, 'W2N3',
	'trade contract #1');
```

Sends resource to a Terminal in another room with the specified name.

{% api_method_params %}
resourceType : string
One of the RESOURCE_* constants.
===
amount : number
The amount of resources to be sent.
===
destination : string
The name of the target room. You don't have to gain visibility in this room.
===
description (optional) : string
The description of the transaction. It is visible to the recipient. The maximum length is 100 characters.
{% endapi_method_params %}

### Return value

One of the following codes:
{% api_return_codes %}
OK | The operation has been scheduled successfully.
ERR_NOT_OWNER | You are not the owner of this structure.
ERR_NOT_ENOUGH_RESOURCES | The structure does not have the required amount of resources.
ERR_INVALID_ARGS | The arguments provided are incorrect.
ERR_TIRED | The terminal is still cooling down.
{% endapi_return_codes %}
