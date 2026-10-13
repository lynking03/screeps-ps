{% api_method constructor '[roomName]' 0 %}

```javascript
Game.rooms['W10N10'].visual.circle(10,20).line(0,0,10,20);
// the same as:
new RoomVisual('W10N10').circle(10,20).line(0,0,10,20);
```

```javascript
// this text will be displayed in all rooms
new RoomVisual().text('Some text', 1, 1, {align: 'left'}); 
```

You can directly create new RoomVisual object in any room, even if it's invisible to your script.

{% api_method_params %}
roomName (optional) : string
The room name. If undefined, visuals will be posted to all rooms simultaneously.
{% endapi_method_params %}
