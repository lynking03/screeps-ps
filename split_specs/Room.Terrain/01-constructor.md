{% api_method constructor 'roomName' 0 %}

```javascript
const terrain = new Room.Terrain("E2S7");
```

```javascript
const terrain = new Room.Terrain(Game.creeps.John.room.name);
```

Creates a new `Terrain` of room by its name. `Terrain` objects can be constructed for any room in the world even if you have no access to it.

{% api_method_params %}
roomName : string
The room name.
{% endapi_method_params %}
