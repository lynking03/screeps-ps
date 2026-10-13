{% api_property spawnCooldownTime number %}
```javascript
if(!(Game.powerCreeps['PowerCreep1'].spawnCooldownTime > Date.now())) {
    Game.powerCreeps['PowerCreep1'].spawn(powerSpawn);
}
```
The timestamp when spawning or deleting this creep will become available.
Undefined if the power creep is spawned in the world.
