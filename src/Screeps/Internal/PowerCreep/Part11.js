export const suicideImpl = (pc) => pc.suicide();
export const transferImpl = (pc, target, resourceType) => pc.transfer(target, resourceType);
export const transferAmountImpl = (pc, target, resourceType, amount) => pc.transfer(target, resourceType, amount);
export const upgradeImpl = (pc, power) => pc.upgrade(power);
