{% api_method harvest 'target' A %}

```javascript
const target = creep.pos.findClosestByRange(FIND_SOURCES_ACTIVE);
if(target) {
    if(creep.harvest(target) == ERR_NOT_IN_RANGE) {
        creep.moveTo(target);
    }
}

```

Harvest energy from the source or resources from minerals and deposits. Requires the WORK body part. If the creep has an empty CARRY body part, the harvested resource is put into it; otherwise it is dropped on the ground. The target has to be at an adjacent square to the creep.

{% api_method_params %}
target : Source, Mineral, Deposit
The object to be harvested.
{% endapi_method_params %}

### Return value

One of the following codes:
{% api_return_codes %}
OK | The operation has been scheduled successfully.
ERR_NOT_OWNER | You are not the owner of this creep, or the room controller is owned or reserved by another player.
ERR_BUSY | The creep is still being spawned.
ERR_NOT_FOUND | Extractor not found. You must build an extractor structure to harvest minerals. Learn more
ERR_NOT_ENOUGH_RESOURCES | The target does not contain any harvestable energy or mineral.
ERR_INVALID_TARGET | The target is not a valid source or mineral object.
ERR_NOT_IN_RANGE | The target is too far away.
ERR_TIRED | The extractor or the deposit is still cooling down.
ERR_NO_BODYPART | There are no WORK body parts in this creep’s body.
{% endapi_return_codes %}
