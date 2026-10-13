{% api_method setPosition 'x,y|pos' A %}

```javascript
Game.flags.Flag1.setPosition(10,20);
```

```javascript
Game.flags.Flag1.setPosition( new RoomPosition(10, 20, 'W3S5') );
```

Set new position of the flag.

{% api_method_params %}
x : number
The X position in the room.
===
y : number
The Y position in the room.
===
pos : object
Can be a RoomPosition object or any object containing RoomPosition.
{% endapi_method_params %}

### Return value

One of the following codes:
{% api_return_codes %}
OK | The operation has been scheduled successfully.
ERR_INVALID_TARGET | The target provided is invalid.
{% endapi_return_codes %}
