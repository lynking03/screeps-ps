export const newRoomVisual = () => new RoomVisual();
export const newRoomVisualRoomNameImpl = (name) => new RoomVisual(name);
export const roomName = (v) => v.roomName;
export const lineImpl = (v, p1, p2, style) => v.line(p1, p2, style);
export const lineXYImpl = (v, x1, y1, x2, y2, style) => v.line(x1, y1, x2, y2, style);
