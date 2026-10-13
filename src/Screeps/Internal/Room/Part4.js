export const deserializePathImpl = (path) => Room.deserializePath(path);

export const createConstructionSiteImpl = (room, pos, structureType) => room.createConstructionSite(pos, structureType);
export const createConstructionSiteNameImpl = (room, pos, structureType, name) => room.createConstructionSite(pos, structureType, name);
export const createConstructionSiteXYImpl = (room, x, y, structureType) => room.createConstructionSite(x, y, structureType);
export const createConstructionSiteXYNameImpl = (room, x, y, structureType, name) => room.createConstructionSite(x, y, structureType, name);

export const createFlagImpl = (left, right, room, pos) => {
  const r = room.createFlag(pos);
  return (typeof r === "number" && r < 0) ? left(r) : right(r);
};
export const createFlagNameImpl = (left, right, room, pos, name) => {
  const r = room.createFlag(pos, name);
  return (typeof r === "number" && r < 0) ? left(r) : right(r);
};
export const createFlagNameColorImpl = (left, right, room, pos, name, color) => {
  const r = room.createFlag(pos, name, color);
  return (typeof r === "number" && r < 0) ? left(r) : right(r);
};
export const createFlagNameColorSecondaryColorImpl = (left, right, room, pos, name, color, secondaryColor) => {
  const r = room.createFlag(pos, name, color, secondaryColor);
  return (typeof r === "number" && r < 0) ? left(r) : right(r);
};

export const createFlagXYImpl = (left, right, room, x, y) => {
  const r = room.createFlag(x, y);
  return (typeof r === "number" && r < 0) ? left(r) : right(r);
};
export const createFlagXYNameImpl = (left, right, room, x, y, name) => {
  const r = room.createFlag(x, y, name);
  return (typeof r === "number" && r < 0) ? left(r) : right(r);
};
export const createFlagXYNameColorImpl = (left, right, room, x, y, name, color) => {
  const r = room.createFlag(x, y, name, color);
  return (typeof r === "number" && r < 0) ? left(r) : right(r);
};
export const createFlagXYNameColorSecondaryColorImpl = (left, right, room, x, y, name, color, secondaryColor) => {
  const r = room.createFlag(x, y, name, color, secondaryColor);
  return (typeof r === "number" && r < 0) ? left(r) : right(r);
};
