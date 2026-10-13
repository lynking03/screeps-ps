# Room: part 7 of 8
Module: `Screeps.Internal.Room.Part7`
Files: `src/Screeps/Internal/Room/Part7.purs` and `src/Screeps/Internal/Room/Part7.js`
Bind ONLY these members: lookAt, lookAtArea, lookForAt
Other parts bind the rest of Room. Do not bind anything not listed above.

## About Room

An object representing the room in which your units and structures are in.
It can be used to look around, find paths, etc. Every `RoomObject` in the room contains
its linked `Room` instance in the `room` property.

## Members

{% api_method lookAt 'x, y|target' 2 %}

```javascript
const look = creep.room.lookAt(target);
look.forEach(function(lookObject) {
    if(lookObject.type == LOOK_CREEPS &&
       lookObject[LOOK_CREEPS].getActiveBodyparts(ATTACK) == 0) {
        creep.moveTo(lookObject.creep);
    }
});
```

Get the list of objects at the specified room position.

{% api_method_params %}
x : number
X position in the room.
===
y : number
Y position in the room.
===
target : object
Can be a RoomPosition object or any object containing RoomPosition.
{% endapi_method_params %}

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

{% api_method lookAtArea 'top, left, bottom, right, [asArray]' 2 %}

```javascript
const look = creep.room.lookAtArea(10,5,11,7);
```

Get the list of objects at the specified room area.

{% api_method_params %}
top : number
The top Y boundary of the area.
===
left : number
The left X boundary of the area.
===
bottom : number
The bottom Y boundary of the area.
===
right : number
The right X boundary of the area.
===
asArray (optional) : boolean
Set to true if you want to get the result as a plain array.
{% endapi_method_params %}

### Return value

If `asArray` is set to false or undefined, the method returns
an object with all the objects in the specified area in the following format:

```javascript-content
// 10,5,11,7

{
    10: {
        5: [{ type: 'creep', creep: {...} },
            { type: 'terrain', terrain: 'swamp' }],
        6: [{ type: 'terrain', terrain: 'swamp' }],
        7: [{ type: 'terrain', terrain: 'swamp' }]
    },
    11: {
        5: [{ type: 'terrain', terrain: 'plain' }],
        6: [{ type: 'structure', structure: {...} },
            { type: 'terrain', terrain: 'swamp' }],
        7: [{ type: 'terrain', terrain: 'wall' }]
    }
}
```

If `asArray` is set to true, the method returns an array in the following format:

```javascript-content
[
    {x: 5, y: 10, type: 'creep', creep: {...}},
    {x: 5, y: 10, type: 'terrain', terrain: 'swamp'},
    {x: 6, y: 10, type: 'terrain', terrain: 'swamp'},
    {x: 7, y: 10, type: 'terrain', terrain: 'swamp'},
    {x: 5, y: 11, type: 'terrain', terrain: 'plain'},
    {x: 6, y: 11, type: 'structure', structure: {...}},
    {x: 6, y: 11, type: 'terrain', terrain: 'swamp'},
    {x: 7, y: 11, type: 'terrain', terrain: 'wall'}
]
```

{% api_method lookForAt 'type, x, y|type, target' 1 %}

```javascript
const found = creep.room.lookForAt(LOOK_CREEPS, target);
if(found.length && found[0].getActiveBodyparts(ATTACK) == 0) {
    creep.moveTo(found[0]);
}
```

Get an object with the given type at the specified room position.

{% api_method_params %}
type : string
One of the LOOK_* constants.
===
x : number
X position in the room.
===
y : number
Y position in the room.
===
target : object
Can be a RoomPosition object or any object containing RoomPosition.
{% endapi_method_params %}

### Return value

An array of objects of the given type at the specified position if found.
