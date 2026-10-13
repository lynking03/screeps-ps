# StructureController: part 2 of 5
Module: `Screeps.Internal.StructureController.Part2`
Files: `src/Screeps/Internal/StructureController/Part2.purs` and `src/Screeps/Internal/StructureController/Part2.js`
Bind ONLY these members: progressTotal, reservation, safeMode
Other parts bind the rest of StructureController. Do not bind anything not listed above.

## About StructureController

Claim this structure to take control over the room. The controller structure cannot be damaged or destroyed.

It can be addressed by [`Room.controller`](#Room.controller) property.

### Safe mode

Inherits from OwnedStructure: those members are bound elsewhere.

## Members

{% api_property progressTotal 'number' %}

The progress needed to reach the next level.

{% api_property reservation 'object' %}

An object with the controller reservation info if present:

{% api_method_params %}
username : string
The name of a player who reserved this controller.
===
ticksToEnd : number
The amount of game ticks when the reservation will end.
{% endapi_method_params %}

{% api_property safeMode 'number' %}

How many ticks of safe mode remaining, or undefined.
