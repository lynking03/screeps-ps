# StructureController: part 3 of 5
Module: `Screeps.Internal.StructureController.Part3`
Files: `src/Screeps/Internal/StructureController/Part3.purs` and `src/Screeps/Internal/StructureController/Part3.js`
Bind ONLY these members: safeModeAvailable, safeModeCooldown, sign
Other parts bind the rest of StructureController. Do not bind anything not listed above.

## About StructureController

Claim this structure to take control over the room. The controller structure cannot be damaged or destroyed.

It can be addressed by [`Room.controller`](#Room.controller) property.

### Safe mode

Inherits from OwnedStructure: those members are bound elsewhere.

## Members

{% api_property safeModeAvailable 'number' %}

Safe mode activations available to use.

{% api_property safeModeCooldown 'number' %}

During this period in ticks new safe mode activations will be blocked, undefined if cooldown is inactive.

{% api_property sign 'object' %}

An object with the controller sign info if present:

{% api_method_params %}
username : string
The name of a player who signed this controller.
===
text : string
The sign text.
===
time : number
The sign time in game ticks.
===
datetime : Date
The sign real date.
{% endapi_method_params %}
