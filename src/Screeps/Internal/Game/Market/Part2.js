export const orders = () => Game.market.orders;
export const calcTransactionCostImpl = (amount, roomName1, roomName2) => Game.market.calcTransactionCost(amount, roomName1, roomName2);
export const cancelOrderImpl = (orderId) => Game.market.cancelOrder(orderId);
