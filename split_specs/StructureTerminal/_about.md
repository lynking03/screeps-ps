Sends any resources to a Terminal in another room. The destination Terminal can belong to any player.
Each transaction requires additional energy (regardless of the transfer resource type) that can be
calculated using [`Game.market.calcTransactionCost`](#Game.market.calcTransactionCost) method.
For example, sending 1000 mineral units from W0N0 to W10N5 will consume 742 energy units.
You can track your incoming and outgoing transactions using the [`Game.market`](#Game.market) object.
Only one Terminal per room is allowed that can be addressed by [`Room.terminal`](#Room.terminal) property.

Terminals are used in the [Market system](/market.html).

Inherits from OwnedStructure: those members are bound elsewhere.
