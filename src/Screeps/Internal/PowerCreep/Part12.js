export const usePowerImpl = (pc, power) => pc.usePower(power);
export const usePowerTargetImpl = (pc, power, target) => pc.usePower(power, target);
export const withdrawImpl = (pc, target, resourceType) => pc.withdraw(target, resourceType);
export const withdrawAmountImpl = (pc, target, resourceType, amount) => pc.withdraw(target, resourceType, amount);
