`InterShardMemory` object provides an interface for communicating between shards. Your script is executed separatedly
on each shard, and their [`Memory`](#Memory) objects are isolated from each other. In order to pass messages and
data between shards, you need to use `InterShardMemory` instead.

Every shard can have its own 100 KB of data in string format that can be accessed by all other shards.
A shard can write only to its own data, other shards' data is read-only.

This data has nothing to do with `Memory` contents, it's a separate data container.
