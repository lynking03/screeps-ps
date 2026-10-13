{% api_method Game.map.describeExits 'roomName' 1 %}

```javascript
const exits = Game.map.describeExits('W8N3');
```

List all exits available from the room with the given name.

{% api_method_params %}
roomName : string
The room name.
{% endapi_method_params %}

### Return value

The exits information in the following format, or null if the room not found.

```javascript-content
{
    "1": "W8N4",    // TOP
    "3": "W7N3",    // RIGHT
	"5": "W8N2",    // BOTTOM
	"7": "W9N3"     // LEFT
}
```
