export const lookForAtAreaImpl = (room, type, top, left, bottom, right) =>
  room.lookForAtArea(type, top, left, bottom, right);

export const lookForAtAreaAsArrayImpl = (room, type, top, left, bottom, right) =>
  room.lookForAtArea(type, top, left, bottom, right, true).map((e) => ({
    x: e.x,
    y: e.y,
    value: e[type],
  }));
