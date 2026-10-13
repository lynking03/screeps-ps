{% api_method getEventLog '[raw]' 1 %}

```javascript
// track events performed by a particular creep
_.filter(creep.room.getEventLog(), {objectId: creep.id});
```

```javascript
// Find all hostile actions against your creeps and structures
_.forEach(Game.rooms, room => {
    let eventLog = room.getEventLog();
    let attackEvents = _.filter(eventLog, {event: EVENT_ATTACK});
    attackEvents.forEach(event => {
        let target = Game.getObjectById(event.data.targetId);
        if(target && target.my) {
            console.log(event);
        }
    });
});
```

Returns an array of events happened on the previous tick in this room.

{% api_method_params %}
raw (optional) : boolean
If this parameter is false or undefined, the method returns an object parsed using `JSON.parse` which incurs some CPU cost on the first access (the return value is cached on subsequent calls). If `raw` is truthy, then raw JSON in string format is returned.
{% endapi_method_params %}

### Return value

An array of events. Each event represents some game action in the following format:

```javascript-content
{
    event: EVENT_ATTACK,
    objectId: '54bff72ab32a10f73a57d017',
    data: { /* ... */ }
}
```

The `data` property is different for each event type according to the following table:

| event | description

| `EVENT_ATTACK`
|
A creep or a structure performed an attack to another object.

`targetId` - the target object ID

`damage` - the amount of hits damaged

`attackType` - one of the following constants:

`EVENT_ATTACK_TYPE_MELEE` - a creep attacked with [attack](#Creep.attack)

`EVENT_ATTACK_TYPE_RANGED` - a creep attacked with [rangedAttack](#Creep.rangedAttack), or a tower attacked with [attack](#StructureTower.attack)

`EVENT_ATTACK_TYPE_RANGED_MASS` - a creep attacked with [rangedMassAttack](#Creep.rangedMassAttack)

`EVENT_ATTACK_TYPE_DISMANTLE` - a creep attacked with [dismantle](#Creep.dismantle)

`EVENT_ATTACK_TYPE_HIT_BACK` - a creep hit back on another creep's [attack](#Creep.attack)

`EVENT_ATTACK_TYPE_NUKE` - a nuke landed

| `EVENT_OBJECT_DESTROYED`
|
A game object is destroyed or killed.

`type` - the type of the destroyed object

| `EVENT_ATTACK_CONTROLLER`
| A creep performed [`attackController`](#Creep.attackController) in the room.

| `EVENT_BUILD`
|
A creep performed [`build`](#Creep.build) in the room.

`targetId` - the target object ID

`amount` - the amount of build progress gained

`structureType` - one of the STRUCTURE_* constants

`x` - the X position of the target construction site

`y` - the Y position of the target construction site

`incomplete` - status of build progress

| `EVENT_HARVEST`
|
A creep performed [`harvest`](#Creep.harvest) in the room.

`targetId` - the target object ID

`amount` - the amount of resource harvested

| `EVENT_HEAL`
|
A creep or a tower healed a creep.

`targetId` - the target object ID

`amount` - the amount of hits healed

`healType` - one of the following constants:

`EVENT_HEAL_TYPE_MELEE` - a creep healed with [heal](#Creep.heal)

`EVENT_HEAL_TYPE_RANGED` - a creep healed with [rangedHeal](#Creep.rangedHeal), or a tower healed with [heal](#StructureTower.heal)

| `EVENT_REPAIR`
|
A creep or a tower repaired a structure.

`targetId` - the target object ID

`amount` - the amount of hits repaired

`energySpent` - the energy amount spent on the operation

| `EVENT_RESERVE_CONTROLLER`
|
A creep performed [`reserveController`](#Creep.reserveController) in the room.

`amount` - the amount of reservation time gained

| `EVENT_UPGRADE_CONTROLLER`
|
A creep performed [`upgradeController`](#Creep.upgradeController) in the room.

`amount` - the amount of control points gained

`energySpent` - the energy amount spent on the operation

| `EVENT_EXIT`
|
A creep moved to another room.

`room` - the name of the target room

`x`, `y` - the coordinates in another room where the creep has appeared

| `EVENT_TRANSFER`
|
A link performed [`transferEnergy`](https://docs.screeps.com/api/#StructureLink.transferEnergy) or a creep performed [`transfer`](#Creep.transfer) or [`withdraw`](#Creep.withdraw).

`targetId` - the target object ID

`resourceType` - the type of resource transferred

`amount` - the amount of resource transferred

| `EVENT_POWER`
|
Apply one the creep's powers on the specified target.

`targetId` - the target object ID

`power` - the power ability to use, one of the PWR_* constants
