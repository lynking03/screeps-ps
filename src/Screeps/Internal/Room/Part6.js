export const getEventLogImpl = (room) => room.getEventLog();
export const getEventLogRawImpl = (room) => room.getEventLog(true);
export const getPositionAtImpl = (room, x, y) => room.getPositionAt(x, y);
export const getTerrainImpl = (room) => room.getTerrain();
