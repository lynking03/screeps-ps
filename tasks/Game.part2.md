# Game: part 2 of 6
Module: `Screeps.Internal.Game.Part2`
Files: `src/Screeps/Internal/Game/Part2.purs` and `src/Screeps/Internal/Game/Part2.js`
Bind ONLY these members: Game.flags, Game.gcl, Game.gpl
Other parts bind the rest of Game. Do not bind anything not listed above.

## About Game

The main global game object containing all the game play information.

## Members

{% api_property Game.flags 'object<string, Flag>' %}

```javascript
creep.moveTo(Game.flags.Flag1);
```

A hash containing all your flags with flag names as hash keys.

{% api_property Game.gcl 'object' %}

Your Global Control Level, an object with the following properties :

{% api_method_params %}
level : number
The current level.
===
progress : number
The current progress to the next level.
===
progressTotal : number
The progress required to reach the next level.
{% endapi_method_params %}

{% api_property Game.gpl 'object' %}

Your Global Power Level, an object with the following properties :

{% api_method_params %}
level : number
The current level.
===
progress : number
The current progress to the next level.
===
progressTotal : number
The progress required to reach the next level.
{% endapi_method_params %}
