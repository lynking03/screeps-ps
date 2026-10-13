export const deleteImpl = (pc) => pc.delete();
export const deleteCancelImpl = (pc, cancel) => pc.delete(cancel);
export const dropImpl = (pc, resourceType) => pc.drop(resourceType);
export const dropAmountImpl = (pc, resourceType, amount) => pc.drop(resourceType, amount);
export const enableRoomImpl = (pc, controller) => pc.enableRoom(controller);
