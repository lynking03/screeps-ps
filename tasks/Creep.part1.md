# Creep: part 1 of 14
Module: `Screeps.Internal.Creep.Part1`
Files: `src/Screeps/Internal/Creep/Part1.purs` and `src/Screeps/Internal/Creep/Part1.js`
Bind ONLY these members: body, fatigue, hits
Other parts bind the rest of Creep. Do not bind anything not listed above.

## About Creep

Creeps are your units. Creeps can move, harvest energy, construct structures, attack another creeps, and perform other actions. Each creep consists of up to 50 body parts with the following possible types:

Inherits from RoomObject: those members are bound elsewhere.

## Members

{% api_property body array %}

An array describing the creep’s body. Each element contains the following properties:

{% api_method_params %}
boost : string | undefined
If the body part is boosted, this property specifies the mineral type which is used for boosting. One of the RESOURCE_* constants. Learn more
===
type : string
One of the body part types constants.
===
hits : number
The remaining amount of hit points of this body part.
{% endapi_method_params %}

{% api_property fatigue number %}

The movement fatigue indicator. If it is greater than zero, the creep cannot move.

{% api_property hits number %}

The current amount of hit points of the creep.
