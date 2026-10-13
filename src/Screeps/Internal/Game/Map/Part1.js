export const describeExitsImpl = (roomName) => Game.map.describeExits(roomName);

export const findExitImpl = (left, right, fromRoom, toRoom, opts) => {
  const r = Game.map.findExit(fromRoom, toRoom, opts);
  return (typeof r === "number" && r < 0) ? left(r) : right(r);
};

export const findRouteImpl = (left, right, fromRoom, toRoom, opts) => {
  const r = Game.map.findRoute(fromRoom, toRoom, opts);
  return (typeof r === "number" && r < 0) ? left(r) : right(r);
};
