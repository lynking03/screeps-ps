{% api_method Game.map.getRoomLinearDistance 'roomName1, roomName2, [continuous]' 0 %}

```javascript
Game.map.getRoomLinearDistance('W1N1', 'W4N2'); // 3
Game.map.getRoomLinearDistance('E65S55','W65S55', false) // 131
Game.map.getRoomLinearDistance('E65S55','W65S55', true) // 11
```

Get the linear distance (in rooms) between two rooms. You can use this function to estimate the energy cost of sending resources through terminals, or using observers and nukes.

{% api_method_params %}
roomName1 : string
The name of the first room.
===
roomName2 : string
The name of the second room.
===
continuous (optional) : boolean
Whether to treat the world map continuous on borders. Set to true if you want to calculate the trade or terminal send cost. Default is false.
{% endapi_method_params %}

### Return value

A number of rooms between the given two rooms.
