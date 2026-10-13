# Flag: part 1 of 3
Module: `Screeps.Internal.Flag.Part1`
Files: `src/Screeps/Internal/Flag/Part1.purs` and `src/Screeps/Internal/Flag/Part1.js`
Bind ONLY these members: color, memory, name
Other parts bind the rest of Flag. Do not bind anything not listed above.

## About Flag

A flag. Flags can be used to mark particular spots in a room. Flags are visible to their owners only. You cannot have more than 10,000 flags.

Inherits from RoomObject: those members are bound elsewhere.

## Members

{% api_property color number %}

Flag primary color. One of the COLOR_* constants.

{% api_property memory any %}

A shorthand to Memory.flags[flag.name]. You can use it for quick access the flag's specific memory data object.

{% api_property name string %}

Flag’s name. You can choose the name while creating a new flag, and it cannot be changed later. This name is a hash key to access the flag via the Game.flags object. The maximum name length is 100 charactes.
