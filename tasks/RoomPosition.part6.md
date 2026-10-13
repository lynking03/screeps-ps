# RoomPosition: part 6 of 6
Module: `Screeps.Internal.RoomPosition.Part6`
Files: `src/Screeps/Internal/RoomPosition/Part6.purs` and `src/Screeps/Internal/RoomPosition/Part6.js`
Bind ONLY these members: look, lookFor
Other parts bind the rest of RoomPosition. Do not bind anything not listed above.

## About RoomPosition

An object representing the specified position in the room. Every `RoomObject` in the room
contains `RoomPosition` as the `pos` property. The position object of a custom location
can be obtained using the [`Room.getPositionAt`](#Room.getPositionAt) method or using the constructor.

## Members

{% api_method look '' 2 %}

```javascript
const look = Game.flags.Flag1.pos.look();
look.forEach(function(lookObject) {
    if(lookObject.type == LOOK_CREEPS &&
       lookObject[LOOK_CREEPS].getActiveBodyparts(ATTACK) == 0) {
        creep.moveTo(lookObject.creep);
    }
});
```

Get the list of objects at the specified room position.

### Return value

An array with objects at the specified position in the following format:

```javascript-content
[
    { type: 'creep', creep: {...} },
    { type: 'structure', structure: {...} },
    ...
    { type: 'terrain', terrain: 'swamp' }
]
```

{% api_method lookFor 'type' 1 %}

```javascript
const found = Game.flags.Flag1.pos.lookFor(LOOK_CREEPS);
if(found.length && found[0].getActiveBodyparts(ATTACK) == 0) {
    creep.moveTo(found[0]);
}
```

Get an object with the given type at the specified room position.

{% api_method_params %}
type : string
One of the LOOK_* constants.
{% endapi_method_params %}

### Return value

An array of objects of the given type at the specified position if found.
