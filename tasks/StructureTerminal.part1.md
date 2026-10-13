# StructureTerminal: part 1 of 1
Module: `Screeps.Internal.StructureTerminal.Part1`
Files: `src/Screeps/Internal/StructureTerminal/Part1.purs` and `src/Screeps/Internal/StructureTerminal/Part1.js`
Bind ONLY these members: cooldown, store, send

## About StructureTerminal

Sends any resources to a Terminal in another room. The destination Terminal can belong to any player.
Each transaction requires additional energy (regardless of the transfer resource type) that can be
calculated using [`Game.market.calcTransactionCost`](#Game.market.calcTransactionCost) method.
For example, sending 1000 mineral units from W0N0 to W10N5 will consume 742 energy units.
You can track your incoming and outgoing transactions using the [`Game.market`](#Game.market) object.
Only one Terminal per room is allowed that can be addressed by [`Room.terminal`](#Room.terminal) property.

Terminals are used in the [Market system](/market.html).

Inherits from OwnedStructure: those members are bound elsewhere.

## Members

{% api_property cooldown 'number' %}

The remaining amount of ticks while this terminal cannot be used to make [`StructureTerminal.send`](#StructureTerminal.send) or [`Game.market.deal`](#Game.market.deal) calls.

{% api_property store 'Store' %}

A [`Store`](#Store) object that contains cargo of this structure.

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
