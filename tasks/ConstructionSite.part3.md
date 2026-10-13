# ConstructionSite: part 3 of 3
Module: `Screeps.Internal.ConstructionSite.Part3`
Files: `src/Screeps/Internal/ConstructionSite/Part3.purs` and `src/Screeps/Internal/ConstructionSite/Part3.js`
Bind ONLY these members: remove
Other parts bind the rest of ConstructionSite. Do not bind anything not listed above.

## About ConstructionSite

A site of a structure which is currently under construction. A construction site can be created using the 'Construct' button at the left of the game field or the [`Room.createConstructionSite`](#Room.createConstructionSite) method.

To build a structure on the construction site, give a worker creep some amount of energy and perform [`Creep.build`](#Creep.build) action.

You can remove enemy construction sites by moving a creep on it.

Inherits from RoomObject: those members are bound elsewhere.

## Members

{% api_method remove '' A %}

Remove the construction site.

### Return value

One of the following codes:
{% api_return_codes %}
OK | The operation has been scheduled successfully.
ERR_NOT_OWNER | You are not the owner of this construction site, and it's not in your room.
{% endapi_return_codes %}
