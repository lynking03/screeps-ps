# StructureLab: part 2 of 3
Module: `Screeps.Internal.StructureLab.Part2`
Files: `src/Screeps/Internal/StructureLab/Part2.purs` and `src/Screeps/Internal/StructureLab/Part2.js`
Bind ONLY these members: boostCreep, reverseReaction, runReaction
Other parts bind the rest of StructureLab. Do not bind anything not listed above.

## About StructureLab

Produces mineral compounds from base minerals, boosts and unboosts creeps.
Learn more about minerals from [this article](/resources.html).

Inherits from OwnedStructure: those members are bound elsewhere.

## Members

{% api_method boostCreep 'creep, [bodyPartsCount]' A %}

Boosts creep body parts using the containing mineral compound. The creep has to be at adjacent square to the lab. 

{% api_method_params %}
creep : Creep
The target creep.
===
bodyPartsCount (optional) : number
The number of body parts of the corresponding type to be boosted. Body parts are always counted left-to-right for TOUGH, and right-to-left for other types. If undefined, all the eligible body parts are boosted.
{% endapi_method_params %}

### Return value

One of the following codes:
{% api_return_codes %}
OK | The operation has been scheduled successfully.
ERR_NOT_OWNER | You are not the owner of this lab.
ERR_NOT_FOUND | The mineral containing in the lab cannot boost any of the creep's body parts.
ERR_NOT_ENOUGH_RESOURCES | The lab does not have enough energy or minerals.
ERR_INVALID_TARGET | The targets is not valid creep object.
ERR_NOT_IN_RANGE | The targets are too far away.
ERR_RCL_NOT_ENOUGH | Room Controller Level insufficient to use this structure.
{% endapi_return_codes %}

{% api_method reverseReaction 'lab1, lab2' A %}

Breaks mineral compounds back into reagents. The same output labs can be used by many source labs.

{% api_method_params %}
lab1 : StructureLab
The first result lab.
===
lab2 : StructureLab
The second result lab.
{% endapi_method_params %}

### Return value

One of the following codes:
{% api_return_codes %}
OK | The operation has been scheduled successfully.
ERR_NOT_OWNER | You are not the owner of this lab.
ERR_NOT_ENOUGH_RESOURCES | The source lab do not have enough resources.
ERR_INVALID_TARGET | The targets are not valid lab objects.
ERR_FULL | One of targets cannot receive any more resource.
ERR_NOT_IN_RANGE | The targets are too far away.
ERR_INVALID_ARGS | The reaction cannot be reversed into this resources.
ERR_TIRED | The lab is still cooling down.
ERR_RCL_NOT_ENOUGH | Room Controller Level insufficient to use this structure.
{% endapi_return_codes %}

{% api_method runReaction 'lab1, lab2' A %}

Produce mineral compounds using reagents from two other labs. The same input labs can be used by many output labs.

{% api_method_params %}
lab1 : StructureLab (lab)
The first source lab.
===
lab2 : StructureLab (lab)
The second source lab.
{% endapi_method_params %}

### Return value

One of the following codes:
{% api_return_codes %}
OK | The operation has been scheduled successfully.
ERR_NOT_OWNER | You are not the owner of this lab.
ERR_NOT_ENOUGH_RESOURCES | The source lab do not have enough resources.
ERR_INVALID_TARGET | The targets are not valid lab objects.
ERR_FULL | The target cannot receive any more resource.
ERR_NOT_IN_RANGE | The targets are too far away.
ERR_INVALID_ARGS | The reaction cannot be run using this resources.
ERR_TIRED | The lab is still cooling down.
ERR_RCL_NOT_ENOUGH | Room Controller Level insufficient to use this structure.
{% endapi_return_codes %}
