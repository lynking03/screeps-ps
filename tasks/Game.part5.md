# Game: part 5 of 6
Module: `Screeps.Internal.Game.Part5`
Files: `src/Screeps/Internal/Game/Part5.purs` and `src/Screeps/Internal/Game/Part5.js`
Bind ONLY these members: Game.spawns, Game.structures, Game.time
Other parts bind the rest of Game. Do not bind anything not listed above.

## About Game

The main global game object containing all the game play information.

## Members

{% api_property Game.spawns 'object<string, StructureSpawn>' %}

```javascript
for(const i in Game.spawns) {
    Game.spawns[i].createCreep(body);
}
```

A hash containing all your spawns with spawn names as hash keys.

{% api_property Game.structures 'object<string, Structure>' %}

A hash containing all your structures with structure id as hash keys.

{% api_property Game.time 'number' %}

```javascript
console.log(Game.time);
```

System game tick counter. It is automatically incremented on every tick. Learn more
