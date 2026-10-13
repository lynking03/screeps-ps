# StructureController: part 1 of 5
Module: `Screeps.Internal.StructureController.Part1`
Files: `src/Screeps/Internal/StructureController/Part1.purs` and `src/Screeps/Internal/StructureController/Part1.js`
Bind ONLY these members: isPowerEnabled, level, progress
Other parts bind the rest of StructureController. Do not bind anything not listed above.

## About StructureController

Claim this structure to take control over the room. The controller structure cannot be damaged or destroyed.

It can be addressed by [`Room.controller`](#Room.controller) property.

### Safe mode

Inherits from OwnedStructure: those members are bound elsewhere.

## Members

{% api_property isPowerEnabled 'boolean' %}
Whether using power is enabled in this room. Use [`PowerCreep.enableRoom`](#PowerCreep.enableRoom) to turn powers on.

{% api_property level 'number' %}

Current controller level, from 0 to 8.

{% api_property progress 'number' %}

The current progress of upgrading the controller to the next level.
