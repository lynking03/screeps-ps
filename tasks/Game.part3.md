# Game: part 3 of 6
Module: `Screeps.Internal.Game.Part3`
Files: `src/Screeps/Internal/Game/Part3.purs` and `src/Screeps/Internal/Game/Part3.js`
Bind ONLY these members: Game.map, Game.market, Game.powerCreeps
Other parts bind the rest of Game. Do not bind anything not listed above.

## About Game

The main global game object containing all the game play information.

## Members

{% api_property Game.map object %}

A global object representing world map. See the [documentation](#Game-map) below.

{% api_property Game.market object %}

A global object representing the in-game market. See the [documentation](#Game-market) below.

{% api_property Game.powerCreeps 'object<string, PowerCreep>' %}

```javascript
Game.powerCreeps['PC1'].moveTo(flag);
```

A hash containing all your power creeps with their names as hash keys. Even power creeps
not spawned in the world can be accessed here.
