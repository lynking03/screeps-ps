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
