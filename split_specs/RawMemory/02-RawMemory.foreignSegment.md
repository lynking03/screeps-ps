{% api_property RawMemory.foreignSegment 'object' %}

```javascript
RawMemory.setActiveForeignSegment('player');
// on the next tick
console.log(RawMemory.foreignSegment); 
// --> {"username": "player", "id": 40, "data": "Hello!"} 

```

An object with a memory segment of another player available on this tick. Use [`setActiveForeignSegment`](#RawMemory.setActiveForeignSegment) to fetch segments on the next tick.
The object consists of the following properties:

{% api_method_params %}
username : string
Another player's name.
===
id : number
The ID of the requested memory segment.
===
data : string
The segment contents.
{% endapi_method_params %}
