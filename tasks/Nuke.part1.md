# Nuke: part 1 of 1
Module: `Screeps.Internal.Nuke.Part1`
Files: `src/Screeps/Internal/Nuke/Part1.purs` and `src/Screeps/Internal/Nuke/Part1.js`
Bind ONLY these members: id, launchRoomName, timeToLand

## About Nuke

A nuke landing position. This object cannot be removed or modified. You can find incoming nukes in the room using the `FIND_NUKES` constant.

Inherits from RoomObject: those members are bound elsewhere.

## Members

{% api_property id 'string' %}

A unique object identificator. You can use Game.getObjectById method to retrieve an object instance by its id.

{% api_property launchRoomName 'string' %}

The name of the room where this nuke has been launched from.

{% api_property timeToLand 'number' %}

The remaining landing time.
