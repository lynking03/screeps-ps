# Deposit: part 2 of 2
Module: `Screeps.Internal.Deposit.Part2`
Files: `src/Screeps/Internal/Deposit/Part2.purs` and `src/Screeps/Internal/Deposit/Part2.js`
Bind ONLY these members: lastCooldown, ticksToDecay
Other parts bind the rest of Deposit. Do not bind anything not listed above.

## About Deposit

A rare resource deposit needed for producing commodities. Can be harvested by creeps with a `WORK` body part.
Each harvest operation triggers a cooldown period, which becomes longer and longer over time.

Learn more about deposits from [this article](/resources.html).

Inherits from RoomObject: those members are bound elsewhere.

## Members

{% api_property lastCooldown 'number' %}

The cooldown of the last harvest operation on this deposit.

{% api_property ticksToDecay 'number' %}

The amount of game ticks when this deposit will disappear.
