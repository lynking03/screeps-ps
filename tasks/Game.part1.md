# Game: part 1 of 6
Module: `Screeps.Internal.Game.Part1`
Files: `src/Screeps/Internal/Game/Part1.purs` and `src/Screeps/Internal/Game/Part1.js`
Bind ONLY these members: Game.constructionSites, Game.cpu, Game.creeps
Other parts bind the rest of Game. Do not bind anything not listed above.

## About Game

The main global game object containing all the game play information.

## Members

{% api_property Game.constructionSites 'object<string, ConstructionSite>' %}

A hash containing all your construction sites with their id as hash keys.

{% api_property Game.cpu 'object' %}

A global object containing information about your CPU usage and methods. See the [documentation](#Game-cpu) below.

{% api_property Game.creeps 'object<string, Creep>' %}

```javascript
for(const i in Game.creeps) {
    Game.creeps[i].moveTo(flag);
}
```

A hash containing all your creeps with creep names as hash keys.
