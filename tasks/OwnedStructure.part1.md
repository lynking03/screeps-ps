# OwnedStructure: part 1 of 1
Module: `Screeps.Internal.OwnedStructure.Part1`
Files: `src/Screeps/Internal/OwnedStructure/Part1.purs` and `src/Screeps/Internal/OwnedStructure/Part1.js`
Bind ONLY these members: my, owner

## About OwnedStructure

The base prototype for a structure that has an owner.
Such structures can be found using `FIND_MY_STRUCTURES` and `FIND_HOSTILE_STRUCTURES` constants.

Inherits from Structure: those members are bound elsewhere.

## Members

{% api_property my 'boolean' %}

Whether this is your own structure.

{% api_property owner 'object' %}

An object with the structure’s owner info containing the following properties:

{% api_method_params %}
username : string
The name of the owner user.
{% endapi_method_params %}
