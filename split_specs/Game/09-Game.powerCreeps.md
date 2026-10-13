{% api_property Game.powerCreeps 'object<string, PowerCreep>' %}

```javascript
Game.powerCreeps['PC1'].moveTo(flag);
```

A hash containing all your power creeps with their names as hash keys. Even power creeps
not spawned in the world can be accessed here.
