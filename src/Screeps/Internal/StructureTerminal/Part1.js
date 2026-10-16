export const cooldown = (t) => t.cooldown;
export const store = (t) => t.store;
export const sendImpl = (t, resourceType, amount, destination) => t.send(resourceType, amount, destination);
export const sendDescriptionImpl = (t, resourceType, amount, destination, description) => t.send(resourceType, amount, destination, description);
