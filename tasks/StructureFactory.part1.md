# StructureFactory: part 1 of 2
Module: `Screeps.Internal.StructureFactory.Part1`
Files: `src/Screeps/Internal/StructureFactory/Part1.purs` and `src/Screeps/Internal/StructureFactory/Part1.js`
Bind ONLY these members: cooldown, level, store
Other parts bind the rest of StructureFactory. Do not bind anything not listed above.

## About StructureFactory

Produces trade commodities from base minerals and other commodities. Learn more about commodities from [this article](/resources.html#Commodities).

Inherits from OwnedStructure: those members are bound elsewhere.

## Members

{% api_property cooldown 'number' %}

The amount of game ticks the factory has to wait until the next production is possible.

{% api_property level number %}

```javascript
if(!factory.level) {
    Game.powerCreeps['MyOperator1'].usePower(PWR_OPERATE_FACTORY, factory);
}
```

The factory's level. Can be set by applying the `PWR_OPERATE_FACTORY` power to a newly built factory.
Once set, the level cannot be changed.

{% api_property store 'Store' %}

A [`Store`](#Store) object that contains cargo of this structure.
