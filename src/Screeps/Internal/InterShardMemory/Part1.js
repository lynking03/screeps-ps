export const getLocalImpl = () => InterShardMemory.getLocal();
export const setLocalImpl = (value) => InterShardMemory.setLocal(value);
export const getRemoteImpl = (shard) => InterShardMemory.getRemote(shard);
