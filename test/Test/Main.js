export const newTower = () => new StructureTower();
export const registerObject = (id) => (obj) => () => {
  const prev = Game.getObjectById;
  Game.getObjectById = (q) => (q === id ? obj : prev(q));
};
