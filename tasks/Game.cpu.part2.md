# Game.cpu: part 2 of 4
Module: `Screeps.Internal.Game.Cpu.Part2`
Files: `src/Screeps/Internal/Game/Cpu/Part2.purs` and `src/Screeps/Internal/Game/Cpu/Part2.js`
Bind ONLY these members: 'Game.cpu.shardLimits', Game.cpu.unlocked, Game.cpu.unlockedTime
Other parts bind the rest of Game.cpu. Do not bind anything not listed above.

## About Game.cpu

A global object containing information about your CPU usage.

## Members

{% api_property 'Game.cpu.shardLimits' 'object<string,number>' %}

An object with limits for each shard with shard names as keys. You can use [`setShardLimits`](#Game.cpu.setShardLimits) method to re-assign them.

{% api_property Game.cpu.unlocked 'boolean' %}

Whether full CPU is currently unlocked for your account.

{% api_property Game.cpu.unlockedTime 'number' %}

The time in milliseconds since UNIX epoch time until full CPU is unlocked for your account. This property is not defined when full CPU is not unlocked for your account or it's unlocked with a subscription.
