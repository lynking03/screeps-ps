# Creep: part 13 of 14
Module: `Screeps.Internal.Creep.Part13`
Files: `src/Screeps/Internal/Creep/Part13.purs` and `src/Screeps/Internal/Creep/Part13.js`
Bind ONLY these members: signController, suicide, transfer
Other parts bind the rest of Creep. Do not bind anything not listed above.

## About Creep

Creeps are your units. Creeps can move, harvest energy, construct structures, attack another creeps, and perform other actions. Each creep consists of up to 50 body parts with the following possible types:

Inherits from RoomObject: those members are bound elsewhere.

## Members

{% api_method signController 'target, text' A %}

```javascript
if(creep.room.controller) {
    if(creep.signController(creep.room.controller, "I'm going to claim this room in a few days. I warned ya!") == ERR_NOT_IN_RANGE) {
        creep.moveTo(creep.room.controller);
    }
}

```

Sign a controller with an arbitrary text visible to all players. This text will appear in the room UI, in the world map, and can be accessed via the API. You can sign unowned and hostile controllers. The target has to be at adjacent square to the creep. Pass an empty string to remove the sign.

{% api_method_params %}
target : StructureController
The target controller object to be signed.
===
text : string
The sign text. The string is cut off after 100 characters.
{% endapi_method_params %}

### Return value

One of the following codes:
{% api_return_codes %}
OK | The operation has been scheduled successfully.
ERR_BUSY | The creep is still being spawned.
ERR_INVALID_TARGET | The target is not a valid controller object.
ERR_NOT_IN_RANGE | The target is too far away.
{% endapi_return_codes %}

{% api_method suicide '' A %}

Kill the creep immediately.

### Return value

One of the following codes:
{% api_return_codes %}
OK | The operation has been scheduled successfully.
ERR_NOT_OWNER | You are not the owner of this creep.
ERR_BUSY | The creep is still being spawned.
{% endapi_return_codes %}

{% api_method transfer 'target, resourceType, [amount]' A %}

```javascript
if(creep.transfer(storage, RESOURCE_ENERGY) == ERR_NOT_IN_RANGE) {
	creep.moveTo(storage);
}
```

```javascript
// transfer all resources
for(const resourceType in creep.carry) {
	creep.transfer(storage, resourceType);
}
```

Transfer resource from the creep to another object. The target has to be at adjacent square to the creep.

{% api_method_params %}
target : Creep, PowerCreep, Structure
The target object.
===
resourceType : string
One of the RESOURCE_* constants.
===
amount (optional) : number
The amount of resources to be transferred. If omitted, all the available carried amount is used.
{% endapi_method_params %}

### Return value

One of the following codes:
{% api_return_codes %}
OK | The operation has been scheduled successfully.
ERR_NOT_OWNER | You are not the owner of this creep.
ERR_BUSY | The creep is still being spawned.
ERR_NOT_ENOUGH_RESOURCES | The creep does not have the given amount of resources.
ERR_INVALID_TARGET | The target is not a valid object which can contain the specified resource.
ERR_FULL | The target cannot receive any more resources.
ERR_NOT_IN_RANGE | The target is too far away.
ERR_INVALID_ARGS | The resourceType is not one of the RESOURCE_* constants, or the amount is incorrect.
{% endapi_return_codes %}
