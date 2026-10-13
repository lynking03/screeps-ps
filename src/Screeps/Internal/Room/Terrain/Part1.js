export const newRoomTerrainImpl = (roomName) => new Room.Terrain(roomName);
export const getImpl = (t, x, y) => t.get(x, y);
export const getRawBufferImpl = (t) => t.getRawBuffer();
export const getRawBufferDestinationArrayImpl = (left, right, t, dest) => {
  const r = t.getRawBuffer(dest);
  return (typeof r === "number" && r < 0) ? left(r) : right(r);
};
