# Game.cpu: part 1 of 4
Module: `Screeps.Internal.Game.Cpu.Part1`
Files: `src/Screeps/Internal/Game/Cpu/Part1.purs` and `src/Screeps/Internal/Game/Cpu/Part1.js`
Bind ONLY these members: Game.cpu.limit, Game.cpu.tickLimit, Game.cpu.bucket
Other parts bind the rest of Game.cpu. Do not bind anything not listed above.

## About Game.cpu

A global object containing information about your CPU usage.

## Members

{% api_property Game.cpu.limit 'number' %}

Your assigned CPU limit for the current shard.

{% api_property Game.cpu.tickLimit 'number' %}

An amount of available CPU time at the current game tick. Usually it is higher than Game.cpu.limit. Learn more

{% api_property Game.cpu.bucket 'number' %}

An amount of unused CPU accumulated in your bucket.
