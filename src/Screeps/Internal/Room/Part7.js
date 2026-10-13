export const lookAtImpl = (room, target) => room.lookAt(target);
export const lookAtXYImpl = (room, x, y) => room.lookAt(x, y);
export const lookAtAreaImpl = (room, top, left, bottom, right) => room.lookAtArea(top, left, bottom, right);
export const lookAtAreaAsArrayImpl = (room, top, left, bottom, right, asArray) => room.lookAtArea(top, left, bottom, right, asArray);
export const lookForAtImpl = (room, type, target) => room.lookForAt(type, target);
export const lookForAtXYImpl = (room, type, x, y) => room.lookForAt(type, x, y);
