# Creep: part 3 of 14
Module: `Screeps.Internal.Creep.Part3`
Files: `src/Screeps/Internal/Creep/Part3.purs` and `src/Screeps/Internal/Creep/Part3.js`
Bind ONLY these members: my, name, owner
Other parts bind the rest of Creep. Do not bind anything not listed above.

## About Creep

Creeps are your units. Creeps can move, harvest energy, construct structures, attack another creeps, and perform other actions. Each creep consists of up to 50 body parts with the following possible types:

Inherits from RoomObject: those members are bound elsewhere.

## Members

{% api_property my boolean %}

Whether it is your creep or foe.

{% api_property name string %}

Creep’s name. You can choose the name while creating a new creep, and it cannot be changed later. This name is a hash key to access the creep via the Game.creeps object.

{% api_property owner object %}

An object with the creep’s owner info containing the following properties:

{% api_method_params %}
username : string
The name of the owner user.
{% endapi_method_params %}
