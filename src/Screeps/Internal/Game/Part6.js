export const getObjectByIdImpl = (id) => {
  return Game.getObjectById(id);
};

export const notifyImpl = (message) => {
  Game.notify(message);
};

export const notifyGroupIntervalImpl = (message, groupInterval) => {
  Game.notify(message, groupInterval);
};
