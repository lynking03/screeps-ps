// `Memory` is re-parsed on first access each tick, so it is only referenced
// inside function bodies.
const isObj = (x) => x !== null && typeof x === "object";

export const memoryImpl = () => Memory;

export const getImpl = (key) => Memory[key];

export const setImpl = (key, value) => {
  Memory[key] = value;
};

export const deleteImpl = (key) => {
  delete Memory[key];
};

export const getPathImpl = (path) => {
  let cur = Memory;
  for (let i = 0; i < path.length; i++) {
    if (!isObj(cur)) return undefined;
    cur = cur[path[i]];
  }
  return cur;
};

export const setPathImpl = (path, value) => {
  if (path.length === 0) return;
  let cur = Memory;
  for (let i = 0; i < path.length - 1; i++) {
    const k = path[i];
    if (!isObj(cur[k])) cur[k] = {};
    cur = cur[k];
  }
  cur[path[path.length - 1]] = value;
};

export const deletePathImpl = (path) => {
  if (path.length === 0) return;
  let cur = Memory;
  for (let i = 0; i < path.length - 1; i++) {
    cur = cur[path[i]];
    if (!isObj(cur)) return;
  }
  delete cur[path[path.length - 1]];
};
