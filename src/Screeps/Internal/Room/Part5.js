export const findImpl = (room, type, opts) => room.find(type, opts);

export const findExitToImpl = (left, right, room, other) => {
  const r = room.findExitTo(other);
  return (typeof r === "number" && r < 0) ? left(r) : right(r);
};

export const findPathImpl = (room, fromPos, toPos, opts) => room.findPath(fromPos, toPos, opts);
