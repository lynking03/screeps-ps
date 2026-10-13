export const newCostMatrix = () => new PathFinder.CostMatrix();
export const setImpl = (m, x, y, cost) => m.set(x, y, cost);
export const getImpl = (m, x, y) => m.get(x, y);
