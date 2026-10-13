# Creep: part 9 of 14
Module: `Screeps.Internal.Creep.Part9`
Files: `src/Screeps/Internal/Creep/Part9.purs` and `src/Screeps/Internal/Creep/Part9.js`
Bind ONLY these members: move, moveByPath, moveTo
Other parts bind the rest of Creep. Do not bind anything not listed above.

## About Creep

Creeps are your units. Creeps can move, harvest energy, construct structures, attack another creeps, and perform other actions. Each creep consists of up to 50 body parts with the following possible types:

Inherits from RoomObject: those members are bound elsewhere.

## Members

{% api_method move 'direction' A %}

```javascript
creep.move(RIGHT);
```

```javascript
const path = creep.pos.findPathTo(Game.flags.Flag1);
if(path.length > 0) {
	creep.move(path[0].direction);
}
```

```javascript
creep1.move(TOP);
creep1.pull(creep2);
creep2.move(creep1);
```

Move the creep one square in the specified direction. Requires the MOVE body part, or another creep nearby pulling the creep. In case if you call move on a creep nearby, the ERR_TIRED and the ERR_NO_BODYPART checks will be bypassed; otherwise, the ERR_NOT_IN_RANGE check will be bypassed.

{% api_method_params %}
direction : Creep|number
A creep nearby, or one of the following constants:

TOP

TOP_RIGHT

RIGHT

BOTTOM_RIGHT

BOTTOM

BOTTOM_LEFT

LEFT

TOP_LEFT

{% endapi_method_params %}

### Return value

One of the following codes:
{% api_return_codes %}
OK | The operation has been scheduled successfully.
ERR_NOT_OWNER | You are not the owner of this creep.
ERR_BUSY | The creep is still being spawned.
ERR_TIRED | The fatigue indicator of the creep is non-zero.
ERR_NO_BODYPART | There are no MOVE body parts in this creep’s body.
ERR_INVALID_ARGS | The provided direction is incorrect.
ERR_NOT_IN_RANGE | The target creep is too far away
{% endapi_return_codes %}

{% api_method moveByPath 'path' A %}

```javascript
const path = spawn.room.findPath(spawn, source);
creep.moveByPath(path);
```

```javascript
if(!creep.memory.path) {
    creep.memory.path = creep.pos.findPathTo(target);
}
creep.moveByPath(creep.memory.path);
```

Move the creep using the specified predefined path. Requires the MOVE body part.

{% api_method_params %}
path : array|string
A path value as returned from Room.findPath, RoomPosition.findPathTo, or PathFinder.search methods. Both array form and serialized string form are accepted.
{% endapi_method_params %}

### Return value

One of the following codes:
{% api_return_codes %}
OK | The operation has been scheduled successfully.
ERR_NOT_OWNER | You are not the owner of this creep.
ERR_BUSY | The creep is still being spawned.
ERR_NOT_FOUND | The specified path doesn't match the creep's location.
ERR_INVALID_ARGS | path is not a valid path array.
ERR_TIRED | The fatigue indicator of the creep is non-zero.
ERR_NO_BODYPART | There are no MOVE body parts in this creep’s body.
{% endapi_return_codes %}

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

Find the optimal path to the target within the same room and move to it. A shorthand to consequent calls of pos.findPathTo() and move() methods. If the target is in another room, then the corresponding exit will be used as a target. Requires the MOVE body part.

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
ERR_BUSY | The creep is still being spawned.
ERR_TIRED | The fatigue indicator of the creep is non-zero.
ERR_NO_BODYPART | There are no MOVE body parts in this creep’s body.
ERR_INVALID_TARGET | The target provided is invalid.
ERR_NO_PATH | No path to the target could be found.
ERR_NOT_FOUND | The creep has no memorized path to reuse.
{% endapi_return_codes %}
