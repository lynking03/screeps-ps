{% api_property Game.shard.access 'boolean' %}

Whether you currently have access to this shard. Always `true` on non-restricted shards. On restricted shards, requires either an active [`ACCESS_KEY`](#Constants) resource or an unlimited access subscription. Use [`Game.shard.activateAccess`](#Game.shard.activateAccess) to activate access.
