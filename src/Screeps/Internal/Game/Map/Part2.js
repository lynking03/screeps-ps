export const getRoomLinearDistanceImpl = (roomName1, roomName2) => Game.map.getRoomLinearDistance(roomName1, roomName2);
export const getRoomLinearDistanceContinuousImpl = (roomName1, roomName2, continuous) => Game.map.getRoomLinearDistance(roomName1, roomName2, continuous);
export const getRoomTerrainImpl = (roomName) => Game.map.getRoomTerrain(roomName);
export const getWorldSize = () => Game.map.getWorldSize();
