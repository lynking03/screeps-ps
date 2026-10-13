# Game.shard: part 1 of 2
Module: `Screeps.Internal.Game.Shard.Part1`
Files: `src/Screeps/Internal/Game/Shard/Part1.purs` and `src/Screeps/Internal/Game/Shard/Part1.js`
Bind ONLY these members: Game.shard.name, Game.shard.type, Game.shard.ptr
Other parts bind the rest of Game.shard. Do not bind anything not listed above.

## About Game.shard

An object describing the world shard where your script is currently being executed in.

## Members

{% api_property Game.shard.name 'string' %}

The name of the shard.

{% api_property Game.shard.type 'string' %}

Currently always equals to `normal`.

{% api_property Game.shard.ptr 'boolean' %}

Whether this shard belongs to the [PTR](/ptr.html).
