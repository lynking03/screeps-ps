export const y = (p) => p.y;

export const createConstructionSiteImpl = (p, structureType) => p.createConstructionSite(structureType);
export const createConstructionSiteNameImpl = (p, structureType, name) => p.createConstructionSite(structureType, name);

export const createFlagImpl = (left, right, p) => {
  const r = p.createFlag();
  return (typeof r === "number" && r < 0) ? left(r) : right(r);
};

export const createFlagNameImpl = (left, right, p, name) => {
  const r = p.createFlag(name);
  return (typeof r === "number" && r < 0) ? left(r) : right(r);
};

export const createFlagNameColorImpl = (left, right, p, name, color) => {
  const r = p.createFlag(name, color);
  return (typeof r === "number" && r < 0) ? left(r) : right(r);
};

export const createFlagNameColorSecondaryColorImpl = (left, right, p, name, color, secondaryColor) => {
  const r = p.createFlag(name, color, secondaryColor);
  return (typeof r === "number" && r < 0) ? left(r) : right(r);
};
