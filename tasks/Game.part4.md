# Game: part 4 of 6
Module: `Screeps.Internal.Game.Part4`
Files: `src/Screeps/Internal/Game/Part4.purs` and `src/Screeps/Internal/Game/Part4.js`
Bind ONLY these members: Game.resources, Game.rooms, Game.shard
Other parts bind the rest of Game. Do not bind anything not listed above.

## About Game

The main global game object containing all the game play information.

## Members

{% api_property Game.resources 'object' %}

An object with your global resources that are bound to the account, like pixels or cpu unlocks. Each object key is a resource constant, values are resources amounts.

{% api_property Game.rooms 'object<string, Room>' %}

A hash containing all the rooms available to you with room names as hash keys. A room is visible if you have a creep or an owned structure in it.

{% api_property Game.shard 'object' %}

A global object describing the world shard where your script is currently being executed in. See the [documentation](#Game-shard) below.
