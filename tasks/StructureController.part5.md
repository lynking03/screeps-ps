# StructureController: part 5 of 5
Module: `Screeps.Internal.StructureController.Part5`
Files: `src/Screeps/Internal/StructureController/Part5.purs` and `src/Screeps/Internal/StructureController/Part5.js`
Bind ONLY these members: unclaim
Other parts bind the rest of StructureController. Do not bind anything not listed above.

## About StructureController

Claim this structure to take control over the room. The controller structure cannot be damaged or destroyed.

It can be addressed by [`Room.controller`](#Room.controller) property.

### Safe mode

Inherits from OwnedStructure: those members are bound elsewhere.

## Members

{% api_method unclaim '' A %}

```javascript
room.controller.unclaim();
```

Make your claimed controller neutral again.

### Return value

One of the following codes:
{% api_return_codes %}
OK | The operation has been scheduled successfully.
ERR_NOT_OWNER | You are not the owner of this controller.
{% endapi_return_codes %}
