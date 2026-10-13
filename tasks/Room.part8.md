# Room: part 8 of 8
Module: `Screeps.Internal.Room.Part8`
Files: `src/Screeps/Internal/Room/Part8.purs` and `src/Screeps/Internal/Room/Part8.js`
Bind ONLY these members: lookForAtArea
Other parts bind the rest of Room. Do not bind anything not listed above.

## About Room

An object representing the room in which your units and structures are in.
It can be used to look around, find paths, etc. Every `RoomObject` in the room contains
its linked `Room` instance in the `room` property.

## Members

{% api_method lookForAtArea 'type, top, left, bottom, right, [asArray]' 1 %}

```javascript
const look = creep.room.lookForAtArea(LOOK_STRUCTURES,10,5,11,7);
```

Get the list of objects with the given type at the specified room area.

{% api_method_params %}
type : string
One of the LOOK_* constants.
===
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

If `asArray` is set to false or undefined, the method returns an object
with all the objects of the given type in the specified area in the following format:

```javascript-content
// 10,5,11,7

{
    10: {
        5: [{...}],
        6: undefined,
        7: undefined
    },
    11: {
        5: undefined,
        6: [{...}, {...}],
        7: undefined
    }
}
```

If `asArray` is set to true, the method returns an array in the following format:

```javascript-content
[
	{x: 5, y: 10, structure: {...}},
	{x: 6, y: 11, structure: {...}},
	{x: 6, y: 11, structure: {...}}
]
```
