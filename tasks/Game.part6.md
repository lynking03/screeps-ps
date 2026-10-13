# Game: part 6 of 6
Module: `Screeps.Internal.Game.Part6`
Files: `src/Screeps/Internal/Game/Part6.purs` and `src/Screeps/Internal/Game/Part6.js`
Bind ONLY these members: Game.getObjectById, Game.notify
Other parts bind the rest of Game. Do not bind anything not listed above.

## About Game

The main global game object containing all the game play information.

## Members

{% api_method Game.getObjectById 'id' 1 %}

```javascript
creep.memory.sourceId = creep.pos.findClosestByRange(FIND_SOURCES).id;
const source = Game.getObjectById(creep.memory.sourceId);
```

Get an object with the specified unique ID. It may be a game object of any type. Only objects from the rooms which are visible to you can be accessed.

{% api_method_params %}
id : string
The unique identificator.
{% endapi_method_params %}

### Return value

Returns an object instance or null if it cannot be found.

{% api_method Game.notify 'message, [groupInterval]' A %}

```javascript
if(creep.hits < creep.memory.lastHits) {
    Game.notify('Creep '+creep+' has been attacked at '+creep.pos+'!');
}
creep.memory.lastHits = creep.hits;
```

```javascript
if(Game.spawns['Spawn1'].energy == 0) {
    Game.notify(
        'Spawn1 is out of energy',
        180  // group these notifications for 3 hours
    );
}

```

Send a custom message at your profile email. This way, you can set up notifications to yourself on any occasion within the game. You can schedule up to 20 notifications during one game tick. Not available in the Simulation Room.

{% api_method_params %}
message : string
Custom text which will be sent in the message. Maximum length is 1000 characters.
===
groupInterval : number
If set to 0 (default), the notification will be scheduled immediately. Otherwise, it will be grouped with other notifications and mailed out later using the specified time in minutes.
{% endapi_method_params %}
