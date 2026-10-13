{% api_property destination 'RoomPosition | object' %}

If this is an **inter-room** portal, then this property contains a `RoomPosition` object
leading to the point in the destination room.

If this is an **inter-shard** portal, then this property contains an object with `shard` and `room` string properties.
Exact coordinates are undetermined, the creep will appear at any free spot in the destination room.
