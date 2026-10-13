export const signControllerImpl = (c, controller, text) => c.signController(controller, text);
export const suicideImpl = (c) => c.suicide();
export const transferImpl = (c, target, resourceType) => c.transfer(target, resourceType);
export const transferAmountImpl = (c, target, resourceType, amount) => c.transfer(target, resourceType, amount);
