# StructureController: part 4 of 5
Module: `Screeps.Internal.StructureController.Part4`
Files: `src/Screeps/Internal/StructureController/Part4.purs` and `src/Screeps/Internal/StructureController/Part4.js`
Bind ONLY these members: ticksToDowngrade, upgradeBlocked, activateSafeMode
Other parts bind the rest of StructureController. Do not bind anything not listed above.

## About StructureController

Claim this structure to take control over the room. The controller structure cannot be damaged or destroyed.

It can be addressed by [`Room.controller`](#Room.controller) property.

### Safe mode

Inherits from OwnedStructure: those members are bound elsewhere.

## Members

{% api_property ticksToDowngrade 'number' %}

The amount of game ticks when this controller will lose one level. This timer is set to 50% on level upgrade or downgrade, and it can be increased by using Creep.upgradeController. Must be full to upgrade the controller to the next level.

{% api_property upgradeBlocked 'number' %}

The amount of game ticks while this controller cannot be upgraded due to attack. Safe mode is also unavailable during this period.

{% api_method activateSafeMode '' A %}

```javascript
room.controller.activateSafeMode();
```

Activate safe mode if available.

### Return value

One of the following codes:
{% api_return_codes %}
OK | The operation has been scheduled successfully.
ERR_NOT_OWNER | You are not the owner of this controller.
ERR_BUSY | There is another room in safe mode already.
ERR_NOT_ENOUGH_RESOURCES | There is no safe mode activations available.
ERR_TIRED | The previous safe mode is still cooling down, or the controller is `upgradeBlocked`, or the controller is downgraded for 50% plus 5000 ticks or more.
{% endapi_return_codes %}
