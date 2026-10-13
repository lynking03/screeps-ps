# ConstructionSite: part 1 of 3
Module: `Screeps.Internal.ConstructionSite.Part1`
Files: `src/Screeps/Internal/ConstructionSite/Part1.purs` and `src/Screeps/Internal/ConstructionSite/Part1.js`
Bind ONLY these members: id, my, owner
Other parts bind the rest of ConstructionSite. Do not bind anything not listed above.

## About ConstructionSite

A site of a structure which is currently under construction. A construction site can be created using the 'Construct' button at the left of the game field or the [`Room.createConstructionSite`](#Room.createConstructionSite) method.

To build a structure on the construction site, give a worker creep some amount of energy and perform [`Creep.build`](#Creep.build) action.

You can remove enemy construction sites by moving a creep on it.

Inherits from RoomObject: those members are bound elsewhere.

## Members

{% api_property id string %}

A unique object identificator. You can use Game.getObjectById method to retrieve an object instance by its id.

{% api_property my boolean %}

Whether this is your own construction site.

{% api_property owner object %}

An object with the structure’s owner info containing the following properties:

{% api_method_params %}
username : string
The name of the owner user.
{% endapi_method_params %}
