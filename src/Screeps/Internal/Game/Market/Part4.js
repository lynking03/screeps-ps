export const extendOrderImpl = (orderId, addAmount) => Game.market.extendOrder(orderId, addAmount);
export const getAllOrdersImpl = () => Game.market.getAllOrders();
export const getAllOrdersFilterImpl = (filter) => Game.market.getAllOrders(filter);
export const getHistoryImpl = () => Game.market.getHistory();
export const getHistoryResourceTypeImpl = (resourceType) => Game.market.getHistory(resourceType);
