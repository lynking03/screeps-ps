{% api_method moveTo 'x, y, [opts]|target, [opts]' 3 %}

```javascript
creep.moveTo(10, 20);
```

```javascript
creep.moveTo(Game.flags.Flag1);
```

```javascript
creep.moveTo(new RoomPosition(25, 20, 'W10N5'));
```

```javascript
creep.moveTo(pos, {reusePath: 50});
```

```javascript
// Execute moves by cached paths at first
for(const name in Game.creeps) {
    Game.creeps[name].moveTo(target, {noPathFinding: true});
}

// Perform pathfinding only if we have enough CPU
if(Game.cpu.tickLimit - Game.cpu.getUsed() > 20) {
    for(const name in Game.creeps) {
        Game.creeps[name].moveTo(target);
    }
}
```

Find the optimal path to the target within the same room and move to it. A shorthand to consequent calls of pos.findPathTo() and move() methods. If the target is in another room, then the corresponding exit will be used as a target.

{% api_method_params %}
x : number
X position of the target in the same room.
===
y : number
Y position of the target in the same room.
===
target : object
Can be a RoomPosition object or any object containing RoomPosition. The position doesn't have to be in the same room with the creep.
===
opts (optional) : object
An object containing additional options:

- reusePath : number — This option enables reusing the path found along multiple game ticks. It allows to save CPU time, but can result in a slightly slower creep reaction behavior. The path is stored into the creep's memory to the _move property. The reusePath value defines the amount of ticks which the path should be reused for. The default value is 5. Increase the amount to save more CPU, decrease to make the movement more consistent. Set to 0 if you want to disable path reusing.

- serializeMemory : boolean — If reusePath is enabled and this option is set to true, the path will be stored in memory in the short serialized form using Room.serializePath. The default value is true.

- noPathFinding : boolean — If this option is set to true, moveTo method will return ERR_NOT_FOUND if there is no memorized path to reuse. This can significantly save CPU time in some cases. The default value is false.

- visualizePathStyle : object — Draw a line along the creep’s path using RoomVisual.poly. You can provide either an empty object or custom style parameters. The default style is equivalent to:

{
fill: 'transparent',
stroke: '#fff',
lineStyle: 'dashed',
strokeWidth: .15,
opacity: .1
}

Any options supported by Room.findPath method.

{% endapi_method_params %}

### Return value

One of the following codes:
{% api_return_codes %}
OK | The operation has been scheduled successfully.
ERR_NOT_OWNER | You are not the owner of this creep.
ERR_BUSY | The power creep is not spawned in the world.
ERR_TIRED | The fatigue indicator of the creep is non-zero.
ERR_INVALID_TARGET | The target provided is invalid.
ERR_NO_PATH | No path to the target could be found.
ERR_NOT_FOUND | The creep has no memorized path to reuse.
{% endapi_return_codes %}
