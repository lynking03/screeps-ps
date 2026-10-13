// Global constructors (Creep, StructureTower, ...) are stable across ticks.
export const instanceOfImpl = (name, x) => {
  const g = typeof global !== "undefined" ? global : globalThis;
  const C = g[name];
  return typeof C === "function" && x instanceof C;
};
