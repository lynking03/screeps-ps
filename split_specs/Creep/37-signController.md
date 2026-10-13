{% api_method signController 'target, text' A %}

```javascript
if(creep.room.controller) {
    if(creep.signController(creep.room.controller, "I'm going to claim this room in a few days. I warned ya!") == ERR_NOT_IN_RANGE) {
        creep.moveTo(creep.room.controller);
    }
}

```

Sign a controller with an arbitrary text visible to all players. This text will appear in the room UI, in the world map, and can be accessed via the API. You can sign unowned and hostile controllers. The target has to be at adjacent square to the creep. Pass an empty string to remove the sign.

{% api_method_params %}
target : StructureController
The target controller object to be signed.
===
text : string
The sign text. The string is cut off after 100 characters.
{% endapi_method_params %}

### Return value

One of the following codes:
{% api_return_codes %}
OK | The operation has been scheduled successfully.
ERR_BUSY | The creep is still being spawned.
ERR_INVALID_TARGET | The target is not a valid controller object.
ERR_NOT_IN_RANGE | The target is too far away.
{% endapi_return_codes %}
